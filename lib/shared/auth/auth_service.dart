import 'package:learn_test/shared/validators/email_validator.dart';
import 'package:learn_test/shared/validators/password_validators.dart';

class Auth {
  register(String? email, String? password) {
    final emailError = EmailValidator().validate(email: email);
    final passwordError = PasswordValidator().validate(password: password);
    return emailError ?? passwordError;
  }
}
