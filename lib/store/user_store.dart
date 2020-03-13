import 'package:attendance_portal/models/user.dart';
import 'package:mobx/mobx.dart';

part 'user_store.g.dart';

class UserStore = _UserStore with _$UserStore;

abstract class _UserStore with Store {
  @observable
  User user;

  @action
  setLoggedInUser(User user) {
    print('printing user object');
    print('$user');
    this.user = user;
  }
}
