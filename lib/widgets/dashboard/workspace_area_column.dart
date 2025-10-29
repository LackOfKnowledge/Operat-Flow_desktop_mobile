import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:operat_flow/providers/dashboard_providers.dart';
import 'package:operat_flow/theme.dart';

class WorkspaceAreaColumn extends ConsumerWidget {
  const WorkspaceAreaColumn({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedProjectId = ref.watch(selectedProjectIdProvider);
    final selectedDocumentId = ref.watch(selectedDocumentIdProvider);
    final textTheme = Theme.of(context).textTheme;

    if (selectedProjectId == null) {
      return Expanded(
        child: Container(
          color: baseBackground,
          child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.folder_open_outlined,
                      size: 48, color: tertiaryText),
                  const SizedBox(height: 16),
                  Text(
                    'Obszar Roboczy',
                    style: textTheme.titleLarge?.copyWith(color: secondaryText),
                  ),
                  const SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32.0),
                    child: Text(
                      'Wybierz projekt z listy po lewej, aby rozpocząć.',
                      style: textTheme.bodyMedium?.copyWith(color: tertiaryText),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              )),
        ),
      );
    }

    if (selectedDocumentId == null) {
      return Expanded(
        child: Container(
          color: baseBackground,
          child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.edit_note_outlined,
                      size: 48, color: tertiaryText),
                  const SizedBox(height: 16),
                  Text(
                    'Wybierz dokument',
                    style: textTheme.titleLarge?.copyWith(color: secondaryText),
                  ),
                  const SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32.0),
                    child: Text(
                      'Wybierz dokument ze środkowej kolumny, aby rozpocząć edycję lub podgląd.',
                      style: textTheme.bodyMedium?.copyWith(color: tertiaryText),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              )),
        ),
      );
    }

    // TODO: Widok, gdy dokument jest wybrany (np. formularz edycji)
    return Expanded(
      child: Container(
        color: baseBackground,
        child: Center(
          child: Text(
              'Wybrano Dokument ID: $selectedDocumentId (Implementacja w toku...)'),
        ),
      ),
    );
  }
}