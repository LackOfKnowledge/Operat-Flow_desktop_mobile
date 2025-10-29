import 'package:drift/drift.dart' show Value;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:operat_flow/database/database.dart';
import 'package:operat_flow/providers/dashboard_providers.dart';
import 'package:operat_flow/theme.dart';

class ProjectListColumn extends ConsumerWidget {
  const ProjectListColumn({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    final projectsAsyncValue = ref.watch(projectsStreamProvider);
    final currentSelectedProjectId = ref.watch(selectedProjectIdProvider);

    return Container(
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
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 8),
                        textStyle:
                        textTheme.labelLarge?.copyWith(fontSize: 13),
                        minimumSize: Size.zero,
                      ),
                      onPressed: () async {
                        // TODO: Otworzyć Kreator Nowego Projektu
                        final db = ref.read(databaseProvider);
                        final newProject = ProjectsCompanion.insert(
                          kerg:
                          'KERG-${DateTime.now().millisecondsSinceEpoch}',
                          workType: 'Podział',
                          clientName:
                          'Testowy Klient ${DateTime.now().second}',
                        );
                        await db.insertProject(newProject);
                      },
                      icon: const Icon(Icons.add, size: 18),
                      label: const Text('Nowy'),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                SizedBox(
                  height: 40,
                  child: TextField(
                    // TODO: Implement search logic connected to database query
                    decoration: InputDecoration(
                        hintText: 'Szukaj...',
                        prefixIcon: const Icon(Icons.search,
                            size: 20, color: secondaryText),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 0, horizontal: 12),
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
                          borderSide:
                          BorderSide(color: infoColor, width: 1.5),
                        ),
                        hintStyle: textTheme.bodySmall
                            ?.copyWith(color: tertiaryText)),
                    style: textTheme.bodyMedium?.copyWith(fontSize: 13),
                  ),
                ),
              ],
            ),
          ),
          const Divider(height: 1, thickness: 1, color: borderColor),
          Expanded(
            child: projectsAsyncValue.when(
              data: (projects) {
                if (projects.isEmpty) {
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        'Brak projektów.\nNaciśnij "Nowy", aby dodać pierwszy projekt.',
                        textAlign: TextAlign.center,
                        style: textTheme.bodyMedium
                            ?.copyWith(color: secondaryText),
                      ),
                    ),
                  );
                }
                return ListView.builder(
                  itemCount: projects.length,
                  itemBuilder: (context, index) {
                    final project = projects[index];
                    bool isSelected =
                        currentSelectedProjectId == project.id;

                    Color statusColor = secondaryText;
                    Color statusBgColor = baseBackground;
                    switch (project.status) {
                      case 'Wysłany':
                        statusColor = infoColor;
                        statusBgColor = infoColor.withOpacity(0.15);
                        break;
                      case 'Podpisany':
                        statusColor = successColor;
                        statusBgColor = successColor.withOpacity(0.15);
                        break;
                      case 'Roboczy':
                      default:
                        statusColor = secondaryText;
                        statusBgColor =
                            baseBackground.withOpacity(0.8);
                        break;
                    }

                    return Material(
                      color: isSelected
                          ? infoColor.withOpacity(0.1)
                          : Colors.transparent,
                      child: InkWell(
                        onTap: () {
                          ref.read(selectedProjectIdProvider.notifier).state =
                              project.id;
                          ref.read(selectedDocumentIdProvider.notifier).state = null;
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 12.0),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: const BorderSide(color: borderColor),
                              left: BorderSide(
                                  color: isSelected
                                      ? infoColor
                                      : Colors.transparent,
                                  width: 4),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Row(
                                      children: [
                                        const Icon(
                                            Icons.folder_open_outlined,
                                            size: 16,
                                            color: infoColor),
                                        const SizedBox(width: 8),
                                        Flexible(
                                          child: Text(
                                            project.kerg,
                                            style: textTheme.bodyMedium
                                                ?.copyWith(
                                                fontWeight:
                                                FontWeight.w600),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Chip(
                                    label: Text(
                                      project.status,
                                      style: textTheme.bodySmall?.copyWith(
                                          color: statusColor,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 6, vertical: 0),
                                    visualDensity: VisualDensity.compact,
                                    backgroundColor: statusBgColor,
                                    side: BorderSide.none,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                        BorderRadius.circular(6)),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 4),
                              Text('Klient: ${project.clientName}',
                                  style: textTheme.bodySmall),
                              const SizedBox(height: 2),
                              Row(
                                children: [
                                  Text(project.workType,
                                      style: textTheme.bodySmall
                                          ?.copyWith(color: tertiaryText)),
                                  if (project.locationCommune != null &&
                                      project.locationCommune!.isNotEmpty) ...[
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 4.0),
                                      child: Text('•',
                                          style: textTheme.bodySmall
                                              ?.copyWith(color: borderColor)),
                                    ),
                                    Flexible(
                                      child: Text(
                                        project.locationCommune!,
                                        style: textTheme.bodySmall
                                            ?.copyWith(color: tertiaryText),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ]
                                ],
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
              error: (error, stackTrace) {
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'Wystąpił błąd podczas ładowania projektów.\nSpróbuj ponownie później.',
                      textAlign: TextAlign.center,
                      style:
                      textTheme.bodyMedium?.copyWith(color: errorColor),
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