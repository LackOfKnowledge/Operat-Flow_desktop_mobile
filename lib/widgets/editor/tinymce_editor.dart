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
  ConsumerState<TinymceEditor> createState() => _TinymceEditorState();
}

class _TinymceEditorState extends ConsumerState<TinymceEditor> {
  InAppWebViewController? _webViewController;
  bool _isEditorReady = false;

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
      initialFile: 'assets/tinymce/editor.html',
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
      ),
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
      },
      onLoadStop: (controller, url) async {
        _setContent(widget.initialValue);
      },
    );
  }
}