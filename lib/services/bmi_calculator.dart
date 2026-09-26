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
}
