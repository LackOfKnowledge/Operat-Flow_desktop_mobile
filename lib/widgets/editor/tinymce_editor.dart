import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TinymceEditor extends ConsumerStatefulWidget {
  final String? initialValue;
  final Function(String content) onContentChanged;

  const TinymceEditor({
    super.key,
    this.initialValue,
    required this.onContentChanged,
  });

  @override
  TinymceEditorState createState() => TinymceEditorState();
}

class TinymceEditorState extends ConsumerState<TinymceEditor> {
  InAppWebViewController? _webViewController;
  bool _isEditorReady = false;
  String? _html;

  @override
  void initState() {
    super.initState();
    rootBundle.loadString('assets/tinymce/editor.html').then((s) {
      if (mounted) setState(() => _html = s);
    });
  }

  String _escape(String? s) => (s ?? '')
      .replaceAll(r'\', r'\\')
      .replaceAll("'", r"\'")
      .replaceAll('"', r'\"')
      .replaceAll("\n", r"\n")
      .replaceAll("\r", r"\r");

  void _setContent(String? content) {
    if (_webViewController != null && _isEditorReady) {
      _webViewController!.evaluateJavascript(
        source: "window.setContent('${_escape(content)}');",
      );
    }
  }

  Future<String> getContent() async {
    if (_webViewController == null || !_isEditorReady) return '';
    final result = await _webViewController!.evaluateJavascript(
      source: "window.getContent();",
    );
    if (result is String) return result;
    return result?.toString() ?? '';
  }

  @override
  Widget build(BuildContext context) {
    if (_html == null) {
      return const Center(
        child: CircularProgressIndicator(strokeWidth: 2),
      );
    }

    return InAppWebView(
      initialData: InAppWebViewInitialData(
        data: _html!,
        baseUrl: WebUri('asset://flutter_assets/assets/tinymce/'),
      ),
      initialSettings: InAppWebViewSettings(
        javaScriptEnabled: true,
        javaScriptCanOpenWindowsAutomatically: true,
        isInspectable: true,
        disableVerticalScroll: true,
        disableHorizontalScroll: true,
      ),
      onWebViewCreated: (controller) async {
        _webViewController = controller;

        controller.addJavaScriptHandler(
          handlerName: 'onEditorReady',
          callback: (args) {
            setState(() => _isEditorReady = true);
            _setContent(widget.initialValue);
            return null;
          },
        );

        controller.addJavaScriptHandler(
          handlerName: 'onContentChanged',
          callback: (args) {
            if (args.isNotEmpty && args[0] is String) {
              widget.onContentChanged(args[0] as String);
            }
            return null;
          },
        );
      },

      onLoadStart: (controller, url) {
        debugPrint("LOAD_START: $url");
      },
      onTitleChanged: (controller, title) {
        debugPrint("TITLE: $title");
      },
      onConsoleMessage: (controller, consoleMessage) {
        debugPrint("JS: ${consoleMessage.message} [${consoleMessage.messageLevel}]");
      },

      onLoadStop: (controller, url) async {
        debugPrint("LOAD_STOP: $url");
      },

      onLoadError: (controller, url, code, message) {
        debugPrint("WEBVIEW ERROR: $message (code: $code, url: $url)");
      },

      onLoadHttpError: (controller, url, statusCode, description) {
        debugPrint("WEBVIEW HTTP: $description (status: $statusCode, url: $url)");
      },
    );
  }
}
