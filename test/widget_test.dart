import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bmi_calculator/main.dart';

void main() {
  testWidgets(
    'BMI Calculator - Full UI, Validation, Navigation, and Reset Workflow Test',
    (WidgetTester tester) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;
      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(const BmiCalculatorApp());
      await tester.pumpAndSettle();

      expect(find.text('BMI Calculator'), findsOneWidget);
      expect(find.text('Calculate BMI'), findsOneWidget);
      expect(find.text('Reset Inputs'), findsOneWidget);
      expect(find.text('Know Your Health Status'), findsOneWidget);

      final calculateBtn = find.widgetWithText(ElevatedButton, 'Calculate BMI');
      expect(calculateBtn, findsOneWidget);

      await tester.ensureVisible(calculateBtn);
      await tester.tap(calculateBtn);
      await tester.pumpAndSettle();

      expect(find.text('Please enter your height'), findsOneWidget);
      expect(find.text('Please enter your weight'), findsOneWidget);
      expect(find.text('Your BMI Result'), findsNothing);

      final textFields = find.byType(TextFormField);
      expect(textFields, findsNWidgets(2));

      await tester.enterText(textFields.at(0), '170');
      await tester.enterText(textFields.at(1), '65');
      await tester.pumpAndSettle();

      await tester.ensureVisible(calculateBtn);
      await tester.tap(calculateBtn);
      await tester.pumpAndSettle();

      expect(find.text('Your BMI Result'), findsOneWidget);
      expect(find.text('Assessment Summary'), findsOneWidget);
      expect(find.text('22.5'), findsOneWidget);
      expect(find.text('HEALTHY WEIGHT'), findsOneWidget);
      expect(find.text('BMI Category Ranges (WHO)'), findsOneWidget);
      expect(find.text('Recalculate / Modify Inputs'), findsOneWidget);

      final recalculateBtn = find.text('Recalculate / Modify Inputs');
      await tester.ensureVisible(recalculateBtn);
      await tester.tap(recalculateBtn);
      await tester.pumpAndSettle();

      expect(find.text('Your BMI Result'), findsNothing);
      expect(find.text('BMI Calculator'), findsOneWidget);

      final resetBtn = find.text('Reset Inputs');
      await tester.ensureVisible(resetBtn);
      await tester.tap(resetBtn);
      await tester.pumpAndSettle();

      expect(find.text('170'), findsNothing);
      expect(find.text('65'), findsNothing);
      expect(find.text('Inputs have been reset'), findsOneWidget);
    },
  );

  testWidgets('BMI Calculator - About Screen Navigation Test', (
    WidgetTester tester,
  ) async {
    tester.view.physicalSize = const Size(1080, 2400);
    tester.view.devicePixelRatio = 2.0;
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });

    await tester.pumpWidget(const BmiCalculatorApp());
    await tester.pumpAndSettle();

    final infoButton = find.byTooltip('About BMI');
    expect(infoButton, findsOneWidget);

    await tester.tap(infoButton);
    await tester.pumpAndSettle();

    expect(find.text('About BMI'), findsOneWidget);
    expect(find.text('What is Body Mass Index (BMI)?'), findsOneWidget);
    expect(find.text('The BMI Formula'), findsOneWidget);
    expect(find.text('ACE Engineering College'), findsOneWidget);
    expect(find.text('Harinath'), findsOneWidget);
    expect(find.text('24AG1A05A9'), findsOneWidget);

    final backButton = find.byTooltip('Back');
    await tester.tap(backButton);
    await tester.pumpAndSettle();

    expect(find.text('BMI Calculator'), findsOneWidget);
  });
}
