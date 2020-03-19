import 'dart:math';

import 'package:attendance_portal/models/attendance.dart';
import 'package:attendance_portal/services/attendance_service.dart';
import 'package:flutter/foundation.dart';
import 'package:mobx/mobx.dart';

part 'attendance_store.g.dart';

class AttendanceStore = _AttendanceStore with _$AttendanceStore;

abstract class _AttendanceStore with Store {
  @observable
  String name;

  @observable
  String totalStudents;

  @observable
  String presentStudents;

  @observable
  Section section;

  @observable
  SubSection subSection;

  @action
  setNameForAttendance(String name) {
    this.name = name;
  }

  @action
  setTotalStudentsForAttendance(String totalStudents) {
    this.totalStudents = totalStudents;
  }

  @action
  setPresentStudentsForAttendance(String presentStudents) {
    this.presentStudents = presentStudents;
  }

  @action
  setSectionForAttendance(Section section) {
    this.section = section;
  }

  @action
  setSubSectionForAttendance(SubSection subSection) {
    this.subSection = subSection;
  }

  @action
  submitAttendance(String email) {
    Attendance attendance = Attendance();
    Random random = Random();
    int id = random.nextInt(100000000);
    attendance.name = name;
    attendance.id = id;
    attendance.totalStudents = totalStudents;
    attendance.presentStudents = presentStudents;
    attendance.section = section;
    attendance.subSection = subSection;
    AttendanceService.getInstance()
        .addAttendance(
      Attendance.toJson(attendance),
      email,
      describeEnum(section),
      describeEnum(subSection),
      id.toString(),
    )
        .then((response) {
      name = null;
      totalStudents = null;
      presentStudents = null;
      section = null;
      subSection = null;
    });
  }
}
