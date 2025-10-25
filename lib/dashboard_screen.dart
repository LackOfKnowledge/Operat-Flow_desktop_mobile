import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:operat_flow/theme.dart';

class ProjectListColumn extends ConsumerWidget {
  const ProjectListColumn({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      width: 320,
      color: colorScheme.surface,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Projekty', style: textTheme.titleLarge),
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        textStyle: textTheme.labelLarge?.copyWith(fontSize: 13),
                        minimumSize: Size.zero,
                      ),
                      onPressed: () { /* TODO: Logika tworzenia projektu */ },
                      icon: const Icon(Icons.add, size: 18),
                      label: const Text('Nowy'),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                SizedBox(
                  height: 40,
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: 'Szukaj...',
                        prefixIcon: const Icon(Icons.search, size: 20, color: secondaryText),
                        contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 12),
                        filled: true,
                        fillColor: baseBackground,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: const BorderSide(color: borderColor),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: const BorderSide(color: borderColor),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide(color: infoColor, width: 1.5),
                        ),
                        hintStyle: textTheme.bodySmall?.copyWith(color: tertiaryText)
                    ),
                    style: textTheme.bodyMedium?.copyWith(fontSize: 13),
                  ),
                ),
              ],
            ),
          ),
          const Divider(height: 1, thickness: 1, color: borderColor),
          Expanded(
            child: ListView.builder(
              itemCount: 20,
              itemBuilder: (context, index) {
                bool isSelected = index == 0;
                return Material(
                  color: isSelected ? infoColor.withOpacity(0.1) : Colors.transparent,
                  child: InkWell(
                    onTap: () { /* TODO: Logika zaznaczania projektu */ },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: const BorderSide(color: borderColor),
                          left: BorderSide(color: isSelected ? infoColor : Colors.transparent, width: 4),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.folder_open_outlined, size: 16, color: infoColor),
                                  const SizedBox(width: 8),
                                  Text(
                                    'KERG-2025-${index + 1}',
                                    style: textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                              Chip(
                                label: Text(
                                  index % 3 == 0 ? 'Roboczy' : (index % 3 == 1 ? 'Wysłany' : 'Podpisany'),
                                  style: textTheme.bodySmall?.copyWith(
                                      color: index % 3 == 0 ? secondaryText : (index % 3 == 1 ? infoColor : successColor),
                                      fontWeight: FontWeight.w600
                                  ),
                                ),
                                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 0),
                                visualDensity: VisualDensity.compact,
                                backgroundColor: index % 3 == 0 ? baseBackground : (index % 3 == 1 ? infoColor.withOpacity(0.15) : successColor.withOpacity(0.15)),
                                side: BorderSide.none,
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Text('Klient: Firma ${index + 1}', style: textTheme.bodySmall),
                          const SizedBox(height: 2),
                          Row(
                            children: [
                              Text('Podział', style: textTheme.bodySmall?.copyWith(color: tertiaryText)),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                                child: Text('•', style: textTheme.bodySmall?.copyWith(color: borderColor)),
                              ),
                              Text('Gmina Testowa', style: textTheme.bodySmall?.copyWith(color: tertiaryText)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class DocumentListColumn extends ConsumerWidget {
  const DocumentListColumn({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    final List<Map<String, dynamic>> documents = [
      {'name': 'Sprawozdanie Techniczne.docx', 'icon': Icons.description_outlined, 'status': 'Roboczy'},
      {'name': 'Wykaz Współrzędnych.pdf', 'icon': Icons.pin_drop_outlined, 'status': 'Gotowy'},
      {'name': 'Mapa Zasadnicza.pdf', 'icon': Icons.map_outlined, 'status': 'Gotowy'},
      {'name': 'Szkic Polowy 1.jpg', 'icon': Icons.image_outlined, 'status': 'Roboczy'},
    ];

    return Container(
      width: 400,
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
                    if (result == 'import_txt') {
                      // TODO: Logika importu TXT
                    } else if (result == 'new_report') {
                      // TODO: Logika dodania nowego raportu (TinyMCE)
                    } else if (result == 'upload_pdf') {
                      // TODO: Logika wgrania PDF/obrazka
                    }
                  },
                  itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                    const PopupMenuItem<String>(
                      value: 'import_txt',
                      child: ListTile(leading: Icon(Icons.upload_file), title: Text('Importuj Wykaz Współrzędnych (.txt)')),
                    ),
                    const PopupMenuItem<String>(
                      value: 'new_report',
                      child: ListTile(leading: Icon(Icons.note_add_outlined), title: Text('Nowe Sprawozdanie / Protokół')),
                    ),
                    const PopupMenuDivider(),
                    const PopupMenuItem<String>(
                      value: 'upload_pdf',
                      child: ListTile(leading: Icon(Icons.attach_file), title: Text('Załącz Plik (PDF/JPG/PNG)')),
                    ),
                  ],
                  child: OutlinedButton.icon(
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      textStyle: textTheme.labelLarge?.copyWith(fontSize: 13),
                      minimumSize: Size.zero,
                      side: const BorderSide(color: borderColor),
                    ),
                    onPressed: null,
                    icon: const Icon(Icons.add, size: 18),
                    label: const Text('Dodaj'),
                  ),
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
            // TODO: Zaimplementować logikę ReorderableListView
            child: ListView.builder(
              itemCount: documents.length,
              itemBuilder: (context, index) {
                final doc = documents[index];
                bool isSelected = index == 0;

                return Material(
                  color: isSelected ? successColor.withOpacity(0.1) : Colors.transparent,
                  child: InkWell(
                    onTap: () { /* TODO: Logika zaznaczania dokumentu */ },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: const BorderSide(color: borderColor),
                          left: BorderSide(color: isSelected ? successColor : Colors.transparent, width: 4),
                        ),
                      ),
                      child: Row(
                        children: [
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.0),
                            child: Icon(Icons.drag_indicator, color: tertiaryText, size: 20),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text('${index + 1}.', style: textTheme.bodySmall?.copyWith(color: tertiaryText, fontWeight: FontWeight.w600)),
                                    const SizedBox(width: 6),
                                    Expanded(child: Text(doc['name'], style: textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w500), overflow: TextOverflow.ellipsis)),
                                  ],
                                ),
                                const SizedBox(height: 4),
                                Chip(
                                  label: Text(
                                    doc['status'],
                                    style: textTheme.bodySmall?.copyWith(
                                        color: doc['status'] == 'Gotowy' ? successColor : warningColor,
                                        fontWeight: FontWeight.w600
                                    ),
                                  ),
                                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 0),
                                  visualDensity: VisualDensity.compact,
                                  backgroundColor: doc['status'] == 'Gotowy' ? successColor.withOpacity(0.15) : warningColor.withOpacity(0.15),
                                  side: BorderSide.none,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Icon(doc['icon'], color: secondaryText, size: 20),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          const Divider(height: 1, thickness: 1, color: borderColor),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 48),
              ),
              onPressed: () { /* TODO: Logika kompilacji i podglądu PDF */ },
              icon: const Icon(Icons.preview_outlined, size: 20),
              label: const Text('Kompiluj i Podgląd'),
            ),
          ),
        ],
      ),
    );
  }
}

