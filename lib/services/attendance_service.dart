import 'package:cloud_firestore/cloud_firestore.dart';

class AttendanceService {
  AttendanceService._();

  factory AttendanceService.getInstance() => _instance;
  static final AttendanceService _instance = AttendanceService._();

  Future<dynamic> addAttendance(
    Map<String, dynamic> map,
    String email,
    String section,
    String subSection,
    String id,
  ) async {
    final response = await Firestore.instance
        .collection('attendance')
        .document(email)
        .collection('${section}-${subSection}')
        .document(id.toString())
        .setData(map);
    return response;
  }

//  Future<DocumentSnapshot> getUser(String email) async {
//    final response =
//    await Firestore.instance.collection('users').document(email).get();
//    return response;
//  }
}
