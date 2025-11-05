import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final editorUrl = WebUri("http://127.0.0.1:8080/tinymce/editor.html");

class TinymceEditor extends ConsumerStatefulWidget {
  final String? initialValue;
  final Function(String content) onContentChanged;

  const TinymceEditor({
    super.key,
    this.initialValue,
    required this.onContentChanged,
  });

  @override
  ConsumerState<TinymceEditor> createState() => _TinymceEditorState();
}

class _TinymceEditorState extends ConsumerState<TinymceEditor> {
  InAppWebViewController? _webViewController;
  bool _isEditorReady = false;
  bool _didLoadEditor = false; 

  String _safeJavaScriptString(String? text) {
    if (text == null) return '';
    return text
        .replaceAll(r'\', r'\\')
        .replaceAll(r"'", r"\'")
        .replaceAll(r'"', r'\"')
        .replaceAll(r"\n", r"\n")
        .replaceAll(r"\r", r"\r");
  }

  void _setContent(String? content) {
    if (_webViewController != null && _isEditorReady) {
      final safeContent = _safeJavaScriptString(content);
      _webViewController!.evaluateJavascript(
          source: "window.setContent('$safeContent');"
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return InAppWebView(
      
      initialSettings: InAppWebViewSettings(
        javaScriptEnabled: true,
        useShouldOverrideUrlLoading: true,
        builtInZoomControls: false,
        supportZoom: false,
        verticalScrollBarEnabled: false,
        horizontalScrollBarEnabled: false,
        disableVerticalScroll: true,
        disableHorizontalScroll: true,
        javaScriptCanOpenWindowsAutomatically: true,
        allowFileAccess: true, 
        allowUniversalAccessFromFileURLs: true,
        clearCache: false,
        mediaPlaybackRequiresUserGesture: false,
        allowsInlineMediaPlayback: true,
      ),

      onConsoleMessage: (controller, consoleMessage) {
        debugPrint("JS: ${consoleMessage.message} [${consoleMessage.messageLevel}]");
      },
      
      onWebViewCreated: (controller) {
        _webViewController = controller;

        controller.addJavaScriptHandler(
          handlerName: 'onEditorReady',
          callback: (args) {
            setState(() {
              _isEditorReady = true;
            });
            _setContent(widget.initialValue);
          },
        );

        controller.addJavaScriptHandler(
          handlerName: 'onContentChanged',
          callback: (args) {
            widget.onContentChanged(args[0] as String);
          },
        );

        if (!_didLoadEditor) {
          _didLoadEditor = true;
          debugPrint('Ładuję URL: $editorUrl');
          _webViewController!.loadUrl(urlRequest: URLRequest(url: editorUrl));
        }
      },
      onLoadStop: (controller, url) async {
        debugPrint("onLoadStop: $url");
        if (url == editorUrl) {
          _setContent(widget.initialValue);
        }
      },

      onLoadError: (controller, url, code, message) {
        debugPrint("BŁĄD ŁADOWANIA WEBVIEW: $message (Kod: $code, URL: $url)");
      },
      onLoadHttpError: (controller, url, statusCode, description) {
        debugPrint("BŁĄD HTTP WEBVIEW: $description (Kod: $statusCode, URL: $url)");
      },

      onLoadResource: (controller, resource) {
        debugPrint('RES: Ładowanie zasobu ${resource.url}');
      },
    );
  }
}