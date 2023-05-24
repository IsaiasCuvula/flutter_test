import 'package:flutter_test/flutter_test.dart';
import 'package:learn_test/shared/auth/auth_service.dart';

void main() {
  late Auth auth;

  setUp(() {
    auth = Auth();
  });
  group('auth validator', () {
    test('- return msg for invalid email and password', () {
      final result = auth.register('billify', '123');
      expect(result, isA<String>());
    });

    test('- return null for valid email and password', () {
      final result = auth.register('billify@gmail.com', 'billify78');
      expect(result, isNull);
    });
  });
}
