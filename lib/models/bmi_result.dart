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
}
