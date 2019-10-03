import 'package:attendance_portal/models/sections.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'attendance.g.dart';

abstract class Attendance implements Built<Attendance, AttendanceBuilder> {

  String get name;

  String get id;

  Section get section;

  String get subSection;

  String get totalStudents;

  String get presentStudents;

  Attendance._();

  factory Attendance() {
    return _$Attendance((b) {});
  }

  static Serializer<Attendance> get serializer => _$attendanceSerializer;
}
