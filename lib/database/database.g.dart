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

class $DocumentsTable extends Documents
    with TableInfo<$DocumentsTable, Document> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DocumentsTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _projectIdMeta = const VerificationMeta(
    'projectId',
  );
  @override
  late final GeneratedColumn<int> projectId = GeneratedColumn<int>(
    'project_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES projects (id)',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
    'type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
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
  static const VerificationMeta _sortOrderMeta = const VerificationMeta(
    'sortOrder',
  );
  @override
  late final GeneratedColumn<int> sortOrder = GeneratedColumn<int>(
    'sort_order',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _filePathMeta = const VerificationMeta(
    'filePath',
  );
  @override
  late final GeneratedColumn<String> filePath = GeneratedColumn<String>(
    'file_path',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _contentMeta = const VerificationMeta(
    'content',
  );
  @override
  late final GeneratedColumn<String> content = GeneratedColumn<String>(
    'content',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
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
  @override
  List<GeneratedColumn> get $columns => [
    id,
    projectId,
    name,
    type,
    status,
    sortOrder,
    filePath,
    content,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'documents';
  @override
  VerificationContext validateIntegrity(
    Insertable<Document> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('project_id')) {
      context.handle(
        _projectIdMeta,
        projectId.isAcceptableOrUnknown(data['project_id']!, _projectIdMeta),
      );
    } else if (isInserting) {
      context.missing(_projectIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
        _typeMeta,
        type.isAcceptableOrUnknown(data['type']!, _typeMeta),
      );
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    if (data.containsKey('sort_order')) {
      context.handle(
        _sortOrderMeta,
        sortOrder.isAcceptableOrUnknown(data['sort_order']!, _sortOrderMeta),
      );
    } else if (isInserting) {
      context.missing(_sortOrderMeta);
    }
    if (data.containsKey('file_path')) {
      context.handle(
        _filePathMeta,
        filePath.isAcceptableOrUnknown(data['file_path']!, _filePathMeta),
      );
    }
    if (data.containsKey('content')) {
      context.handle(
        _contentMeta,
        content.isAcceptableOrUnknown(data['content']!, _contentMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Document map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Document(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      projectId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}project_id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      type: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}type'],
      )!,
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      sortOrder: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}sort_order'],
      )!,
      filePath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}file_path'],
      ),
      content: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}content'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $DocumentsTable createAlias(String alias) {
    return $DocumentsTable(attachedDatabase, alias);
  }
}

