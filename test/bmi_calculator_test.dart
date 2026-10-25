import 'package:flutter_test/flutter_test.dart';
import 'package:bmi_calculator/models/bmi_result.dart';
import 'package:bmi_calculator/services/bmi_calculator.dart';

void main() {
  group(
    'BmiCalculator - Core Calculation & Classification Tests (Experiment 10)',
    () {
      test(
        'Height: 170 cm, Weight: 65 kg -> BMI approximately 22.5 (Healthy)',
        () {
          final double bmi = BmiCalculator.calculateBmiMetric(
            heightCm: 170,
            weightKg: 65,
          );
          expect(bmi, closeTo(22.5, 0.05));
          expect(bmi.toStringAsFixed(1), equals('22.5'));

          final BmiCategory category = BmiCalculator.classifyBmi(bmi);
          expect(category, equals(BmiCategory.healthyWeight));
          expect(category.displayName, equals('Healthy Weight'));
        },
      );

      test(
        'Height: 170 cm, Weight: 50 kg -> BMI approximately 17.3 (Underweight)',
        () {
          final double bmi = BmiCalculator.calculateBmiMetric(
            heightCm: 170,
            weightKg: 50,
          );
          expect(bmi, closeTo(17.3, 0.05));
          expect(bmi.toStringAsFixed(1), equals('17.3'));

          final BmiCategory category = BmiCalculator.classifyBmi(bmi);
          expect(category, equals(BmiCategory.underweight));
          expect(category.displayName, equals('Underweight'));
        },
      );

      test(
        'Height: 170 cm, Weight: 80 kg -> BMI approximately 27.7 (Overweight)',
        () {
          final double bmi = BmiCalculator.calculateBmiMetric(
            heightCm: 170,
            weightKg: 80,
          );
          expect(bmi, closeTo(27.7, 0.05));
          expect(bmi.toStringAsFixed(1), equals('27.7'));

          final BmiCategory category = BmiCalculator.classifyBmi(bmi);
          expect(category, equals(BmiCategory.overweight));
          expect(category.displayName, equals('Overweight'));
        },
      );

      test(
        'Height: 170 cm, Weight: 100 kg -> BMI approximately 34.6 (Obesity)',
        () {
          final double bmi = BmiCalculator.calculateBmiMetric(
            heightCm: 170,
            weightKg: 100,
          );
          expect(bmi, closeTo(34.6, 0.05));
          expect(bmi.toStringAsFixed(1), equals('34.6'));

          final BmiCategory category = BmiCalculator.classifyBmi(bmi);
          expect(category, equals(BmiCategory.obesity));
          expect(category.displayName, equals('Obesity'));
        },
      );

      test('Boundary: BMI exactly 18.5 -> Healthy weight range', () {
        final BmiCategory category = BmiCalculator.classifyBmi(18.5);
        expect(category, equals(BmiCategory.healthyWeight));
      });

      test('Boundary: BMI just below 18.5 (18.49) -> Underweight', () {
        final BmiCategory category = BmiCalculator.classifyBmi(18.49);
        expect(category, equals(BmiCategory.underweight));
      });

      test('Boundary: BMI exactly 25.0 -> Overweight', () {
        final BmiCategory category = BmiCalculator.classifyBmi(25.0);
        expect(category, equals(BmiCategory.overweight));
      });

      test('Boundary: BMI just below 25.0 (24.99) -> Healthy weight range', () {
        final BmiCategory category = BmiCalculator.classifyBmi(24.99);
        expect(category, equals(BmiCategory.healthyWeight));
      });

      test('Boundary: BMI exactly 30.0 -> Obesity range', () {
        final BmiCategory category = BmiCalculator.classifyBmi(30.0);
        expect(category, equals(BmiCategory.obesity));
      });

      test('Boundary: BMI just below 30.0 (29.99) -> Overweight', () {
        final BmiCategory category = BmiCalculator.classifyBmi(29.99);
        expect(category, equals(BmiCategory.overweight));
      });
    },
  );

  group('BmiCalculator - Edge Cases & Exception Handling', () {
    test('Zero height throws ArgumentError', () {
      expect(
        () => BmiCalculator.calculateBmiMetric(heightCm: 0, weightKg: 70),
        throwsArgumentError,
      );
    });

    test('Negative height throws ArgumentError', () {
      expect(
        () => BmiCalculator.calculateBmiMetric(heightCm: -160, weightKg: 70),
        throwsArgumentError,
      );
    });

    test('Zero weight throws ArgumentError', () {
      expect(
        () => BmiCalculator.calculateBmiMetric(heightCm: 170, weightKg: 0),
        throwsArgumentError,
      );
    });

    test('Negative weight throws ArgumentError', () {
      expect(
        () => BmiCalculator.calculateBmiMetric(heightCm: 170, weightKg: -50),
        throwsArgumentError,
      );
    });
  });

  group('BmiCalculator - Input Validator Functions (Experiment 7)', () {
    test('validateHeightCm handles empty, non-numeric, negative, and out-of-range values', () {
      expect(
        BmiCalculator.validateHeightCm(null),
        contains('enter your height'),
      );
      expect(BmiCalculator.validateHeightCm(''), contains('enter your height'));
      expect(BmiCalculator.validateHeightCm('abc'), contains('valid numeric'));
      expect(
        BmiCalculator.validateHeightCm('-150'),
        contains('greater than 0'),
      );
      expect(BmiCalculator.validateHeightCm('0'), contains('greater than 0'));
      expect(
        BmiCalculator.validateHeightCm('25'),
        contains('realistic height'),
      );
      expect(
        BmiCalculator.validateHeightCm('350'),
        contains('realistic height'),
      );
      expect(BmiCalculator.validateHeightCm('175.5'), isNull);
    });

    test('validateWeightKg handles empty, non-numeric, negative, and out-of-range values', () {
      expect(
        BmiCalculator.validateWeightKg(null),
        contains('enter your weight'),
      );
      expect(BmiCalculator.validateWeightKg(''), contains('enter your weight'));
      expect(BmiCalculator.validateWeightKg('xyz'), contains('valid numeric'));
      expect(BmiCalculator.validateWeightKg('-60'), contains('greater than 0'));
      expect(BmiCalculator.validateWeightKg('0'), contains('greater than 0'));
      expect(BmiCalculator.validateWeightKg('5'), contains('realistic weight'));
      expect(
        BmiCalculator.validateWeightKg('600'),
        contains('realistic weight'),
      );
      expect(BmiCalculator.validateWeightKg('68.5'), isNull);
    });
  });

  group('BmiCalculator - Unit Conversion Helpers', () {
    test('feetAndInchesToCm converts correctly', () {
      final double cm = BmiCalculator.feetAndInchesToCm(5, 7);
      expect(cm, closeTo(170.18, 0.01));
    });

    test('poundsToKg and kgToPounds are reversible', () {
      const double originalKg = 70.0;
      final double lbs = BmiCalculator.kgToPounds(originalKg);
      final double convertedKg = BmiCalculator.poundsToKg(lbs);
      expect(convertedKg, closeTo(originalKg, 0.001));
    });
  });
}
