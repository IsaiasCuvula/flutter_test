import 'package:flutter_test/flutter_test.dart';
import 'package:learn_test/shared/validators/email_validator.dart';

void main() {
  late EmailValidator emailValidator;

  setUp(() {
    emailValidator = EmailValidator();
  });

  group('email validation', () {
    test('-return the message if the email is null', () {
      final result = emailValidator.validate();
      expect(result, equals('Email is required'));
    });

    test('-return the message if the email is empty', () {
      final result = emailValidator.validate();
      expect(result, equals('Email is required'));
    });

    test('-return the message if the email is not valid', () {
      final result = emailValidator.validate(email: 'isaias_cuvula');
      expect(result, equals('Invalid email'));
    });

    test('-return null if the email is valid', () {
      final result = emailValidator.validate(email: 'isaiascuvula@example.com');
      expect(result, isNull);
    });
  });
}
