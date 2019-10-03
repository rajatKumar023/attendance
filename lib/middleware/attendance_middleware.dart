import 'package:attendance_portal/actions/attendance_submit.dart';
import 'package:attendance_portal/models/app_state.dart';
import 'package:redux/redux.dart';

Future<Null> userMiddleware(
    Store<AppState> store, action, NextDispatcher next) async {
  print("*******action called  " + action.runtimeType.toString() + "  *****");

  switch (action.runtimeType) {
    case OnAttendanceSubmit:
//      to add to firebase
      break;

    default:
      next(action);
  }
}
