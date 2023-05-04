import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:dine/screens/register_screen.dart';

void main() {
  group('RegisterScreen', () {
    testWidgets('displays all the required form fields', (WidgetTester tester) async {
      // Build the widget
      await tester.pumpWidget(const MaterialApp(home: RegisterScreen()));

      // Find the form fields
      final nameField = find.byKey(const Key('name_field'));
      final emailField = find.byKey(const Key('email_field'));
      final passwordField = find.byKey(const Key('password_field'));
      final confirmPasswordField = find.byKey(const Key('confirm_password_field'));

      // Verify the form fields are displayed
      expect(nameField, findsOneWidget);
      expect(emailField, findsOneWidget);
      expect(passwordField, findsOneWidget);
      expect(confirmPasswordField, findsOneWidget);
    });

    testWidgets('register button is disabled if form is invalid', (WidgetTester tester) async {
      // Build the widget
      await tester.pumpWidget(MaterialApp(home: RegisterScreen()));

      // Find the register button
      final registerButton = find.widgetWithText(ElevatedButton, 'Register');

      // Verify the button is initially disabled
      expect(registerButton, findsOneWidget);
      expect(tester.widget<ElevatedButton>(registerButton).enabled, isFalse);

      // Fill out the form with invalid data
      await tester.enterText(find.byKey(const Key('name_field')), 'John Doe');
      await tester.enterText(find.byKey(const Key('email_field')), 'john.doe');
      await tester.enterText(find.byKey(const Key('password_field')), 'password');
      await tester.enterText(find.byKey(const Key('confirm_password_field')), 'pass');

      // Verify the register button is still disabled
      expect(tester.widget<ElevatedButton>(registerButton).enabled, isFalse);
    });

    testWidgets('register button is enabled if form is valid', (WidgetTester tester) async {
      // Build the widget
      await tester.pumpWidget(const MaterialApp(home: RegisterScreen()));

      // Find the register button
      final registerButton = find.widgetWithText(ElevatedButton, 'Register');

      // Verify the button is initially disabled
      expect(registerButton, findsOneWidget);
      expect(tester.widget<ElevatedButton>(registerButton).enabled, isFalse);

      // Fill out the form with valid data
      await tester.enterText(find.byKey(const Key('name_field')), 'John Doe');
      await tester.enterText(find.byKey(const Key('email_field')), 'john.doe@example.com');
      await tester.enterText(find.byKey(const Key('password_field')), 'password');
      await tester.enterText(find.byKey(const Key('confirm_password_field')), 'password');

      // Verify the register button is enabled
      expect(tester.widget<ElevatedButton>(registerButton).enabled, isTrue);
    });
  });
}
