import 'package:flutter/material.dart';

enum BmiCategory { underweight, healthyWeight, overweight, obesity }

extension BmiCategoryDetails on BmiCategory {
  String get displayName {
    switch (this) {
      case BmiCategory.underweight:
        return 'Underweight';
      case BmiCategory.healthyWeight:
        return 'Healthy Weight';
      case BmiCategory.overweight:
        return 'Overweight';
      case BmiCategory.obesity:
        return 'Obesity';
    }
  }

  Color get color {
    switch (this) {
      case BmiCategory.underweight:
        return const Color(0xFFF59E0B);
      case BmiCategory.healthyWeight:
        return const Color(0xFF10B981);
      case BmiCategory.overweight:
        return const Color(0xFFF97316);
      case BmiCategory.obesity:
        return const Color(0xFFEF4444);
    }
  }

  Color get softBackgroundColor {
    switch (this) {
      case BmiCategory.underweight:
        return const Color(0xFFFEF3C7);
      case BmiCategory.healthyWeight:
        return const Color(0xFFD1FAE5);
      case BmiCategory.overweight:
        return const Color(0xFFFFEDD5);
      case BmiCategory.obesity:
        return const Color(0xFFFEE2E2);
    }
  }

  IconData get icon {
    switch (this) {
      case BmiCategory.underweight:
        return Icons.info_outline_rounded;
      case BmiCategory.healthyWeight:
        return Icons.check_circle_outline_rounded;
      case BmiCategory.overweight:
        return Icons.warning_amber_rounded;
      case BmiCategory.obesity:
        return Icons.error_outline_rounded;
    }
  }

  String get description {
    switch (this) {
      case BmiCategory.underweight:
        return 'Your BMI is below the healthy range. Being underweight may be associated with nutritional deficiencies or weakened immunity. A balanced, nutrient-dense diet and consultation with a healthcare provider can help achieve a healthy weight.';
      case BmiCategory.healthyWeight:
        return 'Great job! Your BMI falls within the optimal healthy weight range for your height. Maintaining regular physical exercise and a balanced diet will help preserve this healthy state.';
      case BmiCategory.overweight:
        return 'Your BMI is slightly above the recommended healthy range. Making gradual lifestyle adjustments such as portion control, balanced nutrition, and daily aerobic exercise can help you return to a healthy weight range.';
      case BmiCategory.obesity:
        return 'Your BMI indicates obesity, which can increase the risk of cardiovascular conditions, hypertension, and diabetes. It is strongly advised to consult a qualified physician or dietitian for personalized guidance.';
    }
  }
}

class BmiResult {
  final double bmi;
  final BmiCategory category;
  final double heightCm;
  final double weightKg;
  final double minHealthyWeightKg;
  final double maxHealthyWeightKg;

  const BmiResult({
    required this.bmi,
    required this.category,
    required this.heightCm,
    required this.weightKg,
    required this.minHealthyWeightKg,
    required this.maxHealthyWeightKg,
  });

  String get formattedBmi => bmi.toStringAsFixed(1);
  String get formattedMinHealthyWeight => minHealthyWeightKg.toStringAsFixed(1);
  String get formattedMaxHealthyWeight => maxHealthyWeightKg.toStringAsFixed(1);
}
