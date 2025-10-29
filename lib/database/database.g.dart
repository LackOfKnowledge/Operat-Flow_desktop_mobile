// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $ProjectsTable extends Projects with TableInfo<$ProjectsTable, Project> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProjectsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _kergMeta = const VerificationMeta('kerg');
  @override
  late final GeneratedColumn<String> kerg = GeneratedColumn<String>(
    'kerg',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _workTypeMeta = const VerificationMeta(
    'workType',
  );
  @override
  late final GeneratedColumn<String> workType = GeneratedColumn<String>(
    'work_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _clientNameMeta = const VerificationMeta(
    'clientName',
  );
  @override
  late final GeneratedColumn<String> clientName = GeneratedColumn<String>(
    'client_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _locationVoivodeshipMeta =
      const VerificationMeta('locationVoivodeship');
  @override
  late final GeneratedColumn<String> locationVoivodeship =
      GeneratedColumn<String>(
        'location_voivodeship',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _locationCommuneMeta = const VerificationMeta(
    'locationCommune',
  );
  @override
  late final GeneratedColumn<String> locationCommune = GeneratedColumn<String>(
    'location_commune',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _locationPrecinctMeta = const VerificationMeta(
    'locationPrecinct',
  );
  @override
  late final GeneratedColumn<String> locationPrecinct = GeneratedColumn<String>(
    'location_precinct',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _locationPlotNumbersMeta =
      const VerificationMeta('locationPlotNumbers');
  @override
  late final GeneratedColumn<String> locationPlotNumbers =
      GeneratedColumn<String>(
        'location_plot_numbers',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _coordSystemMeta = const VerificationMeta(
    'coordSystem',
  );
  @override
  late final GeneratedColumn<String> coordSystem = GeneratedColumn<String>(
    'coord_system',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _heightSystemMeta = const VerificationMeta(
    'heightSystem',
  );
  @override
  late final GeneratedColumn<String> heightSystem = GeneratedColumn<String>(
    'height_system',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _managerUserIdMeta = const VerificationMeta(
    'managerUserId',
  );
  @override
  late final GeneratedColumn<int> managerUserId = GeneratedColumn<int>(
    'manager_user_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('Roboczy'),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    kerg,
    workType,
    clientName,
    locationVoivodeship,
    locationCommune,
    locationPrecinct,
    locationPlotNumbers,
    coordSystem,
    heightSystem,
    managerUserId,
    status,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'projects';
  @override
  VerificationContext validateIntegrity(
    Insertable<Project> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('kerg')) {
      context.handle(
        _kergMeta,
        kerg.isAcceptableOrUnknown(data['kerg']!, _kergMeta),
      );
    } else if (isInserting) {
      context.missing(_kergMeta);
    }
    if (data.containsKey('work_type')) {
      context.handle(
        _workTypeMeta,
        workType.isAcceptableOrUnknown(data['work_type']!, _workTypeMeta),
      );
    } else if (isInserting) {
      context.missing(_workTypeMeta);
    }
    if (data.containsKey('client_name')) {
      context.handle(
        _clientNameMeta,
        clientName.isAcceptableOrUnknown(data['client_name']!, _clientNameMeta),
      );
    } else if (isInserting) {
      context.missing(_clientNameMeta);
    }
    if (data.containsKey('location_voivodeship')) {
      context.handle(
        _locationVoivodeshipMeta,
        locationVoivodeship.isAcceptableOrUnknown(
          data['location_voivodeship']!,
          _locationVoivodeshipMeta,
        ),
      );
    }
    if (data.containsKey('location_commune')) {
      context.handle(
        _locationCommuneMeta,
        locationCommune.isAcceptableOrUnknown(
          data['location_commune']!,
          _locationCommuneMeta,
        ),
      );
    }
    if (data.containsKey('location_precinct')) {
      context.handle(
        _locationPrecinctMeta,
        locationPrecinct.isAcceptableOrUnknown(
          data['location_precinct']!,
          _locationPrecinctMeta,
        ),
      );
    }
    if (data.containsKey('location_plot_numbers')) {
      context.handle(
        _locationPlotNumbersMeta,
        locationPlotNumbers.isAcceptableOrUnknown(
          data['location_plot_numbers']!,
          _locationPlotNumbersMeta,
        ),
      );
    }
    if (data.containsKey('coord_system')) {
      context.handle(
        _coordSystemMeta,
        coordSystem.isAcceptableOrUnknown(
          data['coord_system']!,
          _coordSystemMeta,
        ),
      );
    }
    if (data.containsKey('height_system')) {
      context.handle(
        _heightSystemMeta,
        heightSystem.isAcceptableOrUnknown(
          data['height_system']!,
          _heightSystemMeta,
        ),
      );
    }
    if (data.containsKey('manager_user_id')) {
      context.handle(
        _managerUserIdMeta,
        managerUserId.isAcceptableOrUnknown(
          data['manager_user_id']!,
          _managerUserIdMeta,
        ),
      );
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Project map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Project(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      kerg: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}kerg'],
      )!,
      workType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}work_type'],
      )!,
      clientName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}client_name'],
      )!,
      locationVoivodeship: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}location_voivodeship'],
      ),
      locationCommune: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}location_commune'],
      ),
      locationPrecinct: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}location_precinct'],
      ),
      locationPlotNumbers: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}location_plot_numbers'],
      ),
      coordSystem: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}coord_system'],
      ),
      heightSystem: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}height_system'],
      ),
      managerUserId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}manager_user_id'],
      ),
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $ProjectsTable createAlias(String alias) {
    return $ProjectsTable(attachedDatabase, alias);
  }
}

