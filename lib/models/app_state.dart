import 'package:attendance_portal/models/attendance.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'app_state.g.dart';

abstract class AppState implements Built<AppState, AppStateBuilder> {
  Attendance get attendance;

  static Serializer<AppState> get serializer => _$appStateSerializer;

  factory AppState() {
    return _$AppState((b) => b..attendance = Attendance().toBuilder());
  }

  AppState._();
}
