import 'package:attendance_portal/models/attendance.dart';
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
}
