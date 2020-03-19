// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attendance.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Attendance _$AttendanceFromJson(Map<String, dynamic> json) {
  return Attendance()
    ..name = json['name'] as String
    ..id = json['id'] as int
    ..section = _$enumDecodeNullable(_$SectionEnumMap, json['section'])
    ..subSection = _$enumDecodeNullable(_$SubSectionEnumMap, json['subSection'])
    ..totalStudents = json['total_students'] as String
    ..presentStudents = json['present_students'] as String;
}

Map<String, dynamic> _$AttendanceToJson(Attendance instance) =>
    <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
      'section': _$SectionEnumMap[instance.section],
      'subSection': _$SubSectionEnumMap[instance.subSection],
      'total_students': instance.totalStudents,
      'present_students': instance.presentStudents,
    };

T _$enumDecode<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }

  final value = enumValues.entries
      .singleWhere((e) => e.value == source, orElse: () => null)
      ?.key;

  if (value == null && unknownValue == null) {
    throw ArgumentError('`$source` is not one of the supported values: '
        '${enumValues.values.join(', ')}');
  }
  return value ?? unknownValue;
}

T _$enumDecodeNullable<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source, unknownValue: unknownValue);
}

const _$SectionEnumMap = {
  Section.CS: 'CS',
  Section.IT: 'IT',
};

const _$SubSectionEnumMap = {
  SubSection.CS1: 'CS1',
  SubSection.CS2: 'CS2',
  SubSection.CS3: 'CS3',
  SubSection.IT1: 'IT1',
  SubSection.IT2: 'IT2',
};

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars

mixin _$Attendance on _Attendance, Store {
  final _$nameAtom = Atom(name: '_Attendance.name');

  @override
  String get name {
    _$nameAtom.context.enforceReadPolicy(_$nameAtom);
    _$nameAtom.reportObserved();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.context.conditionallyRunInAction(() {
      super.name = value;
      _$nameAtom.reportChanged();
    }, _$nameAtom, name: '${_$nameAtom.name}_set');
  }

  final _$idAtom = Atom(name: '_Attendance.id');

  @override
  int get id {
    _$idAtom.context.enforceReadPolicy(_$idAtom);
    _$idAtom.reportObserved();
    return super.id;
  }

  @override
  set id(int value) {
    _$idAtom.context.conditionallyRunInAction(() {
      super.id = value;
      _$idAtom.reportChanged();
    }, _$idAtom, name: '${_$idAtom.name}_set');
  }

  final _$sectionAtom = Atom(name: '_Attendance.section');

  @override
  Section get section {
    _$sectionAtom.context.enforceReadPolicy(_$sectionAtom);
    _$sectionAtom.reportObserved();
    return super.section;
  }

  @override
  set section(Section value) {
    _$sectionAtom.context.conditionallyRunInAction(() {
      super.section = value;
      _$sectionAtom.reportChanged();
    }, _$sectionAtom, name: '${_$sectionAtom.name}_set');
  }

  final _$subSectionAtom = Atom(name: '_Attendance.subSection');

  @override
  SubSection get subSection {
    _$subSectionAtom.context.enforceReadPolicy(_$subSectionAtom);
    _$subSectionAtom.reportObserved();
    return super.subSection;
  }

  @override
  set subSection(SubSection value) {
    _$subSectionAtom.context.conditionallyRunInAction(() {
      super.subSection = value;
      _$subSectionAtom.reportChanged();
    }, _$subSectionAtom, name: '${_$subSectionAtom.name}_set');
  }

  final _$totalStudentsAtom = Atom(name: '_Attendance.totalStudents');

  @override
  String get totalStudents {
    _$totalStudentsAtom.context.enforceReadPolicy(_$totalStudentsAtom);
    _$totalStudentsAtom.reportObserved();
    return super.totalStudents;
  }

  @override
  set totalStudents(String value) {
    _$totalStudentsAtom.context.conditionallyRunInAction(() {
      super.totalStudents = value;
      _$totalStudentsAtom.reportChanged();
    }, _$totalStudentsAtom, name: '${_$totalStudentsAtom.name}_set');
  }

  final _$presentStudentsAtom = Atom(name: '_Attendance.presentStudents');

  @override
  String get presentStudents {
    _$presentStudentsAtom.context.enforceReadPolicy(_$presentStudentsAtom);
    _$presentStudentsAtom.reportObserved();
    return super.presentStudents;
  }

  @override
  set presentStudents(String value) {
    _$presentStudentsAtom.context.conditionallyRunInAction(() {
      super.presentStudents = value;
      _$presentStudentsAtom.reportChanged();
    }, _$presentStudentsAtom, name: '${_$presentStudentsAtom.name}_set');
  }
}
