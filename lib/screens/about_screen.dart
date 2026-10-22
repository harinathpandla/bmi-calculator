import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About BMI'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          tooltip: 'Back',
          onPressed: () => Navigator.pop(context),
        ),
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
                  _buildSectionCard(
                    title: 'What is Body Mass Index (BMI)?',
                    icon: Icons.help_outline_rounded,
                    child: const Text(
                      'Body Mass Index (BMI) is an internationally recognized anthropometric screening metric used to classify weight status in adults relative to their height. Developed in the 19th century by Belgian polymath Adolphe Quetelet, it is widely utilized by the World Health Organization (WHO) and healthcare professionals worldwide as an initial tool to gauge body mass and potential risk factors.',
                      style: TextStyle(
                        fontSize: 14,
                        height: 1.5,
                        color: Color(0xFF334155),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildSectionCard(
                    title: 'The BMI Formula',
                    icon: Icons.functions_rounded,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'The formula calculates weight in kilograms divided by the square of height in meters:',
                          style: TextStyle(
                            fontSize: 14,
                            height: 1.4,
                            color: Color(0xFF334155),
                          ),
                        ),
                        const SizedBox(height: 12),
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(
                            vertical: 14,
                            horizontal: 16,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFFF1F5F9),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: const Color(0xFFCBD5E1)),
                          ),
                          child: const Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Metric Formula',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xFF0F766E),
                                  letterSpacing: 0.5,
                                ),
                              ),
                              SizedBox(height: 6),
                              Text(
                                'BMI = Weight (kg) / [Height (m)]²',
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w800,
                                  color: Color(0xFF0F172A),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 12),
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(
                            vertical: 14,
                            horizontal: 16,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFFF1F5F9),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: const Color(0xFFCBD5E1)),
                          ),
                          child: const Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Imperial Formula',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xFF0F766E),
                                  letterSpacing: 0.5,
                                ),
                              ),
                              SizedBox(height: 6),
                              Text(
                                'BMI = 703 × Weight (lbs) / [Height (in)]²',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w800,
                                  color: Color(0xFF0F172A),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildSectionCard(
                    title: 'WHO Adult BMI Categories',
                    icon: Icons.table_chart_outlined,
                    child: Column(
                      children: [
                        _buildCategoryRow(
                          'Underweight',
                          '< 18.5',
                          const Color(0xFFF59E0B),
                        ),
                        const Divider(height: 10, color: Color(0xFFE2E8F0)),
                        _buildCategoryRow(
                          'Healthy Weight',
                          '18.5 – 24.9',
                          const Color(0xFF10B981),
                        ),
                        const Divider(height: 10, color: Color(0xFFE2E8F0)),
                        _buildCategoryRow(
                          'Overweight',
                          '25.0 – 29.9',
                          const Color(0xFFF97316),
                        ),
                        const Divider(height: 10, color: Color(0xFFE2E8F0)),
                        _buildCategoryRow(
                          'Obesity Range',
                          '≥ 30.0',
                          const Color(0xFFEF4444),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildSectionCard(
                    title: 'Limitations of BMI',
                    icon: Icons.warning_amber_rounded,
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'While BMI is a simple and cost-effective population screening tool, it has distinct limitations:',
                          style: TextStyle(
                            fontSize: 14,
                            height: 1.4,
                            color: Color(0xFF334155),
                          ),
                        ),
                        SizedBox(height: 10),
                        _BulletPoint(
                          text: 'Does not distinguish between muscle mass and fat tissue (athletes may show high BMI despite low body fat).',
                        ),
                        _BulletPoint(
                          text: 'Does not account for bone density, ethnicity, or body fat distribution (e.g. abdominal vs peripheral fat).',
                        ),
                        _BulletPoint(
                          text: 'Not suitable as a primary metric for children, teenagers, elderly individuals, or pregnant individuals without adjusted clinical tables.',
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildSectionCard(
                    title: 'Academic Project Details',
                    icon: Icons.school_rounded,
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _InfoRow(
                          label: 'Institution',
                          value: 'ACE Engineering College',
                        ),
                        _InfoRow(
                          label: 'Course',
                          value: 'B.Tech UI Design – Flutter Lab',
                        ),
                        _InfoRow(label: 'Student Name', value: 'Harinath'),
                        _InfoRow(label: 'Roll Number', value: '24AG1A05A9'),
                        _InfoRow(
                          label: 'Academic Year',
                          value: '3rd Year – Semester 1 (2026)',
                        ),
                        _InfoRow(
                          label: 'Framework',
                          value: 'Flutter & Dart SDK',
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildSectionCard({
    required String title,
    required IconData icon,
    required Widget child,
  }) {
    return Card(
      elevation: 1.5,
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: const Color(0xFF0D9488), size: 22),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF0F172A),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 14),
            child,
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryRow(String name, String range, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Container(
            width: 10,
            height: 10,
            decoration: BoxDecoration(color: color, shape: BoxShape.circle),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              name,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Color(0xFF1E293B),
              ),
            ),
          ),
          Text(
            range,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w700,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}

class _BulletPoint extends StatelessWidget {
  final String text;

  const _BulletPoint({required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '• ',
            style: TextStyle(fontSize: 16, color: Color(0xFF0D9488)),
          ),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 13,
                height: 1.4,
                color: Color(0xFF475569),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final String label;
  final String value;

  const _InfoRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 110,
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: Color(0xFF64748B),
              ),
            ),
          ),
          const Text(': ', style: TextStyle(color: Color(0xFF94A3B8))),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w700,
                color: Color(0xFF0F172A),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
