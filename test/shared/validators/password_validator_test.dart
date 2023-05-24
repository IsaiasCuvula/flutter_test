import 'package:flutter_test/flutter_test.dart';
import 'package:learn_test/shared/validators/password_validators.dart';

void main() {
  late PasswordValidator passwordValidator;

  setUp(() {
    passwordValidator = PasswordValidator();
  });

  group('Password validation', () {
    test('- return error message if password is null', () {
      final result = passwordValidator.validate();
      expect(result, equals('Password is required'));
    });

    test('- return error message if password is empty', () {
      final result = passwordValidator.validate(password: '');
      expect(result, equals('Password is required'));
    });

    test('- return error message if password is less than 6 characters', () {
      final result = passwordValidator.validate(password: 'app');
      expect(result, equals('Password need to be more than 6 characters'));
    });

    test('- return error message if password is not alphanumeric', () {
      final result = passwordValidator.validate(password: 'billify');
      expect(result, equals('Password need to be alphanumeric'));
    });

    test('- return null password is valid', () {
      final result = passwordValidator.validate(password: 'billify78');
      expect(result, isNull);
    });
  });
}