class Document extends DataClass implements Insertable<Document> {
  final int id;
  final int projectId;
  final String name;
  final String type;
  final String status;
  final int sortOrder;
  final String? filePath;
  final String? content;
  final DateTime createdAt;
  const Document({
    required this.id,
    required this.projectId,
    required this.name,
    required this.type,
    required this.status,
    required this.sortOrder,
    this.filePath,
    this.content,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['project_id'] = Variable<int>(projectId);
    map['name'] = Variable<String>(name);
    map['type'] = Variable<String>(type);
    map['status'] = Variable<String>(status);
    map['sort_order'] = Variable<int>(sortOrder);
    if (!nullToAbsent || filePath != null) {
      map['file_path'] = Variable<String>(filePath);
    }
    if (!nullToAbsent || content != null) {
      map['content'] = Variable<String>(content);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  DocumentsCompanion toCompanion(bool nullToAbsent) {
    return DocumentsCompanion(
      id: Value(id),
      projectId: Value(projectId),
      name: Value(name),
      type: Value(type),
      status: Value(status),
      sortOrder: Value(sortOrder),
      filePath: filePath == null && nullToAbsent
          ? const Value.absent()
          : Value(filePath),
      content: content == null && nullToAbsent
          ? const Value.absent()
          : Value(content),
      createdAt: Value(createdAt),
    );
  }

  factory Document.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Document(
      id: serializer.fromJson<int>(json['id']),
      projectId: serializer.fromJson<int>(json['projectId']),
      name: serializer.fromJson<String>(json['name']),
      type: serializer.fromJson<String>(json['type']),
      status: serializer.fromJson<String>(json['status']),
      sortOrder: serializer.fromJson<int>(json['sortOrder']),
      filePath: serializer.fromJson<String?>(json['filePath']),
      content: serializer.fromJson<String?>(json['content']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'projectId': serializer.toJson<int>(projectId),
      'name': serializer.toJson<String>(name),
      'type': serializer.toJson<String>(type),
      'status': serializer.toJson<String>(status),
      'sortOrder': serializer.toJson<int>(sortOrder),
      'filePath': serializer.toJson<String?>(filePath),
      'content': serializer.toJson<String?>(content),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  Document copyWith({
    int? id,
    int? projectId,
    String? name,
    String? type,
    String? status,
    int? sortOrder,
    Value<String?> filePath = const Value.absent(),
    Value<String?> content = const Value.absent(),
    DateTime? createdAt,
  }) => Document(
    id: id ?? this.id,
    projectId: projectId ?? this.projectId,
    name: name ?? this.name,
    type: type ?? this.type,
    status: status ?? this.status,
    sortOrder: sortOrder ?? this.sortOrder,
    filePath: filePath.present ? filePath.value : this.filePath,
    content: content.present ? content.value : this.content,
    createdAt: createdAt ?? this.createdAt,
  );
  Document copyWithCompanion(DocumentsCompanion data) {
    return Document(
      id: data.id.present ? data.id.value : this.id,
      projectId: data.projectId.present ? data.projectId.value : this.projectId,
      name: data.name.present ? data.name.value : this.name,
      type: data.type.present ? data.type.value : this.type,
      status: data.status.present ? data.status.value : this.status,
      sortOrder: data.sortOrder.present ? data.sortOrder.value : this.sortOrder,
      filePath: data.filePath.present ? data.filePath.value : this.filePath,
      content: data.content.present ? data.content.value : this.content,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Document(')
          ..write('id: $id, ')
          ..write('projectId: $projectId, ')
          ..write('name: $name, ')
          ..write('type: $type, ')
          ..write('status: $status, ')
          ..write('sortOrder: $sortOrder, ')
          ..write('filePath: $filePath, ')
          ..write('content: $content, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    projectId,
    name,
    type,
    status,
    sortOrder,
    filePath,
    content,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Document &&
          other.id == this.id &&
          other.projectId == this.projectId &&
          other.name == this.name &&
          other.type == this.type &&
          other.status == this.status &&
          other.sortOrder == this.sortOrder &&
          other.filePath == this.filePath &&
          other.content == this.content &&
          other.createdAt == this.createdAt);
}

class DocumentsCompanion extends UpdateCompanion<Document> {
  final Value<int> id;
  final Value<int> projectId;
  final Value<String> name;
  final Value<String> type;
  final Value<String> status;
  final Value<int> sortOrder;
  final Value<String?> filePath;
  final Value<String?> content;
  final Value<DateTime> createdAt;
  const DocumentsCompanion({
    this.id = const Value.absent(),
    this.projectId = const Value.absent(),
    this.name = const Value.absent(),
    this.type = const Value.absent(),
    this.status = const Value.absent(),
    this.sortOrder = const Value.absent(),
    this.filePath = const Value.absent(),
    this.content = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  DocumentsCompanion.insert({
    this.id = const Value.absent(),
    required int projectId,
    required String name,
    required String type,
    this.status = const Value.absent(),
    required int sortOrder,
    this.filePath = const Value.absent(),
    this.content = const Value.absent(),
    this.createdAt = const Value.absent(),
  }) : projectId = Value(projectId),
       name = Value(name),
       type = Value(type),
       sortOrder = Value(sortOrder);
  static Insertable<Document> custom({
    Expression<int>? id,
    Expression<int>? projectId,
    Expression<String>? name,
    Expression<String>? type,
    Expression<String>? status,
    Expression<int>? sortOrder,
    Expression<String>? filePath,
    Expression<String>? content,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (projectId != null) 'project_id': projectId,
      if (name != null) 'name': name,
      if (type != null) 'type': type,
      if (status != null) 'status': status,
      if (sortOrder != null) 'sort_order': sortOrder,
      if (filePath != null) 'file_path': filePath,
      if (content != null) 'content': content,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  DocumentsCompanion copyWith({
    Value<int>? id,
    Value<int>? projectId,
    Value<String>? name,
    Value<String>? type,
    Value<String>? status,
    Value<int>? sortOrder,
    Value<String?>? filePath,
    Value<String?>? content,
    Value<DateTime>? createdAt,
  }) {
    return DocumentsCompanion(
      id: id ?? this.id,
      projectId: projectId ?? this.projectId,
      name: name ?? this.name,
      type: type ?? this.type,
      status: status ?? this.status,
      sortOrder: sortOrder ?? this.sortOrder,
      filePath: filePath ?? this.filePath,
      content: content ?? this.content,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (projectId.present) {
      map['project_id'] = Variable<int>(projectId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (sortOrder.present) {
      map['sort_order'] = Variable<int>(sortOrder.value);
    }
    if (filePath.present) {
      map['file_path'] = Variable<String>(filePath.value);
    }
    if (content.present) {
      map['content'] = Variable<String>(content.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DocumentsCompanion(')
          ..write('id: $id, ')
          ..write('projectId: $projectId, ')
          ..write('name: $name, ')
          ..write('type: $type, ')
          ..write('status: $status, ')
          ..write('sortOrder: $sortOrder, ')
          ..write('filePath: $filePath, ')
          ..write('content: $content, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $ProjectsTable projects = $ProjectsTable(this);
  late final $DocumentsTable documents = $DocumentsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [projects, documents];
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

final class $$ProjectsTableReferences
    extends BaseReferences<_$AppDatabase, $ProjectsTable, Project> {
  $$ProjectsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$DocumentsTable, List<Document>>
  _documentsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.documents,
    aliasName: $_aliasNameGenerator(db.projects.id, db.documents.projectId),
  );

  $$DocumentsTableProcessedTableManager get documentsRefs {
    final manager = $$DocumentsTableTableManager(
      $_db,
      $_db.documents,
    ).filter((f) => f.projectId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_documentsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

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

  Expression<bool> documentsRefs(
    Expression<bool> Function($$DocumentsTableFilterComposer f) f,
  ) {
    final $$DocumentsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.documents,
      getReferencedColumn: (t) => t.projectId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DocumentsTableFilterComposer(
            $db: $db,
            $table: $db.documents,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
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

  Expression<T> documentsRefs<T extends Object>(
    Expression<T> Function($$DocumentsTableAnnotationComposer a) f,
  ) {
    final $$DocumentsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.documents,
      getReferencedColumn: (t) => t.projectId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DocumentsTableAnnotationComposer(
            $db: $db,
            $table: $db.documents,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
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
          (Project, $$ProjectsTableReferences),
          Project,
          PrefetchHooks Function({bool documentsRefs})
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
              .map(
                (e) => (
                  e.readTable(table),
                  $$ProjectsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({documentsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (documentsRefs) db.documents],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (documentsRefs)
                    await $_getPrefetchedData<
                      Project,
                      $ProjectsTable,
                      Document
                    >(
                      currentTable: table,
                      referencedTable: $$ProjectsTableReferences
                          ._documentsRefsTable(db),
                      managerFromTypedResult: (p0) => $$ProjectsTableReferences(
                        db,
                        table,
                        p0,
                      ).documentsRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.projectId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
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
      (Project, $$ProjectsTableReferences),
      Project,
      PrefetchHooks Function({bool documentsRefs})
    >;
typedef $$DocumentsTableCreateCompanionBuilder =
    DocumentsCompanion Function({
      Value<int> id,
      required int projectId,
      required String name,
      required String type,
      Value<String> status,
      required int sortOrder,
      Value<String?> filePath,
      Value<String?> content,
      Value<DateTime> createdAt,
    });
typedef $$DocumentsTableUpdateCompanionBuilder =
    DocumentsCompanion Function({
      Value<int> id,
      Value<int> projectId,
      Value<String> name,
      Value<String> type,
      Value<String> status,
      Value<int> sortOrder,
      Value<String?> filePath,
      Value<String?> content,
      Value<DateTime> createdAt,
    });

final class $$DocumentsTableReferences
    extends BaseReferences<_$AppDatabase, $DocumentsTable, Document> {
  $$DocumentsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $ProjectsTable _projectIdTable(_$AppDatabase db) =>
      db.projects.createAlias(
        $_aliasNameGenerator(db.documents.projectId, db.projects.id),
      );

  $$ProjectsTableProcessedTableManager get projectId {
    final $_column = $_itemColumn<int>('project_id')!;

    final manager = $$ProjectsTableTableManager(
      $_db,
      $_db.projects,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_projectIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$DocumentsTableFilterComposer
    extends Composer<_$AppDatabase, $DocumentsTable> {
  $$DocumentsTableFilterComposer({
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

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get sortOrder => $composableBuilder(
    column: $table.sortOrder,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get filePath => $composableBuilder(
    column: $table.filePath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get content => $composableBuilder(
    column: $table.content,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  $$ProjectsTableFilterComposer get projectId {
    final $$ProjectsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.projectId,
      referencedTable: $db.projects,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProjectsTableFilterComposer(
            $db: $db,
            $table: $db.projects,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$DocumentsTableOrderingComposer
    extends Composer<_$AppDatabase, $DocumentsTable> {
  $$DocumentsTableOrderingComposer({
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

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get sortOrder => $composableBuilder(
    column: $table.sortOrder,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get filePath => $composableBuilder(
    column: $table.filePath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get content => $composableBuilder(
    column: $table.content,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$ProjectsTableOrderingComposer get projectId {
    final $$ProjectsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.projectId,
      referencedTable: $db.projects,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProjectsTableOrderingComposer(
            $db: $db,
            $table: $db.projects,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$DocumentsTableAnnotationComposer
    extends Composer<_$AppDatabase, $DocumentsTable> {
  $$DocumentsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<int> get sortOrder =>
      $composableBuilder(column: $table.sortOrder, builder: (column) => column);

  GeneratedColumn<String> get filePath =>
      $composableBuilder(column: $table.filePath, builder: (column) => column);

  GeneratedColumn<String> get content =>
      $composableBuilder(column: $table.content, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  $$ProjectsTableAnnotationComposer get projectId {
    final $$ProjectsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.projectId,
      referencedTable: $db.projects,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProjectsTableAnnotationComposer(
            $db: $db,
            $table: $db.projects,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$DocumentsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $DocumentsTable,
          Document,
          $$DocumentsTableFilterComposer,
          $$DocumentsTableOrderingComposer,
          $$DocumentsTableAnnotationComposer,
          $$DocumentsTableCreateCompanionBuilder,
          $$DocumentsTableUpdateCompanionBuilder,
          (Document, $$DocumentsTableReferences),
          Document,
          PrefetchHooks Function({bool projectId})
        > {
  $$DocumentsTableTableManager(_$AppDatabase db, $DocumentsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DocumentsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DocumentsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DocumentsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> projectId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> type = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<int> sortOrder = const Value.absent(),
                Value<String?> filePath = const Value.absent(),
                Value<String?> content = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => DocumentsCompanion(
                id: id,
                projectId: projectId,
                name: name,
                type: type,
                status: status,
                sortOrder: sortOrder,
                filePath: filePath,
                content: content,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int projectId,
                required String name,
                required String type,
                Value<String> status = const Value.absent(),
                required int sortOrder,
                Value<String?> filePath = const Value.absent(),
                Value<String?> content = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => DocumentsCompanion.insert(
                id: id,
                projectId: projectId,
                name: name,
                type: type,
                status: status,
                sortOrder: sortOrder,
                filePath: filePath,
                content: content,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$DocumentsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({projectId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (projectId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.projectId,
                                referencedTable: $$DocumentsTableReferences
                                    ._projectIdTable(db),
                                referencedColumn: $$DocumentsTableReferences
                                    ._projectIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$DocumentsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $DocumentsTable,
      Document,
      $$DocumentsTableFilterComposer,
      $$DocumentsTableOrderingComposer,
      $$DocumentsTableAnnotationComposer,
      $$DocumentsTableCreateCompanionBuilder,
      $$DocumentsTableUpdateCompanionBuilder,
      (Document, $$DocumentsTableReferences),
      Document,
      PrefetchHooks Function({bool projectId})
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$ProjectsTableTableManager get projects =>
      $$ProjectsTableTableManager(_db, _db.projects);
  $$DocumentsTableTableManager get documents =>
      $$DocumentsTableTableManager(_db, _db.documents);
}
