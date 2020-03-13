import 'package:json_annotation/json_annotation.dart';
import 'package:mobx/mobx.dart';

part 'user.g.dart';

@JsonSerializable()
class User extends _User with _$User {
  static User fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  static Map<String, dynamic> toJson(User User) => _$UserToJson(User);
}

abstract class _User with Store {
  @observable
  int id;

  @observable
  String email;

  @observable
  bool isAdmin;

  @observable
  String name;
}
