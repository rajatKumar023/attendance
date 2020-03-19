import 'package:json_annotation/json_annotation.dart';
import 'package:mobx/mobx.dart';

part 'attendance.g.dart';

@JsonSerializable()
class Attendance extends _Attendance with _$Attendance {
  static Attendance fromJson(Map<String, dynamic> json) =>
      _$AttendanceFromJson(json);

  static Map<String, dynamic> toJson(Attendance Attendance) =>
      _$AttendanceToJson(Attendance);
}

abstract class _Attendance with Store {
  @observable
  String name;

  @observable
  int id;

  @observable
  Section section;

  @observable
  SubSection subSection;

  @observable
  @JsonKey(name: 'total_students')
  String totalStudents;

  @observable
  @JsonKey(name: 'present_students')
  String presentStudents;
}

enum Section { CS, IT }

enum SubSection { CS1, CS2, CS3, IT1, IT2 }
