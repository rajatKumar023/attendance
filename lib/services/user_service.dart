import 'package:cloud_firestore/cloud_firestore.dart';

class UserService {
  UserService._();

  factory UserService.getInstance() => _instance;
  static final UserService _instance = UserService._();

  Future<dynamic> addUser(Map<String, dynamic> map, String email) async {
    final response = await Firestore.instance
        .collection('users')
        .document(email)
        .setData(map);
    return response;
  }

  Future<DocumentSnapshot> getUser(String email) async {
    final response =
        await Firestore.instance.collection('users').document(email).get();
    return response;
  }
}
