import 'package:{{name.lowerCase()}}/repositories/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<bool> login() async {
    print("User Login Successfully");
    return true;
  }
}
