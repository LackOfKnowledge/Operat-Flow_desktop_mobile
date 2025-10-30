import 'package:drift/drift.dart' as d;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:operat_flow/providers/dashboard_providers.dart';
import 'package:operat_flow/theme.dart';
import 'package:operat_flow/database/database.dart';

class DocumentListColumn extends ConsumerWidget {
  const DocumentListColumn({super.key});

  void _onDocumentMenuSelected(
      String result, WidgetRef ref, int projectId) async {
    // TODO: Logika dodawania dokumentów
    if (result == 'new_report') {
      final db = ref.read(databaseProvider);

      final currentDocs =
      await ref.read(documentsForProjectProvider(projectId).future);

      final newDoc = DocumentsCompanion(
        projectId: d.Value(projectId),
        name: d.Value('Nowe Sprawozdanie.docx'),
        type: d.Value('report'),
        sortOrder: d.Value(currentDocs.length + 1),
      );
      await db.insertDocument(newDoc);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    final selectedProjectId = ref.watch(selectedProjectIdProvider);
    final currentSelectedDocId = ref.watch(selectedDocumentIdProvider);

    if (selectedProjectId == null) {
      return Container(
        color: colorScheme.surface,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Wybierz projekt z listy po lewej, aby zobaczyć jego dokumenty.',
              textAlign: TextAlign.center,
              style: textTheme.bodyMedium?.copyWith(color: secondaryText),
            ),
          ),
        ),
      );
    }

    final documentsAsyncValue =
    ref.watch(documentsForProjectProvider(selectedProjectId));

    return Container(
      color: colorScheme.surface,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Dokumenty', style: textTheme.titleLarge),
                PopupMenuButton<String>(
                  tooltip: "Dodaj dokument",
                  offset: const Offset(0, 40),
                  onSelected: (result) =>
                      _onDocumentMenuSelected(result, ref, selectedProjectId),
                  itemBuilder: (BuildContext context) =>
                  <PopupMenuEntry<String>>[
                    const PopupMenuItem<String>(
                      value: 'import_txt',
                      child: ListTile(
                          leading: Icon(Icons.upload_file),
                          title: Text('Importuj Wykaz Współrzędnych (.txt)')),
                    ),
                    const PopupMenuItem<String>(
                      value: 'new_report',
                      child: ListTile(
                          leading: Icon(Icons.note_add_outlined),
                          title: Text('Nowe Sprawozdanie / Protokół')),
                    ),
                    const PopupMenuDivider(),
                    const PopupMenuItem<String>(
                      value: 'upload_pdf',
                      child: ListTile(
                          leading: Icon(Icons.attach_file),
                          title: Text('Załącz Plik (PDF/JPG/PNG)')),
                    ),
                  ],
                  icon: const Icon(Icons.add_circle_outline,
                      color: secondaryText),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    side: const BorderSide(color: borderColor),
                  ),
                  elevation: 2,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Przeciągnij, aby zmienić kolejność',
                style: textTheme.bodySmall?.copyWith(color: tertiaryText),
              ),
            ),
          ),
          const SizedBox(height: 8),
          const Divider(height: 1, thickness: 1, color: borderColor),
          Expanded(
            // TODO: Zaimplementować ReorderableListView
            child: documentsAsyncValue.when(
              data: (documents) {
                if (documents.isEmpty) {
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        'Brak dokumentów w tym projekcie.\nUżyj menu "Dodaj", aby dodać pierwszy.',
                        textAlign: TextAlign.center,
                        style: textTheme.bodyMedium
                            ?.copyWith(color: secondaryText),
                      ),
                    ),
                  );
                }
                return ListView.builder(
                  itemCount: documents.length,
                  itemBuilder: (context, index) {
                    final doc = documents[index];
                    bool isSelected = currentSelectedDocId == doc.id;

                    Color statusColorDoc =
                    doc.status == 'Gotowy' ? successColor : warningColor;
                    Color statusBgColorDoc = doc.status == 'Gotowy'
                        ? successColor.withOpacity(0.15)
                        : warningColor.withOpacity(0.15);

                    IconData iconData = Icons.description_outlined;
                    if (doc.type == 'map') iconData = Icons.map_outlined;
                    if (doc.type == 'coord_list') {
                      iconData = Icons.pin_drop_outlined;
                    }

                    return Material(
                      color: isSelected
                          ? successColor.withOpacity(0.1)
                          : Colors.transparent,
                      child: InkWell(
                        onTap: () {
                          ref.read(selectedDocumentIdProvider.notifier).state =
                              doc.id;
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 8.0),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: const BorderSide(color: borderColor),
                              left: BorderSide(
                                  color: isSelected
                                      ? successColor
                                      : Colors.transparent,
                                  width: 4),
                            ),
                          ),
                          child: Row(
                            children: [
                              const Padding(
                                padding:
                                EdgeInsets.symmetric(horizontal: 8.0),
                                child: Icon(Icons.drag_indicator,
                                    color: tertiaryText, size: 20),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text('${doc.sortOrder}.',
                                            style: textTheme.bodySmall
                                                ?.copyWith(
                                                color: tertiaryText,
                                                fontWeight:
                                                FontWeight.w600)),
                                        const SizedBox(width: 6),
                                        Expanded(
                                            child: Text(doc.name,
                                                style: textTheme.bodyMedium
                                                    ?.copyWith(
                                                    fontWeight:
                                                    FontWeight.w500),
                                                overflow:
                                                TextOverflow.ellipsis)),
                                      ],
                                    ),
                                    const SizedBox(height: 4),
                                    Chip(
                                      label: Text(
                                        doc.status,
                                        style: textTheme.bodySmall?.copyWith(
                                            color: statusColorDoc,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 6, vertical: 0),
                                      visualDensity: VisualDensity.compact,
                                      backgroundColor: statusBgColorDoc,
                                      side: BorderSide.none,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadius.circular(6)),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0),
                                child: Icon(iconData,
                                    color: secondaryText, size: 20),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error, stack) =>
                  Center(child: Text('Błąd ładowania dokumentów: $error')),
            ),
          ),

          if (documentsAsyncValue.value != null && (documentsAsyncValue.value?.isNotEmpty ?? false)) ...[
            const Divider(height: 1, thickness: 1, color: borderColor),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 48),
                ),
                onPressed: () {
                  /* TODO: Logika kompilacji i podglądu PDF */
                },
                icon: const Icon(Icons.preview_outlined, size: 20),
                label: const Text('Kompiluj i Podgląd'),
              ),
            ),
          ]
        ],
      ),
    );
  }
}