class WorkspaceAreaColumn extends ConsumerWidget {
  const WorkspaceAreaColumn({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Expanded(
      child: Container(
        color: baseBackground,
        child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.edit_note, size: 48, color: tertiaryText),
                const SizedBox(height: 16),
                Text(
                  'Główny Obszar Roboczy',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(height: 8),
                Text(
                  'Wybierz dokument, aby go edytować lub podejrzeć.',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: secondaryText),
                  textAlign: TextAlign.center,
                ),
              ],
            )
        ),
      ),
    );
  }
}

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        leadingWidth: 200,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Row(
            children: [
              Container(
                width: 32, height: 32,
                decoration: BoxDecoration( color: successColor, borderRadius: BorderRadius.circular(8)),
                child: const Center(child: Text('OF', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14))),
              ),
              const SizedBox(width: 8),
              const Text('OperatFlow', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: primaryText)),
            ],
          ),
        ),
        title: Center(
          child: SizedBox(
            width: 400, height: 40,
            child: TextField(
              decoration: InputDecoration(
                  hintText: 'Szukaj projektów, dokumentów... (Ctrl+K)',
                  prefixIcon: const Icon(Icons.search, size: 20, color: tertiaryText),
                  contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 12),
                  filled: true, fillColor: baseBackground,
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0), borderSide: const BorderSide(color: borderColor)),
                  enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0), borderSide: const BorderSide(color: borderColor)),
                  focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0), borderSide: BorderSide(color: infoColor, width: 1.5)),
                  hintStyle: textTheme.bodySmall?.copyWith(color: tertiaryText)
              ),
              style: textTheme.bodyMedium?.copyWith(fontSize: 13),
            ),
          ),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(color: baseBackground, borderRadius: BorderRadius.circular(6)),
              child: const Row( // TODO: Logika zmiany statusu
                children: [
                  Icon(Icons.cloud_done_outlined, size: 16, color: successColor),
                  SizedBox(width: 4),
                  Text('Online', style: TextStyle(fontSize: 12, color: secondaryText)),
                ],
              ),
            ),
          ),
          const SizedBox(width: 8),
          TextButton.icon(
            style: TextButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                foregroundColor: secondaryText,
                textStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600)
            ),
            onPressed: () { /* TODO: Logika synchronizacji */ },
            icon: const Icon(Icons.sync, size: 16),
            label: const Text('Synchronizuj'),
          ),
          const SizedBox(width: 8),
          PopupMenuButton<String>(
            tooltip: "Menu użytkownika",
            offset: const Offset(0, 40),
            icon: CircleAvatar(
                radius: 16,
                backgroundColor: infoColor,
                child: Text(
                  'JK',
                  style: textTheme.bodySmall?.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
                )
            ),
            onSelected: (String result) { /* TODO: Logika menu */ },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              const PopupMenuItem<String>(value: 'profile', child: ListTile(leading: Icon(Icons.account_circle_outlined), title: Text('Profil'))),
              const PopupMenuItem<String>(value: 'settings', child: ListTile(leading: Icon(Icons.settings_outlined), title: Text('Ustawienia'))),
              const PopupMenuDivider(),
              PopupMenuItem<String>(value: 'logout', child: ListTile(leading: Icon(Icons.logout, color: errorColor), title: Text('Wyloguj się', style: TextStyle(color: errorColor)))),
            ],
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0), side: const BorderSide(color: borderColor)),
            elevation: 2,
          ),
          const SizedBox(width: 16),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: Container(color: borderColor, height: 1.0),
        ),
      ),
      body: Row(
        children: [
          const ProjectListColumn(),
          const VerticalDivider(width: 1, thickness: 1, color: borderColor),
          const DocumentListColumn(),
          const VerticalDivider(width: 1, thickness: 1, color: borderColor),
          const WorkspaceAreaColumn(),
          // TODO: Dodać widget do zmiany rozmiaru kolumn (np. pakiet resizable_widget)
        ],
      ),
    );
  }
}
