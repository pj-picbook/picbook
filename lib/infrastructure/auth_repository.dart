import 'package:picbook/infrastructure/locator.dart';
import 'package:picbook/infrastructure/auth_service.dart';

class AuthRepository {
  final AuthService _authService = getIt<AuthService>();

  Future logIn(String email, String password) async {
    var result = await _authService.logIn(email, password);
    return result;
  }

  Future signUp(String email, String password) async {
    var result = await _authService.signUp(email, password);
    return result;
  }
}
