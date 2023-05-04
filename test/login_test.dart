import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:dine/screens/login_screen.dart';

void main() {
  group('LogInScreen widget', () {
    testWidgets('renders Login text', (WidgetTester tester) async {
      // Build the LogInScreen widget.
      await tester.pumpWidget(const LogInScreen());

      // Find the Login text widget.
      final loginTextFinder = find.text('Login');

      // Expect to find the Login text widget.
      expect(loginTextFinder, findsOneWidget);
    });

    testWidgets('shows error message on invalid login', (WidgetTester tester) async {
      // Build the LogInScreen widget.
      await tester.pumpWidget(const LogInScreen());

      // Find the email and password fields.
      final emailFieldFinder = find.byType(TextFormField).at(0);
      final passwordFieldFinder = find.byType(TextFormField).at(1);

      // Enter invalid email and password.
      await tester.enterText(emailFieldFinder, 'invalid-email');
      await tester.enterText(passwordFieldFinder, 'password');

      // Find and tap the Login button.
      final loginButtonFinder = find.text('Login');
      await tester.tap(loginButtonFinder);
      await tester.pump();

      // Expect to find the error message.
      final errorMessageFinder = find.text('The email address is badly formatted.');
      expect(errorMessageFinder, findsOneWidget);
    });
  });
}
