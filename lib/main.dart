import 'package:flutter/material.dart';

import 'models/bmi_result.dart';
import 'screens/about_screen.dart';
import 'screens/home_screen.dart';
import 'screens/result_screen.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(const BmiCalculatorApp());
}

class BmiCalculatorApp extends StatelessWidget {
  const BmiCalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI Calculator',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/about': (context) => const AboutScreen(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/result') {
          final result = settings.arguments as BmiResult;
          return MaterialPageRoute(
            builder: (context) => ResultScreen(result: result),
          );
        }
        return null;
      },
    );
  }
}
