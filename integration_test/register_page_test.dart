import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:learn_test/pages/register_page.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('testing email fields', () {
    testWidgets('Be sure email field will show up', (widgetTester) async {
      await widgetTester.pumpWidget(
        const MaterialApp(
          home: RegisterPage(),
        ),
      );
      //testing if email field is showing up
      final emailKey = find.byKey(const Key('email_key'));
      expect(emailKey, findsOneWidget);
    });

    testWidgets('Display SnackBar with error msg if email is null',
        (widgetTester) async {
      await widgetTester.pumpWidget(
        const MaterialApp(
          home: RegisterPage(),
        ),
      );

      final registerButton = find.byKey(
        const Key('register_button_key'),
      );
      await widgetTester.tap(registerButton);
      await widgetTester.pumpAndSettle();

      expect(find.text('Email is required'), findsOneWidget);
    });

    testWidgets('Display SnackBar with error msg if email isEmpty',
        (widgetTester) async {
      //get the rigth page
      await widgetTester.pumpWidget(
        const MaterialApp(
          home: RegisterPage(),
        ),
      );

      final emailField = find.byKey(const Key('email_key'));
      await widgetTester.tap(emailField);
      //wait auntil all animation are rendered
      await widgetTester.pumpAndSettle();

      await widgetTester.enterText(emailField, '');
      await widgetTester.pumpAndSettle();

      final registerButton = find.byKey(
        const Key('register_button_key'),
      );
      //button click
      await widgetTester.tap(registerButton);
      await widgetTester.pumpAndSettle();

      expect(find.text('Email is required'), findsOneWidget);
    });

    testWidgets('Display SnackBar with error msg if email is invalid',
        (widgetTester) async {
      //get the rigth page
      await widgetTester.pumpWidget(
        const MaterialApp(
          home: RegisterPage(),
        ),
      );

      final emailField = find.byKey(const Key('email_key'));
      //click on textField
      await widgetTester.tap(emailField);
      //wait auntil all animation are rendered
      await widgetTester.pumpAndSettle();

      await widgetTester.enterText(emailField, 'isaias');
      await widgetTester.pumpAndSettle();

      final registerButton = find.byKey(
        const Key('register_button_key'),
      );
      //button click
      await widgetTester.tap(registerButton);
      await widgetTester.pumpAndSettle();

      expect(find.text('Invalid email'), findsOneWidget);
    });

    testWidgets('Display SnackBar with error msg if email is invalid',
        (widgetTester) async {
      //render page
      await widgetTester.pumpWidget(
        const MaterialApp(
          home: RegisterPage(),
        ),
      );

      final emailField = find.byKey(const Key('email_key'));
      //click on textField
      await widgetTester.tap(emailField);
      //wait auntil all animation are rendered
      await widgetTester.pumpAndSettle();

      await widgetTester.enterText(emailField, 'isaias@example.com');
      await widgetTester.pumpAndSettle();

      final registerButton = find.byKey(
        const Key('register_button_key'),
      );
      //button click
      await widgetTester.tap(registerButton);
      await widgetTester.pumpAndSettle();

      expect(find.text('Invalid email'), findsNothing);
    });
  });

  //Testing passwords
  group('testing password fields', () {
    testWidgets('Be sure password field will show up', (widgetTester) async {
      await widgetTester.pumpWidget(
        const MaterialApp(
          home: RegisterPage(),
        ),
      );
      //testing if email field is showing up
      final passwordKey = find.byKey(const Key('password_key'));
      expect(passwordKey, findsOneWidget);
    });

    testWidgets('Display SnackBar with error msg if password is null',
        (widgetTester) async {
      await widgetTester.pumpWidget(
        const MaterialApp(
          home: RegisterPage(),
        ),
      );

      final emailFiled = find.byKey(const Key('email_key'));
      await widgetTester.tap(emailFiled);
      await widgetTester.pumpAndSettle();

      await widgetTester.enterText(emailFiled, 'isaias@example.com');
      await widgetTester.pumpAndSettle();

      final registerButton = find.byKey(
        const Key('register_button_key'),
      );
      await widgetTester.tap(registerButton);
      await widgetTester.pumpAndSettle();

      expect(find.text('Password is required'), findsOneWidget);
    });

    testWidgets('Display SnackBar with error msg if password isEmpty',
        (widgetTester) async {
      //get the rigth page
      await widgetTester.pumpWidget(
        const MaterialApp(
          home: RegisterPage(),
        ),
      );

      //filling the email field
      final emailFiled = find.byKey(const Key('email_key'));
      await widgetTester.tap(emailFiled);
      await widgetTester.pumpAndSettle();

      await widgetTester.enterText(emailFiled, 'isaias@example.com');
      await widgetTester.pumpAndSettle();

      final passwordField = find.byKey(const Key('password_key'));
      await widgetTester.tap(passwordField);
      //wait auntil all animation are rendered
      await widgetTester.pumpAndSettle();

      await widgetTester.enterText(passwordField, '');
      await widgetTester.pumpAndSettle();

      final registerButton = find.byKey(
        const Key('register_button_key'),
      );
      //button click
      await widgetTester.tap(registerButton);
      await widgetTester.pumpAndSettle();

      expect(find.text('Password is required'), findsOneWidget);
    });

    testWidgets('Display SnackBar with error msg if password is less than 6',
        (widgetTester) async {
      //get the rigth page
      await widgetTester.pumpWidget(
        const MaterialApp(
          home: RegisterPage(),
        ),
      );

      //filling the email field
      final emailFiled = find.byKey(const Key('email_key'));
      await widgetTester.tap(emailFiled);
      await widgetTester.pumpAndSettle();

      await widgetTester.enterText(emailFiled, 'isaias@example.com');
      await widgetTester.pumpAndSettle();

      final passwordField = find.byKey(const Key('password_key'));
      //click on textField
      await widgetTester.tap(passwordField);
      //wait auntil all animation are rendered
      await widgetTester.pumpAndSettle();

      await widgetTester.enterText(passwordField, '123');
      await widgetTester.pumpAndSettle();

      final registerButton = find.byKey(
        const Key('register_button_key'),
      );
      //button click
      await widgetTester.tap(registerButton);
      await widgetTester.pumpAndSettle();

      expect(
        find.text('Password need to be more than 6 characters'),
        findsOneWidget,
      );
    });

    testWidgets(
        'Display SnackBar with error msg if password is not an alphanumeric',
        (widgetTester) async {
      //render page
      await widgetTester.pumpWidget(
        const MaterialApp(
          home: RegisterPage(),
        ),
      );

      //filling the email field
      final emailFiled = find.byKey(const Key('email_key'));
      await widgetTester.tap(emailFiled);
      await widgetTester.pumpAndSettle();

      await widgetTester.enterText(emailFiled, 'isaias@example.com');
      await widgetTester.pumpAndSettle();

      final passwordField = find.byKey(const Key('password_key'));
      //click on textField
      await widgetTester.tap(passwordField);
      //wait auntil all animation are rendered
      await widgetTester.pumpAndSettle();

      await widgetTester.enterText(passwordField, 'isaias');
      await widgetTester.pumpAndSettle();

      final registerButton = find.byKey(
        const Key('register_button_key'),
      );
      //button click
      await widgetTester.tap(registerButton);
      await widgetTester.pumpAndSettle();

      expect(find.text('Password need to be alphanumeric'), findsOneWidget);
    });

    testWidgets('Display SnackBar with error msg if password is valid',
        (widgetTester) async {
      //render page
      await widgetTester.pumpWidget(
        const MaterialApp(
          home: RegisterPage(),
        ),
      );

      //filling the email field
      final emailFiled = find.byKey(const Key('email_key'));
      await widgetTester.tap(emailFiled);
      await widgetTester.pumpAndSettle();

      await widgetTester.enterText(emailFiled, 'isaias@example.com');
      await widgetTester.pumpAndSettle();

      final passwordField = find.byKey(const Key('password_key'));
      //click on textField
      await widgetTester.tap(passwordField);
      //wait auntil all animation are rendered
      await widgetTester.pumpAndSettle();

      await widgetTester.enterText(passwordField, 'billify78');
      await widgetTester.pumpAndSettle();

      final registerButton = find.byKey(
        const Key('register_button_key'),
      );
      //button click
      await widgetTester.tap(registerButton);
      await widgetTester.pumpAndSettle();

      expect(find.text('Password need to be alphanumeric'), findsNothing);
    });
  });

  group('testing register button', () {
    testWidgets('Be sure register button will show up', (widgetTester) async {
      await widgetTester.pumpWidget(
        const MaterialApp(
          home: RegisterPage(),
        ),
      );
      //testing if email field is showing up
      final registerButtonKey = find.byKey(const Key('register_button_key'));
      expect(registerButtonKey, findsOneWidget);
    });

    testWidgets(
        'Display SnackBar with error msg if password  & email are empty',
        (widgetTester) async {
      //get the rigth page
      await widgetTester.pumpWidget(
        const MaterialApp(
          home: RegisterPage(),
        ),
      );

      //filling the email field
      final emailFiled = find.byKey(const Key('email_key'));
      await widgetTester.tap(emailFiled);
      await widgetTester.pumpAndSettle();

      await widgetTester.enterText(emailFiled, 'isaias');
      await widgetTester.pumpAndSettle();

      final passwordField = find.byKey(const Key('password_key'));
      //click on textField
      await widgetTester.tap(passwordField);
      //wait auntil all animation are rendered
      await widgetTester.pumpAndSettle();

      await widgetTester.enterText(passwordField, '123');
      await widgetTester.pumpAndSettle();

      final registerButton = find.byKey(
        const Key('register_button_key'),
      );
      //button click
      await widgetTester.tap(registerButton);
      await widgetTester.pumpAndSettle();

      expect(
        find.byType(SnackBar),
        findsOneWidget,
      );
    });

    testWidgets('Display nothing if password  & email are valid',
        (widgetTester) async {
      //get the rigth page
      await widgetTester.pumpWidget(
        const MaterialApp(
          home: RegisterPage(),
        ),
      );

      //filling the email field
      final emailFiled = find.byKey(const Key('email_key'));
      await widgetTester.tap(emailFiled);
      await widgetTester.pumpAndSettle();

      await widgetTester.enterText(emailFiled, 'isaias@example.com');
      await widgetTester.pumpAndSettle();

      final passwordField = find.byKey(const Key('password_key'));
      //click on textField
      await widgetTester.tap(passwordField);
      //wait auntil all animation are rendered
      await widgetTester.pumpAndSettle();

      await widgetTester.enterText(passwordField, '123testflutter');
      await widgetTester.pumpAndSettle();

      final registerButton = find.byKey(
        const Key('register_button_key'),
      );
      //button click
      await widgetTester.tap(registerButton);
      await widgetTester.pumpAndSettle();

      expect(
        find.byType(SnackBar),
        findsNothing,
      );
    });
  });
}
