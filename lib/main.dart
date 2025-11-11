import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:operat_flow/theme.dart';
import 'package:operat_flow/widgets/editor/tinymce_editor.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OperatFlow',
      theme: appTheme,
      debugShowCheckedModeBanner: false,
      home: const TinymceDemoScreen(),
    );
  }
}

class TinymceDemoScreen extends StatefulWidget {
  const TinymceDemoScreen({super.key});

  @override
  State<TinymceDemoScreen> createState() => _TinymceDemoScreenState();
}

class _TinymceDemoScreenState extends State<TinymceDemoScreen> {
  final _editorKey = GlobalKey<TinymceEditorState>();
  String _latest = '';
  final _initial = "<p><strong>Hello, TinyMCE!</strong> 📝</p>";

  Future<void> _getContent() async {
    final state = _editorKey.currentState;
    if (state == null) return;
    final html = await state.getContent();
    if (!mounted) return;
    setState(() => _latest = html);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Pobrano treść (${html.length} znaków)")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('TinyMCE Demo')),
      body: Column(
        children: [
          Expanded(
            child: TinymceEditor(
              key: _editorKey,
              initialValue: _initial,
              onContentChanged: (html) {
                // np. autosave
              },
            ),
          ),
          SizedBox(
            height: 56,
            child: Row(
              children: [
                const SizedBox(width: 12),
                ElevatedButton(
                  onPressed: _getContent,
                  child: const Text("Pobierz treść"),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    _latest.isEmpty
                        ? "Treść jeszcze nie pobrana"
                        : "Ostatnio pobrane: ${_latest.length} znaków",
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(width: 12),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
