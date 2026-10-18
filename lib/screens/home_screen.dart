import 'package:flutter/material.dart';

import '../models/bmi_result.dart';
import '../services/bmi_calculator.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_input_field.dart';
import 'result_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _heightCmController = TextEditingController();
  final TextEditingController _weightKgController = TextEditingController();

  final TextEditingController _heightFeetController = TextEditingController();
  final TextEditingController _heightInchesController = TextEditingController();
  final TextEditingController _weightLbsController = TextEditingController();

  bool _isMetric = true;

  @override
  void dispose() {
    _heightCmController.dispose();
    _weightKgController.dispose();
    _heightFeetController.dispose();
    _heightInchesController.dispose();
    _weightLbsController.dispose();
    super.dispose();
  }

  void _toggleUnitSystem(bool metric) {
    if (_isMetric == metric) return;

    setState(() {
      if (metric) {
        final double? feet = double.tryParse(_heightFeetController.text.trim());
        final double? inches = double.tryParse(
          _heightInchesController.text.trim(),
        );
        if (feet != null && feet > 0) {
          final double cm = BmiCalculator.feetAndInchesToCm(feet, inches ?? 0);
          _heightCmController.text = cm.toStringAsFixed(1);
        }

        final double? lbs = double.tryParse(_weightLbsController.text.trim());
        if (lbs != null && lbs > 0) {
          final double kg = BmiCalculator.poundsToKg(lbs);
          _weightKgController.text = kg.toStringAsFixed(1);
        }
      } else {
        final double? cm = double.tryParse(_heightCmController.text.trim());
        if (cm != null && cm > 0) {
          final converted = BmiCalculator.cmToFeetAndInches(cm);
          _heightFeetController.text = converted.feet.toString();
          _heightInchesController.text = converted.inches.toStringAsFixed(1);
        }

        final double? kg = double.tryParse(_weightKgController.text.trim());
        if (kg != null && kg > 0) {
          final double lbs = BmiCalculator.kgToPounds(kg);
          _weightLbsController.text = lbs.toStringAsFixed(1);
        }
      }

      _isMetric = metric;
      _formKey.currentState?.reset();
    });
  }

  void _calculateBmi() {
    FocusScope.of(context).unfocus();

    if (_formKey.currentState == null || !_formKey.currentState!.validate()) {
      return;
    }

    double heightCm = 0.0;
    double weightKg = 0.0;

    if (_isMetric) {
      heightCm = double.parse(_heightCmController.text.trim());
      weightKg = double.parse(_weightKgController.text.trim());
    } else {
      final double feet = double.parse(_heightFeetController.text.trim());
      final double inches = double.parse(_heightInchesController.text.trim());
      final double lbs = double.parse(_weightLbsController.text.trim());

      heightCm = BmiCalculator.feetAndInchesToCm(feet, inches);
      weightKg = BmiCalculator.poundsToKg(lbs);
    }

    final BmiResult result = BmiCalculator.computeResult(
      heightCm: heightCm,
      weightKg: weightKg,
    );

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ResultScreen(result: result)),
    );
  }

  void _resetFields() {
    setState(() {
      _heightCmController.clear();
      _weightKgController.clear();
      _heightFeetController.clear();
      _heightInchesController.clear();
      _weightLbsController.clear();
      _formKey.currentState?.reset();
      FocusScope.of(context).unfocus();
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Inputs have been reset'),
        duration: Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator'),
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline_rounded),
            tooltip: 'About BMI',
            onPressed: () {
              Navigator.pushNamed(context, '/about');
            },
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
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _buildIntroductionCard(),
                    const SizedBox(height: 18),
                    _buildUnitToggle(),
                    const SizedBox(height: 20),
                    _buildInputCard(),
                    const SizedBox(height: 24),
                    _buildActionButtons(),
                    const SizedBox(height: 24),
                    _buildDisclaimerCard(),
                    const SizedBox(height: 20),
                    _buildStudentFooter(screenSize),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildIntroductionCard() {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF0F172A), Color(0xFF1E293B)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF0F172A).withValues(alpha: 0.15),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: const Row(
        children: [
          CircleAvatar(
            radius: 26,
            backgroundColor: Color(0xFF0D9488),
            child: Icon(Icons.favorite_rounded, color: Colors.white, size: 28),
          ),
          SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Know Your Health Status',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'Enter your height and weight below to compute your Body Mass Index (BMI).',
                  style: TextStyle(
                    fontSize: 13,
                    color: Color(0xFF94A3B8),
                    height: 1.3,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUnitToggle() {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFE2E8F0),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(4),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () => _toggleUnitSystem(true),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                padding: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: _isMetric
                      ? const Color(0xFF0D9488)
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: _isMetric
                      ? [
                          BoxShadow(
                            color: const Color(0xFF0D9488)
                                .withValues(alpha: 0.3),
                            blurRadius: 6,
                            offset: const Offset(0, 2),
                          ),
                        ]
                      : null,
                ),
                child: Center(
                  child: Text(
                    'Metric (cm / kg)',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: _isMetric ? Colors.white : const Color(0xFF475569),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () => _toggleUnitSystem(false),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                padding: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: !_isMetric
                      ? const Color(0xFF0D9488)
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: !_isMetric
                      ? [
                          BoxShadow(
                            color: const Color(0xFF0D9488)
                                .withValues(alpha: 0.3),
                            blurRadius: 6,
                            offset: const Offset(0, 2),
                          ),
                        ]
                      : null,
                ),
                child: Center(
                  child: Text(
                    'Imperial (ft / lbs)',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: !_isMetric
                          ? Colors.white
                          : const Color(0xFF475569),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInputCard() {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  _isMetric
                      ? Icons.straighten_rounded
                      : Icons.format_line_spacing_rounded,
                  color: const Color(0xFF0D9488),
                  size: 22,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    _isMetric
                        ? 'Enter Measurements (Metric)'
                        : 'Enter Measurements (Imperial)',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF0F172A),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 18),
            if (_isMetric) ...[
              CustomInputField(
                label: 'Height',
                hint: 'e.g. 170',
                controller: _heightCmController,
                validator: BmiCalculator.validateHeightCm,
                prefixIcon: Icons.height_rounded,
                suffixText: 'cm',
              ),
            ] else ...[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: CustomInputField(
                      label: 'Height (Feet)',
                      hint: 'e.g. 5',
                      controller: _heightFeetController,
                      validator: BmiCalculator.validateHeightFeet,
                      prefixIcon: Icons.height_rounded,
                      suffixText: 'ft',
                    ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: CustomInputField(
                      label: 'Inches',
                      hint: 'e.g. 7',
                      controller: _heightInchesController,
                      validator: BmiCalculator.validateHeightInches,
                      prefixIcon: Icons.format_size_rounded,
                      suffixText: 'in',
                    ),
                  ),
                ],
              ),
            ],
            const SizedBox(height: 18),
            if (_isMetric) ...[
              CustomInputField(
                label: 'Weight',
                hint: 'e.g. 65',
                controller: _weightKgController,
                validator: BmiCalculator.validateWeightKg,
                prefixIcon: Icons.monitor_weight_outlined,
                suffixText: 'kg',
              ),
            ] else ...[
              CustomInputField(
                label: 'Weight',
                hint: 'e.g. 143',
                controller: _weightLbsController,
                validator: BmiCalculator.validateWeightLbs,
                prefixIcon: Icons.fitness_center_rounded,
                suffixText: 'lbs',
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildActionButtons() {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: CustomButton(
            text: 'Calculate BMI',
            icon: Icons.calculate_rounded,
            onPressed: _calculateBmi,
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          width: double.infinity,
          child: CustomButton(
            text: 'Reset Inputs',
            icon: Icons.refresh_rounded,
            isSecondary: true,
            onPressed: _resetFields,
          ),
        ),
      ],
    );
  }

  Widget _buildDisclaimerCard() {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFFF1F5F9),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      child: const Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.shield_outlined, size: 20, color: Color(0xFF64748B)),
          SizedBox(width: 10),
          Expanded(
            child: Text(
              'Notice: BMI is a general screening indicator for adult body mass, not a medical diagnosis. Factors such as muscularity, bone structure, and age can alter interpretation.',
              style: TextStyle(
                fontSize: 12,
                color: Color(0xFF475569),
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStudentFooter(Size screenSize) {
    return Center(
      child: Column(
        children: [
          Text(
            'ACE Engineering College • UI Design Flutter Lab',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: Colors.grey.shade600,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            'Harinath • Roll No: 24AG1A05A9 • 3rd Year Sem 1',
            style: TextStyle(fontSize: 11, color: Colors.grey.shade500),
          ),
        ],
      ),
    );
  }
}
