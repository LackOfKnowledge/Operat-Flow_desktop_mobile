import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:operat_flow/providers/dashboard_providers.dart';
import 'package:operat_flow/theme.dart';

/// Kolumna wyświetlająca listę dokumentów dla wybranego projektu
class DocumentListColumn extends ConsumerWidget {
  const DocumentListColumn({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    final selectedProjectId = ref.watch(selectedProjectIdProvider);

    // TODO: Zastąpić mockowe dane pobieraniem dokumentów dla wybranego projektu z bazy
    // final documentsAsyncValue = ref.watch(documentsForProjectProvider(selectedProjectId));

    final List<Map<String, dynamic>> documents = [
      {
        'name': 'Sprawozdanie Techniczne.docx',
        'icon': Icons.description_outlined,
        'status': 'Roboczy'
      },
      {
        'name': 'Wykaz Współrzędnych.pdf',
        'icon': Icons.pin_drop_outlined,
        'status': 'Gotowy'
      },
      {
        'name': 'Mapa Zasadnicza.pdf',
        'icon': Icons.map_outlined,
        'status': 'Gotowy'
      },
      {
        'name': 'Szkic Polowy 1.jpg',
        'icon': Icons.image_outlined,
        'status': 'Roboczy'
      },
    ];

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
                  onSelected: (String result) {
                    // TODO: Logika dodawania dokumentów
                  },
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
            // TODO: Zaimplementować logikę ReorderableListView po podpięciu do bazy
            child: documents.isEmpty
                ? Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Brak dokumentów w tym projekcie.\nUżyj menu "Dodaj", aby dodać pierwszy.',
                  textAlign: TextAlign.center,
                  style: textTheme.bodyMedium
                      ?.copyWith(color: secondaryText),
                ),
              ),
            )
                : ListView.builder(
              itemCount: documents.length,
              itemBuilder: (context, index) {
                final doc = documents[index];
                // TODO: Zaimplementować logikę zaznaczania dokumentu
                bool isSelected = index == 0;

                Color statusColorDoc = doc['status'] == 'Gotowy'
                    ? successColor
                    : warningColor;
                Color statusBgColorDoc = doc['status'] == 'Gotowy'
                    ? successColor.withOpacity(0.15)
                    : warningColor.withOpacity(0.15);

                return Material(
                  color: isSelected
                      ? successColor.withOpacity(0.1)
                      : Colors.transparent,
                  child: InkWell(
                    onTap: () {
                      // TODO: Logika zaznaczania dokumentu i wyświetlania w Workspace
                      // ref.read(selectedDocumentIdProvider.notifier).state = doc['id'];
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
                          // TODO: Użyć ReorderableDragStartListener lub podobnego dla uchwytu
                          const Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 8.0),
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
                                    Text('${index + 1}.',
                                        style: textTheme.bodySmall
                                            ?.copyWith(
                                            color: tertiaryText,
                                            fontWeight:
                                            FontWeight.w600)),
                                    const SizedBox(width: 6),
                                    Expanded(
                                        child: Text(doc['name'],
                                            style: textTheme
                                                .bodyMedium
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
                                    doc['status'],
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
                            child: Icon(doc['icon'],
                                color: secondaryText, size: 20),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          if (documents.isNotEmpty) ...[
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