// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attendance_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars

mixin _$AttendanceStore on _AttendanceStore, Store {
  final _$nameAtom = Atom(name: '_AttendanceStore.name');

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

  final _$totalStudentsAtom = Atom(name: '_AttendanceStore.totalStudents');

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

  final _$presentStudentsAtom = Atom(name: '_AttendanceStore.presentStudents');

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

  final _$sectionAtom = Atom(name: '_AttendanceStore.section');

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

  final _$subSectionAtom = Atom(name: '_AttendanceStore.subSection');

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

  final _$_AttendanceStoreActionController =
      ActionController(name: '_AttendanceStore');

  @override
  dynamic setNameForAttendance(String name) {
    final _$actionInfo = _$_AttendanceStoreActionController.startAction();
    try {
      return super.setNameForAttendance(name);
    } finally {
      _$_AttendanceStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setTotalStudentsForAttendance(String totalStudents) {
    final _$actionInfo = _$_AttendanceStoreActionController.startAction();
    try {
      return super.setTotalStudentsForAttendance(totalStudents);
    } finally {
      _$_AttendanceStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setPresentStudentsForAttendance(String presentStudents) {
    final _$actionInfo = _$_AttendanceStoreActionController.startAction();
    try {
      return super.setPresentStudentsForAttendance(presentStudents);
    } finally {
      _$_AttendanceStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setSectionForAttendance(Section section) {
    final _$actionInfo = _$_AttendanceStoreActionController.startAction();
    try {
      return super.setSectionForAttendance(section);
    } finally {
      _$_AttendanceStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setSubSectionForAttendance(SubSection subSection) {
    final _$actionInfo = _$_AttendanceStoreActionController.startAction();
    try {
      return super.setSubSectionForAttendance(subSection);
    } finally {
      _$_AttendanceStoreActionController.endAction(_$actionInfo);
    }
  }
}
