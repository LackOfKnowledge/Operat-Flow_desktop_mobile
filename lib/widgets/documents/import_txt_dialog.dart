import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io';

import 'package:operat_flow/theme.dart';

final selectedFileProvider = StateProvider<PlatformFile?>((ref) => null);

class ImportTxtDialog extends ConsumerWidget {
  final int projectId;

  const ImportTxtDialog({super.key, required this.projectId});

  /// Otwiera systemowe okno wyboru pliku
  void _pickFile(WidgetRef ref) async {
    // Pozwól tylko na pliki .txt
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['txt'],
    );

    if (result != null) {
      ref.read(selectedFileProvider.notifier).state = result.files.first;
      // TODO: Wczytać kilka pierwszych linii pliku do podglądu
    }
  }

  /// Przetwarza import
  void _processImport(BuildContext context, WidgetRef ref) {
    final selectedFile = ref.read(selectedFileProvider);
    if (selectedFile == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Najpierw wybierz plik'),
          backgroundColor: warningColor,
        ),
      );
      return;
    }

    // TODO: Implementacja logiki parsowania pliku (Krok 3 z roadmapy)
    // TODO: Implementacja generowania PDF z danych (Krok 4 z roadmapy)
    // TODO: Zapisanie rekordu 'Document' do bazy Drift (Krok 5 z roadmapy)

    print('Importowanie pliku: ${selectedFile.path}');

    Navigator.of(context).pop(); // Zamknij dialog po "sukcesie"
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;
    final selectedFile = ref.watch(selectedFileProvider);

    return AlertDialog(
      title: const Text('Importuj Wykaz Współrzędnych (.txt)'),
      content: ConstrainedBox(
        constraints:
        const BoxConstraints(maxWidth: 500, minWidth: 400),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Krok 1: Wybierz plik', style: textTheme.titleMedium),
              const SizedBox(height: 16),
              Row(
                children: [
                  OutlinedButton.icon(
                    onPressed: () => _pickFile(ref),
                    icon: const Icon(Icons.upload_file_outlined),
                    label: const Text('Wybierz plik...'),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Text(
                      selectedFile?.name ?? 'Nie wybrano pliku',
                      style: textTheme.bodySmall?.copyWith(color: selectedFile != null ? primaryText : tertiaryText),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              const Divider(height: 32),
              Text('Krok 2: Skonfiguruj parser', style: textTheme.titleMedium),
              const SizedBox(height: 16),
              // TODO: Dodać Dropdowny do mapowania kolumn (X, Y, H, Nazwa)
              // TODO: Dodać pole do wyboru separatora
              TextFormField(
                initialValue: ",",
                decoration: const InputDecoration(
                  labelText: 'Separator kolumn (np. , ; tab)',
                ),
              ),
              const SizedBox(height: 16),
              Text('Podgląd (pierwsze 5 linii):', style: textTheme.bodySmall),
              Container(
                height: 100,
                width: double.infinity,
                padding: const EdgeInsets.all(8),
                color: baseBackground,
                child: Text(
                  '// TODO: Wczytaj podgląd pliku...\n1, 1000.00, 2000.00, 100.00\n2, 1001.00, 2001.00, 100.10',
                  style: textTheme.bodySmall?.copyWith(fontFamily: 'monospace'),
                ),
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            ref.read(selectedFileProvider.notifier).state = null; // Wyczyść stan
            Navigator.of(context).pop();
          },
          child: const Text('Anuluj'),
        ),
        ElevatedButton.icon(
          onPressed: () => _processImport(context, ref),
          icon: const Icon(Icons.download_done_outlined, size: 18),
          label: const Text('Importuj'),
        ),
      ],
    );
  }
}