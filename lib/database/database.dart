import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:sqlite3/sqlite3.dart';
import 'package:sqlite3_flutter_libs/sqlite3_flutter_libs.dart';
import 'package:operat_flow/database/tables.dart';

part 'database.g.dart';

@DriftDatabase(tables: [Projects, Documents])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 2;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (m) async {
        await m.createAll();
      },
      onUpgrade: (m, from, to) async {
        // TODO: W wersji produkcyjnej zastąpić to logiką 'ALTER TABLE'.
        for (final table in allTables) {
          await m.deleteTable(table.actualTableName);
        }
        await m.createAll();
      },
    );
  }

  // --- Metody Projects ---
  Stream<List<Project>> watchAllProjects() => (select(projects)
    ..orderBy(
        [(t) => OrderingTerm(expression: t.createdAt, mode: OrderingMode.desc)]))
      .watch();

  Future<int> insertProject(ProjectsCompanion project) =>
      into(projects).insert(project);

  Future<bool> updateProject(Project project) =>
      update(projects).replace(project);

  Future<int> deleteProject(Project project) =>
      delete(projects).delete(project);

  Future<Project?> getProjectById(int id) =>
      (select(projects)..where((t) => t.id.equals(id))).getSingleOrNull();

  Future<Project?> getProjectByKerg(String kerg) =>
      (select(projects)..where((t) => t.kerg.equals(kerg))).getSingleOrNull();

  // --- Metody Documents ---
  Stream<List<Document>> watchDocumentsForProject(int projectId) {
    return (select(documents)
      ..where((t) => t.projectId.equals(projectId))
      ..orderBy([(t) => OrderingTerm(expression: t.sortOrder)]))
        .watch();
  }

  Future<int> insertDocument(DocumentsCompanion document) =>
      into(documents).insert(document);
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'operatflow_db.sqlite'));

    if (Platform.isAndroid || Platform.isIOS) {
      await applyWorkaroundToOpenSqlite3OnOldAndroidVersions();
      final cachebase = (await getTemporaryDirectory()).path;
      sqlite3.tempDirectory = cachebase;
    }

    return NativeDatabase.createInBackground(file);
  });
}

// --- Providery ---
final databaseProvider = Provider<AppDatabase>((ref) {
  final db = AppDatabase();
  ref.onDispose(() => db.close());
  return db;
});

final projectsStreamProvider = StreamProvider<List<Project>>((ref) {
  final database = ref.watch(databaseProvider);
  return database.watchAllProjects();
});

final documentsForProjectProvider =
StreamProvider.family<List<Document>, int>((ref, projectId) {
  final database = ref.watch(databaseProvider);
  return database.watchDocumentsForProject(projectId);
});