import 'package:{{name.lowerCase()}}/models/user.dart';

class UserRepository {
  UserModel? _userModel;

  UserModel? get userDataModel => _userModel;

  void saveUserData(UserModel userData) {
    _userModel = userData;
  }
}
