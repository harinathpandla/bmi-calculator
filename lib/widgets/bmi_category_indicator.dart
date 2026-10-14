import 'package:flutter/material.dart';

import '../models/bmi_result.dart';

class BmiCategoryIndicator extends StatelessWidget {
  final BmiCategory currentCategory;

  const BmiCategoryIndicator({super.key, required this.currentCategory});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: const BorderSide(color: Color(0xFFE2E8F0)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              children: [
                Icon(
                  Icons.bar_chart_rounded,
                  color: Color(0xFF0F766E),
                  size: 22,
                ),
                SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'BMI Category Ranges (WHO)',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF0F172A),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 14),
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Row(
                children: [
                  _buildBarSegment(const Color(0xFFF59E0B), 1),
                  const SizedBox(width: 2),
                  _buildBarSegment(const Color(0xFF10B981), 1),
                  const SizedBox(width: 2),
                  _buildBarSegment(const Color(0xFFF97316), 1),
                  const SizedBox(width: 2),
                  _buildBarSegment(const Color(0xFFEF4444), 1),
                ],
              ),
            ),
            const SizedBox(height: 14),
            _buildCategoryRow(
              title: 'Underweight',
              range: '< 18.5',
              category: BmiCategory.underweight,
              color: const Color(0xFFF59E0B),
            ),
            const Divider(height: 12, thickness: 0.7, color: Color(0xFFF1F5F9)),
            _buildCategoryRow(
              title: 'Healthy Weight',
              range: '18.5 – 24.9',
              category: BmiCategory.healthyWeight,
              color: const Color(0xFF10B981),
            ),
            const Divider(height: 12, thickness: 0.7, color: Color(0xFFF1F5F9)),
            _buildCategoryRow(
              title: 'Overweight',
              range: '25.0 – 29.9',
              category: BmiCategory.overweight,
              color: const Color(0xFFF97316),
            ),
            const Divider(height: 12, thickness: 0.7, color: Color(0xFFF1F5F9)),
            _buildCategoryRow(
              title: 'Obesity Range',
              range: '≥ 30.0',
              category: BmiCategory.obesity,
              color: const Color(0xFFEF4444),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBarSegment(Color color, int flex) {
    return Expanded(
      flex: flex,
      child: Container(height: 8, color: color),
    );
  }

  Widget _buildCategoryRow({
    required String title,
    required String range,
    required BmiCategory category,
    required Color color,
  }) {
    final bool isSelected = category == currentCategory;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? color.withValues(alpha: 0.12) : Colors.transparent,
        borderRadius: BorderRadius.circular(8),
        border: isSelected
            ? Border.all(color: color, width: 1.5)
            : Border.all(color: Colors.transparent),
      ),
      child: Row(
        children: [
          Container(
            width: 12,
            height: 12,
            decoration: BoxDecoration(color: color, shape: BoxShape.circle),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                fontSize: 14,
                fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                color: isSelected
                    ? const Color(0xFF0F172A)
                    : const Color(0xFF475569),
              ),
            ),
          ),
          Text(
            range,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: isSelected ? color : const Color(0xFF64748B),
            ),
          ),
          if (isSelected) ...[
            const SizedBox(width: 8),
            Icon(Icons.check_circle, size: 16, color: color),
          ],
        ],
      ),
    );
  }
}
