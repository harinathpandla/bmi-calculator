import 'package:flutter/material.dart';

import '../models/bmi_result.dart';
import '../widgets/bmi_category_indicator.dart';
import '../widgets/bmi_result_card.dart';
import '../widgets/custom_button.dart';

class ResultScreen extends StatelessWidget {
  final BmiResult result;

  const ResultScreen({super.key, required this.result});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your BMI Result'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          tooltip: 'Back to Calculator',
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline_rounded),
            tooltip: 'BMI Guidelines',
            onPressed: () => Navigator.pushNamed(context, '/about'),
          ),
        ],
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final double horizontalPadding = constraints.maxWidth > 600
                ? (constraints.maxWidth - 520) / 2
                : 20.0;

            return SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                horizontal: horizontalPadding,
                vertical: 20.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    'Assessment Summary',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF0F172A),
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'Based on height ${result.heightCm.toStringAsFixed(0)} cm and weight ${result.weightKg.toStringAsFixed(1)} kg',
                    style: const TextStyle(
                      fontSize: 13,
                      color: Color(0xFF64748B),
                    ),
                  ),
                  const SizedBox(height: 16),
                  BmiResultCard(result: result),
                  const SizedBox(height: 20),
                  BmiCategoryIndicator(currentCategory: result.category),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF1F5F9),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: const Color(0xFFE2E8F0)),
                    ),
                    child: const Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.medical_information_outlined,
                          size: 20,
                          color: Color(0xFF475569),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            'Note: These are general adult screening categories. BMI interpretation can differ for children, teenagers, pregnancy, and certain medical circumstances.',
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0xFF475569),
                              height: 1.4,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  CustomButton(
                    text: 'Recalculate / Modify Inputs',
                    icon: Icons.refresh_rounded,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  const SizedBox(height: 12),
                  CustomButton(
                    text: 'Learn More About BMI',
                    icon: Icons.menu_book_rounded,
                    isSecondary: true,
                    onPressed: () {
                      Navigator.pushNamed(context, '/about');
                    },
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: Text(
                      'ACE Engineering College • Harinath (24AG1A05A9)',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey.shade500,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
