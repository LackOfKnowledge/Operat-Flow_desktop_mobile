import 'package:flutter/material.dart';
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

  final WebUri _editorUrl =
  WebUri("http://127.0.0.1:8080/tinymce/editor.html");

  String _safeJavaScriptString(String? text) {
    if (text == null) return '';
    return text
        .replaceAll(r'\', r'\\')
        .replaceAll(r"'", r"\'")
        .replaceAll(r'"', r'\"')
        .replaceAll("\n", r"\n")
        .replaceAll("\r", r"\r");
  }

  void _setContent(String? content) {
    if (_webViewController != null && _isEditorReady) {
      final safeContent = _safeJavaScriptString(content);
      _webViewController!.evaluateJavascript(
        source: "window.setContent('$safeContent');",
      );
    }
  }

  Future<String> getContent() async {
    if (_webViewController == null) return '';
    final result = await _webViewController!.evaluateJavascript(
      source: "window.getContent();",
    );
    if (result is String) return result;
    return result?.toString() ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return InAppWebView(
      initialUrlRequest: URLRequest(url: _editorUrl),

      initialSettings: InAppWebViewSettings(
        javaScriptEnabled: true,

        useShouldOverrideUrlLoading: false,

        builtInZoomControls: false,
        supportZoom: false,
        verticalScrollBarEnabled: false,
        horizontalScrollBarEnabled: false,
        disableVerticalScroll: true,
        disableHorizontalScroll: true,
        javaScriptCanOpenWindowsAutomatically: true,

        allowFileAccess: true,
        allowUniversalAccessFromFileURLs: true,

        isInspectable: true,
      ),

      onLoadStart: (controller, url) {
        debugPrint("LOAD_START: $url");
      },

      onTitleChanged: (controller, title) {
        debugPrint("TITLE: $title");
      },

      onConsoleMessage: (controller, consoleMessage) {
        debugPrint(
            "JS: ${consoleMessage.message} [${consoleMessage.messageLevel}]");
      },

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

        Future.delayed(const Duration(milliseconds: 60), () async {
          final current = await _webViewController?.getUrl();
          if (current == null || current.toString() == 'about:blank') {
            debugPrint("Retrying load to $_editorUrl (was about:blank)");
            await _webViewController
                ?.loadUrl(urlRequest: URLRequest(url: _editorUrl));
          }
        });
      },

      onLoadStop: (controller, url) async {
        debugPrint("LOAD_STOP: $url");
        _setContent(widget.initialValue);
      },

      onLoadError: (controller, url, code, message) {
        debugPrint("WEBVIEW ERROR: $message (code: $code, url: $url)");
      },

      onLoadHttpError: (controller, url, statusCode, description) {
        debugPrint(
            "WEBVIEW HTTP: $description (status: $statusCode, url: $url)");
      },
    );
  }
}
