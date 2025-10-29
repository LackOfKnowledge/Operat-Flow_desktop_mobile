import 'package:drift/drift.dart';

@DataClassName('Project')
class Projects extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get kerg => text().unique()();

  TextColumn get workType => text()();

  TextColumn get clientName => text()();

  TextColumn get locationVoivodeship => text().nullable()();
  TextColumn get locationCommune => text().nullable()();
  TextColumn get locationPrecinct => text().nullable()();
  TextColumn get locationPlotNumbers => text().nullable()();

  TextColumn get coordSystem => text().nullable()();
  TextColumn get heightSystem => text().nullable()();

  IntColumn get managerUserId => integer().nullable()(); // TODO: Powiązać z tabelą Użytkowników

  TextColumn get status => text().withDefault(const Constant('Roboczy'))();

  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();

// TODO: Dodać klucz obcy do tabeli Firmy (companyId), gdy powstanie
}

// TODO: Zdefiniować inne tabele (Documents, Users, Companies, DocumentContents itp.)