class Project extends DataClass implements Insertable<Project> {
  final int id;
  final String kerg;
  final String workType;
  final String clientName;
  final String? locationVoivodeship;
  final String? locationCommune;
  final String? locationPrecinct;
  final String? locationPlotNumbers;
  final String? coordSystem;
  final String? heightSystem;
  final int? managerUserId;
  final String status;
  final DateTime createdAt;
  final DateTime updatedAt;
  const Project({
    required this.id,
    required this.kerg,
    required this.workType,
    required this.clientName,
    this.locationVoivodeship,
    this.locationCommune,
    this.locationPrecinct,
    this.locationPlotNumbers,
    this.coordSystem,
    this.heightSystem,
    this.managerUserId,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['kerg'] = Variable<String>(kerg);
    map['work_type'] = Variable<String>(workType);
    map['client_name'] = Variable<String>(clientName);
    if (!nullToAbsent || locationVoivodeship != null) {
      map['location_voivodeship'] = Variable<String>(locationVoivodeship);
    }
    if (!nullToAbsent || locationCommune != null) {
      map['location_commune'] = Variable<String>(locationCommune);
    }
    if (!nullToAbsent || locationPrecinct != null) {
      map['location_precinct'] = Variable<String>(locationPrecinct);
    }
    if (!nullToAbsent || locationPlotNumbers != null) {
      map['location_plot_numbers'] = Variable<String>(locationPlotNumbers);
    }
    if (!nullToAbsent || coordSystem != null) {
      map['coord_system'] = Variable<String>(coordSystem);
    }
    if (!nullToAbsent || heightSystem != null) {
      map['height_system'] = Variable<String>(heightSystem);
    }
    if (!nullToAbsent || managerUserId != null) {
      map['manager_user_id'] = Variable<int>(managerUserId);
    }
    map['status'] = Variable<String>(status);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  ProjectsCompanion toCompanion(bool nullToAbsent) {
    return ProjectsCompanion(
      id: Value(id),
      kerg: Value(kerg),
      workType: Value(workType),
      clientName: Value(clientName),
      locationVoivodeship: locationVoivodeship == null && nullToAbsent
          ? const Value.absent()
          : Value(locationVoivodeship),
      locationCommune: locationCommune == null && nullToAbsent
          ? const Value.absent()
          : Value(locationCommune),
      locationPrecinct: locationPrecinct == null && nullToAbsent
          ? const Value.absent()
          : Value(locationPrecinct),
      locationPlotNumbers: locationPlotNumbers == null && nullToAbsent
          ? const Value.absent()
          : Value(locationPlotNumbers),
      coordSystem: coordSystem == null && nullToAbsent
          ? const Value.absent()
          : Value(coordSystem),
      heightSystem: heightSystem == null && nullToAbsent
          ? const Value.absent()
          : Value(heightSystem),
      managerUserId: managerUserId == null && nullToAbsent
          ? const Value.absent()
          : Value(managerUserId),
      status: Value(status),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory Project.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Project(
      id: serializer.fromJson<int>(json['id']),
      kerg: serializer.fromJson<String>(json['kerg']),
      workType: serializer.fromJson<String>(json['workType']),
      clientName: serializer.fromJson<String>(json['clientName']),
      locationVoivodeship: serializer.fromJson<String?>(
        json['locationVoivodeship'],
      ),
      locationCommune: serializer.fromJson<String?>(json['locationCommune']),
      locationPrecinct: serializer.fromJson<String?>(json['locationPrecinct']),
      locationPlotNumbers: serializer.fromJson<String?>(
        json['locationPlotNumbers'],
      ),
      coordSystem: serializer.fromJson<String?>(json['coordSystem']),
      heightSystem: serializer.fromJson<String?>(json['heightSystem']),
      managerUserId: serializer.fromJson<int?>(json['managerUserId']),
      status: serializer.fromJson<String>(json['status']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'kerg': serializer.toJson<String>(kerg),
      'workType': serializer.toJson<String>(workType),
      'clientName': serializer.toJson<String>(clientName),
      'locationVoivodeship': serializer.toJson<String?>(locationVoivodeship),
      'locationCommune': serializer.toJson<String?>(locationCommune),
      'locationPrecinct': serializer.toJson<String?>(locationPrecinct),
      'locationPlotNumbers': serializer.toJson<String?>(locationPlotNumbers),
      'coordSystem': serializer.toJson<String?>(coordSystem),
      'heightSystem': serializer.toJson<String?>(heightSystem),
      'managerUserId': serializer.toJson<int?>(managerUserId),
      'status': serializer.toJson<String>(status),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  Project copyWith({
    int? id,
    String? kerg,
    String? workType,
    String? clientName,
    Value<String?> locationVoivodeship = const Value.absent(),
    Value<String?> locationCommune = const Value.absent(),
    Value<String?> locationPrecinct = const Value.absent(),
    Value<String?> locationPlotNumbers = const Value.absent(),
    Value<String?> coordSystem = const Value.absent(),
    Value<String?> heightSystem = const Value.absent(),
    Value<int?> managerUserId = const Value.absent(),
    String? status,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => Project(
    id: id ?? this.id,
    kerg: kerg ?? this.kerg,
    workType: workType ?? this.workType,
    clientName: clientName ?? this.clientName,
    locationVoivodeship: locationVoivodeship.present
        ? locationVoivodeship.value
        : this.locationVoivodeship,
    locationCommune: locationCommune.present
        ? locationCommune.value
        : this.locationCommune,
    locationPrecinct: locationPrecinct.present
        ? locationPrecinct.value
        : this.locationPrecinct,
    locationPlotNumbers: locationPlotNumbers.present
        ? locationPlotNumbers.value
        : this.locationPlotNumbers,
    coordSystem: coordSystem.present ? coordSystem.value : this.coordSystem,
    heightSystem: heightSystem.present ? heightSystem.value : this.heightSystem,
    managerUserId: managerUserId.present
        ? managerUserId.value
        : this.managerUserId,
    status: status ?? this.status,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  Project copyWithCompanion(ProjectsCompanion data) {
    return Project(
      id: data.id.present ? data.id.value : this.id,
      kerg: data.kerg.present ? data.kerg.value : this.kerg,
      workType: data.workType.present ? data.workType.value : this.workType,
      clientName: data.clientName.present
          ? data.clientName.value
          : this.clientName,
      locationVoivodeship: data.locationVoivodeship.present
          ? data.locationVoivodeship.value
          : this.locationVoivodeship,
      locationCommune: data.locationCommune.present
          ? data.locationCommune.value
          : this.locationCommune,
      locationPrecinct: data.locationPrecinct.present
          ? data.locationPrecinct.value
          : this.locationPrecinct,
      locationPlotNumbers: data.locationPlotNumbers.present
          ? data.locationPlotNumbers.value
          : this.locationPlotNumbers,
      coordSystem: data.coordSystem.present
          ? data.coordSystem.value
          : this.coordSystem,
      heightSystem: data.heightSystem.present
          ? data.heightSystem.value
          : this.heightSystem,
      managerUserId: data.managerUserId.present
          ? data.managerUserId.value
          : this.managerUserId,
      status: data.status.present ? data.status.value : this.status,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Project(')
          ..write('id: $id, ')
          ..write('kerg: $kerg, ')
          ..write('workType: $workType, ')
          ..write('clientName: $clientName, ')
          ..write('locationVoivodeship: $locationVoivodeship, ')
          ..write('locationCommune: $locationCommune, ')
          ..write('locationPrecinct: $locationPrecinct, ')
          ..write('locationPlotNumbers: $locationPlotNumbers, ')
          ..write('coordSystem: $coordSystem, ')
          ..write('heightSystem: $heightSystem, ')
          ..write('managerUserId: $managerUserId, ')
          ..write('status: $status, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    kerg,
    workType,
    clientName,
    locationVoivodeship,
    locationCommune,
    locationPrecinct,
    locationPlotNumbers,
    coordSystem,
    heightSystem,
    managerUserId,
    status,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Project &&
          other.id == this.id &&
          other.kerg == this.kerg &&
          other.workType == this.workType &&
          other.clientName == this.clientName &&
          other.locationVoivodeship == this.locationVoivodeship &&
          other.locationCommune == this.locationCommune &&
          other.locationPrecinct == this.locationPrecinct &&
          other.locationPlotNumbers == this.locationPlotNumbers &&
          other.coordSystem == this.coordSystem &&
          other.heightSystem == this.heightSystem &&
          other.managerUserId == this.managerUserId &&
          other.status == this.status &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class ProjectsCompanion extends UpdateCompanion<Project> {
  final Value<int> id;
  final Value<String> kerg;
  final Value<String> workType;
  final Value<String> clientName;
  final Value<String?> locationVoivodeship;
  final Value<String?> locationCommune;
  final Value<String?> locationPrecinct;
  final Value<String?> locationPlotNumbers;
  final Value<String?> coordSystem;
  final Value<String?> heightSystem;
  final Value<int?> managerUserId;
  final Value<String> status;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const ProjectsCompanion({
    this.id = const Value.absent(),
    this.kerg = const Value.absent(),
    this.workType = const Value.absent(),
    this.clientName = const Value.absent(),
    this.locationVoivodeship = const Value.absent(),
    this.locationCommune = const Value.absent(),
    this.locationPrecinct = const Value.absent(),
    this.locationPlotNumbers = const Value.absent(),
    this.coordSystem = const Value.absent(),
    this.heightSystem = const Value.absent(),
    this.managerUserId = const Value.absent(),
    this.status = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  ProjectsCompanion.insert({
    this.id = const Value.absent(),
    required String kerg,
    required String workType,
    required String clientName,
    this.locationVoivodeship = const Value.absent(),
    this.locationCommune = const Value.absent(),
    this.locationPrecinct = const Value.absent(),
    this.locationPlotNumbers = const Value.absent(),
    this.coordSystem = const Value.absent(),
    this.heightSystem = const Value.absent(),
    this.managerUserId = const Value.absent(),
    this.status = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  }) : kerg = Value(kerg),
       workType = Value(workType),
       clientName = Value(clientName);
  static Insertable<Project> custom({
    Expression<int>? id,
    Expression<String>? kerg,
    Expression<String>? workType,
    Expression<String>? clientName,
    Expression<String>? locationVoivodeship,
    Expression<String>? locationCommune,
    Expression<String>? locationPrecinct,
    Expression<String>? locationPlotNumbers,
    Expression<String>? coordSystem,
    Expression<String>? heightSystem,
    Expression<int>? managerUserId,
    Expression<String>? status,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (kerg != null) 'kerg': kerg,
      if (workType != null) 'work_type': workType,
      if (clientName != null) 'client_name': clientName,
      if (locationVoivodeship != null)
        'location_voivodeship': locationVoivodeship,
      if (locationCommune != null) 'location_commune': locationCommune,
      if (locationPrecinct != null) 'location_precinct': locationPrecinct,
      if (locationPlotNumbers != null)
        'location_plot_numbers': locationPlotNumbers,
      if (coordSystem != null) 'coord_system': coordSystem,
      if (heightSystem != null) 'height_system': heightSystem,
      if (managerUserId != null) 'manager_user_id': managerUserId,
      if (status != null) 'status': status,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  ProjectsCompanion copyWith({
    Value<int>? id,
    Value<String>? kerg,
    Value<String>? workType,
    Value<String>? clientName,
    Value<String?>? locationVoivodeship,
    Value<String?>? locationCommune,
    Value<String?>? locationPrecinct,
    Value<String?>? locationPlotNumbers,
    Value<String?>? coordSystem,
    Value<String?>? heightSystem,
    Value<int?>? managerUserId,
    Value<String>? status,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
  }) {
    return ProjectsCompanion(
      id: id ?? this.id,
      kerg: kerg ?? this.kerg,
      workType: workType ?? this.workType,
      clientName: clientName ?? this.clientName,
      locationVoivodeship: locationVoivodeship ?? this.locationVoivodeship,
      locationCommune: locationCommune ?? this.locationCommune,
      locationPrecinct: locationPrecinct ?? this.locationPrecinct,
      locationPlotNumbers: locationPlotNumbers ?? this.locationPlotNumbers,
      coordSystem: coordSystem ?? this.coordSystem,
      heightSystem: heightSystem ?? this.heightSystem,
      managerUserId: managerUserId ?? this.managerUserId,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (kerg.present) {
      map['kerg'] = Variable<String>(kerg.value);
    }
    if (workType.present) {
      map['work_type'] = Variable<String>(workType.value);
    }
    if (clientName.present) {
      map['client_name'] = Variable<String>(clientName.value);
    }
    if (locationVoivodeship.present) {
      map['location_voivodeship'] = Variable<String>(locationVoivodeship.value);
    }
    if (locationCommune.present) {
      map['location_commune'] = Variable<String>(locationCommune.value);
    }
    if (locationPrecinct.present) {
      map['location_precinct'] = Variable<String>(locationPrecinct.value);
    }
    if (locationPlotNumbers.present) {
      map['location_plot_numbers'] = Variable<String>(
        locationPlotNumbers.value,
      );
    }
    if (coordSystem.present) {
      map['coord_system'] = Variable<String>(coordSystem.value);
    }
    if (heightSystem.present) {
      map['height_system'] = Variable<String>(heightSystem.value);
    }
    if (managerUserId.present) {
      map['manager_user_id'] = Variable<int>(managerUserId.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProjectsCompanion(')
          ..write('id: $id, ')
          ..write('kerg: $kerg, ')
          ..write('workType: $workType, ')
          ..write('clientName: $clientName, ')
          ..write('locationVoivodeship: $locationVoivodeship, ')
          ..write('locationCommune: $locationCommune, ')
          ..write('locationPrecinct: $locationPrecinct, ')
          ..write('locationPlotNumbers: $locationPlotNumbers, ')
          ..write('coordSystem: $coordSystem, ')
          ..write('heightSystem: $heightSystem, ')
          ..write('managerUserId: $managerUserId, ')
          ..write('status: $status, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $ProjectsTable projects = $ProjectsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [projects];
}

typedef $$ProjectsTableCreateCompanionBuilder =
    ProjectsCompanion Function({
      Value<int> id,
      required String kerg,
      required String workType,
      required String clientName,
      Value<String?> locationVoivodeship,
      Value<String?> locationCommune,
      Value<String?> locationPrecinct,
      Value<String?> locationPlotNumbers,
      Value<String?> coordSystem,
      Value<String?> heightSystem,
      Value<int?> managerUserId,
      Value<String> status,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    });
typedef $$ProjectsTableUpdateCompanionBuilder =
    ProjectsCompanion Function({
      Value<int> id,
      Value<String> kerg,
      Value<String> workType,
      Value<String> clientName,
      Value<String?> locationVoivodeship,
      Value<String?> locationCommune,
      Value<String?> locationPrecinct,
      Value<String?> locationPlotNumbers,
      Value<String?> coordSystem,
      Value<String?> heightSystem,
      Value<int?> managerUserId,
      Value<String> status,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    });

class $$ProjectsTableFilterComposer
    extends Composer<_$AppDatabase, $ProjectsTable> {
  $$ProjectsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get kerg => $composableBuilder(
    column: $table.kerg,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get workType => $composableBuilder(
    column: $table.workType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get clientName => $composableBuilder(
    column: $table.clientName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get locationVoivodeship => $composableBuilder(
    column: $table.locationVoivodeship,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get locationCommune => $composableBuilder(
    column: $table.locationCommune,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get locationPrecinct => $composableBuilder(
    column: $table.locationPrecinct,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get locationPlotNumbers => $composableBuilder(
    column: $table.locationPlotNumbers,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get coordSystem => $composableBuilder(
    column: $table.coordSystem,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get heightSystem => $composableBuilder(
    column: $table.heightSystem,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get managerUserId => $composableBuilder(
    column: $table.managerUserId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ProjectsTableOrderingComposer
    extends Composer<_$AppDatabase, $ProjectsTable> {
  $$ProjectsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get kerg => $composableBuilder(
    column: $table.kerg,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get workType => $composableBuilder(
    column: $table.workType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get clientName => $composableBuilder(
    column: $table.clientName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get locationVoivodeship => $composableBuilder(
    column: $table.locationVoivodeship,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get locationCommune => $composableBuilder(
    column: $table.locationCommune,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get locationPrecinct => $composableBuilder(
    column: $table.locationPrecinct,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get locationPlotNumbers => $composableBuilder(
    column: $table.locationPlotNumbers,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get coordSystem => $composableBuilder(
    column: $table.coordSystem,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get heightSystem => $composableBuilder(
    column: $table.heightSystem,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get managerUserId => $composableBuilder(
    column: $table.managerUserId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ProjectsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ProjectsTable> {
  $$ProjectsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get kerg =>
      $composableBuilder(column: $table.kerg, builder: (column) => column);

  GeneratedColumn<String> get workType =>
      $composableBuilder(column: $table.workType, builder: (column) => column);

  GeneratedColumn<String> get clientName => $composableBuilder(
    column: $table.clientName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get locationVoivodeship => $composableBuilder(
    column: $table.locationVoivodeship,
    builder: (column) => column,
  );

  GeneratedColumn<String> get locationCommune => $composableBuilder(
    column: $table.locationCommune,
    builder: (column) => column,
  );

  GeneratedColumn<String> get locationPrecinct => $composableBuilder(
    column: $table.locationPrecinct,
    builder: (column) => column,
  );

  GeneratedColumn<String> get locationPlotNumbers => $composableBuilder(
    column: $table.locationPlotNumbers,
    builder: (column) => column,
  );

  GeneratedColumn<String> get coordSystem => $composableBuilder(
    column: $table.coordSystem,
    builder: (column) => column,
  );

  GeneratedColumn<String> get heightSystem => $composableBuilder(
    column: $table.heightSystem,
    builder: (column) => column,
  );

  GeneratedColumn<int> get managerUserId => $composableBuilder(
    column: $table.managerUserId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$ProjectsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ProjectsTable,
          Project,
          $$ProjectsTableFilterComposer,
          $$ProjectsTableOrderingComposer,
          $$ProjectsTableAnnotationComposer,
          $$ProjectsTableCreateCompanionBuilder,
          $$ProjectsTableUpdateCompanionBuilder,
          (Project, BaseReferences<_$AppDatabase, $ProjectsTable, Project>),
          Project,
          PrefetchHooks Function()
        > {
  $$ProjectsTableTableManager(_$AppDatabase db, $ProjectsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ProjectsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ProjectsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ProjectsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> kerg = const Value.absent(),
                Value<String> workType = const Value.absent(),
                Value<String> clientName = const Value.absent(),
                Value<String?> locationVoivodeship = const Value.absent(),
                Value<String?> locationCommune = const Value.absent(),
                Value<String?> locationPrecinct = const Value.absent(),
                Value<String?> locationPlotNumbers = const Value.absent(),
                Value<String?> coordSystem = const Value.absent(),
                Value<String?> heightSystem = const Value.absent(),
                Value<int?> managerUserId = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => ProjectsCompanion(
                id: id,
                kerg: kerg,
                workType: workType,
                clientName: clientName,
                locationVoivodeship: locationVoivodeship,
                locationCommune: locationCommune,
                locationPrecinct: locationPrecinct,
                locationPlotNumbers: locationPlotNumbers,
                coordSystem: coordSystem,
                heightSystem: heightSystem,
                managerUserId: managerUserId,
                status: status,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String kerg,
                required String workType,
                required String clientName,
                Value<String?> locationVoivodeship = const Value.absent(),
                Value<String?> locationCommune = const Value.absent(),
                Value<String?> locationPrecinct = const Value.absent(),
                Value<String?> locationPlotNumbers = const Value.absent(),
                Value<String?> coordSystem = const Value.absent(),
                Value<String?> heightSystem = const Value.absent(),
                Value<int?> managerUserId = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => ProjectsCompanion.insert(
                id: id,
                kerg: kerg,
                workType: workType,
                clientName: clientName,
                locationVoivodeship: locationVoivodeship,
                locationCommune: locationCommune,
                locationPrecinct: locationPrecinct,
                locationPlotNumbers: locationPlotNumbers,
                coordSystem: coordSystem,
                heightSystem: heightSystem,
                managerUserId: managerUserId,
                status: status,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ProjectsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ProjectsTable,
      Project,
      $$ProjectsTableFilterComposer,
      $$ProjectsTableOrderingComposer,
      $$ProjectsTableAnnotationComposer,
      $$ProjectsTableCreateCompanionBuilder,
      $$ProjectsTableUpdateCompanionBuilder,
      (Project, BaseReferences<_$AppDatabase, $ProjectsTable, Project>),
      Project,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$ProjectsTableTableManager get projects =>
      $$ProjectsTableTableManager(_db, _db.projects);
}
