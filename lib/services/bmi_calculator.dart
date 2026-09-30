import '../models/bmi_result.dart';

class BmiCalculator {
  static const double minHeightCm = 50.0;
  static const double maxHeightCm = 300.0;
  static const double minWeightKg = 10.0;
  static const double maxWeightKg = 500.0;

  static double calculateBmiMetric({
    required double heightCm,
    required double weightKg,
  }) {
    if (heightCm <= 0) {
      throw ArgumentError('Height in centimeters must be greater than zero.');
    }
    if (weightKg <= 0) {
      throw ArgumentError('Weight in kilograms must be greater than zero.');
    }

    final double heightMeters = heightCm / 100.0;
    return weightKg / (heightMeters * heightMeters);
  }

  static BmiCategory classifyBmi(double bmi) {
    if (bmi < 18.5) {
      return BmiCategory.underweight;
    } else if (bmi < 25.0) {
      return BmiCategory.healthyWeight;
    } else if (bmi < 30.0) {
      return BmiCategory.overweight;
    } else {
      return BmiCategory.obesity;
    }
  }

  static BmiResult computeResult({
    required double heightCm,
    required double weightKg,
  }) {
    final double bmi = calculateBmiMetric(
      heightCm: heightCm,
      weightKg: weightKg,
    );
    final BmiCategory category = classifyBmi(bmi);

    final double heightMeters = heightCm / 100.0;
    final double heightSquared = heightMeters * heightMeters;

    final double minHealthyWeight = 18.5 * heightSquared;
    final double maxHealthyWeight = 24.9 * heightSquared;

    return BmiResult(
      bmi: bmi,
      category: category,
      heightCm: heightCm,
      weightKg: weightKg,
      minHealthyWeightKg: minHealthyWeight,
      maxHealthyWeightKg: maxHealthyWeight,
    );
  }

  static double feetAndInchesToCm(double feet, double inches) {
    final double totalInches = (feet * 12.0) + inches;
    return totalInches * 2.54;
  }

  static double poundsToKg(double pounds) {
    return pounds * 0.45359237;
  }

  static double kgToPounds(double kg) {
    return kg / 0.45359237;
  }

  static ({int feet, double inches}) cmToFeetAndInches(double cm) {
    final double totalInches = cm / 2.54;
    final int feet = totalInches ~/ 12;
    final double inches = totalInches % 12;
    return (feet: feet, inches: inches);
  }
}
