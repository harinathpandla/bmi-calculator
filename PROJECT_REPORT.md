# ACE ENGINEERING COLLEGE
### (An Autonomous Institution, Accredited by NAAC with 'A' Grade)
**Department of Computer Science and Engineering / Information Technology**  
**Ankushapur, Ghatkesar, Medchal-Malkajgiri District, Telangana – 501301**

---

# ONE-WEEK TECHNICAL PROJECT REPORT

## **BMI CALCULATOR MOBILE APPLICATION USING FLUTTER AND DART**

**Submitted by:**  
**Harinath**  
**Roll Number:** 24AG1A05A9  
**Branch and Year:** B.Tech 3rd Year, Semester 1  
**Course:** UI Design – Flutter Lab  
**Academic Year:** 2025–2026  
**Project Duration:** 7 Days (One-Week Technical Project)  
**Project Guide / Mentor:** Department Project Guide & Lab Mentor  
**Submitted to:** Department of Computer Science and Engineering  

---

## TABLE OF CONTENTS

1. Certificate
2. Acknowledgement
3. Abstract
4. Introduction
5. Objectives of the Project
6. Problem Statement and Scope
7. Tools and Technologies Used
8. System Design / Methodology
9. Day-Wise Progress Report
10. Implementation and Results
11. Learning Outcomes
12. Challenges Faced and Solutions
13. Conclusion and Future Scope
14. References
15. Appendices / Supporting Evidence
16. Mentor Evaluation Sheet

---

## 1. CERTIFICATE

This is to certify that **Harinath**, bearing Roll Number **24AG1A05A9**, student of B.Tech 3rd Year, 1st Semester in the Department of Computer Science and Engineering at **ACE Engineering College**, has successfully completed the one-week technical project entitled:

> **"BMI CALCULATOR MOBILE APPLICATION USING FLUTTER AND DART"**

during the academic semester under the guidance of the faculty mentor in partial fulfillment of the requirements for the **UI Design – Flutter Lab** course.

<br><br>
___________________________________ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ___________________________________  
**Signature of Project Mentor** &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; **Head of Department (HoD)**  

**Date:** ________________________ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; **Place:** Ankushapur, Hyderabad  

---

## 2. ACKNOWLEDGEMENT

I express my deepest gratitude to our respected Principal and the Management of **ACE Engineering College** for providing excellent lab infrastructure and academic facilities.

I am immensely indebted to the **Head of the Department (HoD)** and my **Project Mentor / Faculty Guide** for their valuable guidance, encouragement, and constructive critique throughout the design, development, and testing phases of this mobile application project.

I also extend my sincere appreciation to my faculty members and peers for their continuous cooperation, constructive feedback, and support during the execution of this technical project.

**Harinath**  
Roll No: 24AG1A05A9  
B.Tech 3rd Year, Semester 1  

---

## 3. ABSTRACT

Body Mass Index (BMI) is an internationally acknowledged clinical screening parameter utilized to evaluate whether an adult has a healthy body mass in proportion to their stature. The **BMI Calculator Mobile Application** is developed as a complete cross-platform mobile solution utilizing Google's **Flutter framework** and the **Dart programming language**, designed specifically for the B.Tech UI Design – Flutter Lab curriculum at ACE Engineering College.

The application allows users to input their physiological metrics through either **Metric** (centimeters and kilograms) or **Imperial** (feet/inches and pounds) unit conventions. The system enforces robust input validation through Flutter's `Form` and `TextFormField` widgets, rejecting non-numeric, negative, out-of-range, or blank inputs. Once validated, the pure Dart business logic layer calculates the BMI utilizing Quetelet's metric formula $\text{BMI} = \frac{\text{weight}}{\text{height}^2}$ and classifies the outcome into World Health Organization (WHO) adult screening categories: *Underweight* ($<18.5$), *Healthy Weight* ($18.5 - 24.9$), *Overweight* ($25.0 - 29.9$), and *Obesity* ($\ge 30.0$).

The application incorporates a decoupled modular architecture separating models, services, presentation widgets, and screens. Responsive UI principles are implemented using `MediaQuery`, `LayoutBuilder`, and `SingleChildScrollView` to eliminate layout overflow. In addition, smooth implicit animations (`AnimatedOpacity` and `AnimatedContainer`) and automated unit and widget test suites using `flutter_test` ensure high software quality and functional reliability.

---

## 4. INTRODUCTION

Mobile application development has transitioned rapidly from platform-specific native silos toward unified cross-platform frameworks. Google's Flutter framework has emerged as an industry-standard SDK that allows developers to compile high-performance, natively rendered applications for Android, iOS, Web, and Desktop from a single codebase.

Health and personal wellness tracking have become critical facets of modern preventative healthcare. Body Mass Index (BMI), established by Adolphe Quetelet, provides an accessible screening metric to identify weight categories that may correlate with health risks.

Developing a BMI Calculator provides practical mastery of fundamental mobile UI engineering principles:
1. Widget tree hierarchy and widget composition.
2. Responsive layout adaptation across diverse smartphone screen sizes and orientations.
3. Strict form validation and user input error handling.
4. Screen transitions and data routing via the Flutter navigation stack.
5. Reactive state management using `StatefulWidget` and `setState()`.
6. Automated software testing (unit and widget tests).

---

## 5. OBJECTIVES OF THE PROJECT

1. **Design a Premium User Interface:** Develop an aesthetically refined mobile UI using Material Design 3 guidelines with a health-oriented dark navy and teal color scheme.
2. **Implement Lab Manual Concepts:** Systematically incorporate Experiments 2 through 10 from the ACE Engineering College Flutter Lab Manual.
3. **Ensure Reliable Validation:** Prevent runtime crashes by validating all inputs against empty states, negative numbers, non-numeric values, and unrealistic physiological bounds.
4. **Deliver Responsive Layouts:** Use `LayoutBuilder`, `MediaQuery`, and scrollable views to prevent `RenderFlex` overflow errors on any mobile screen.
5. **Architect Modular Code:** Maintain strict separation of concerns across models, services, reusable widgets, and screens.
6. **Perform Rigorous Testing:** Write and execute automated unit tests for calculation algorithms and boundary classifications, alongside widget tests for navigation and input resets.

---

## 6. PROBLEM STATEMENT AND SCOPE

### Problem Statement:
Users frequently seek quick, transparent, and accurate ways to evaluate their body mass status without intrusive advertisements, convoluted navigations, or mandatory internet connectivity. Many entry-level applications suffer from poor input validation, unhandled layout overflow on small screens, and lack of clarity regarding healthy weight targets.

### Project Scope:
- **In Scope:**
  - Metric input (height in cm, weight in kg).
  - Imperial input (height in feet & inches, weight in lbs) with synchronized conversion.
  - Form validation with descriptive inline error messages.
  - Accurate calculation of BMI rounded to 1 decimal place.
  - Classification into the 4 WHO adult categories.
  - Personalized healthy weight range calculation for the user's height.
  - Visual category spectrum bar with active highlight.
  - Multi-screen stack navigation with back/recalculate support.
  - Comprehensive educational "About BMI" screen.
  - Automated unit and widget tests.
- **Out of Scope:**
  - Pediatric BMI percentiles for children under 18 years.
  - Caloric intake estimation and daily diet tracking.
  - Cloud server user account synchronization (app works entirely offline).

---

## 7. TOOLS AND TECHNOLOGIES USED

| Tool / Technology | Purpose | Version / Details |
| :--- | :--- | :--- |
| **Dart SDK** | Programming language | v3.13.4 |
| **Flutter Framework** | Cross-platform UI toolkit & engine | v3.47.5 (Channel stable) |
| **Visual Studio Code** | IDE for source code editing | Latest Stable Version |
| **Flutter & Dart Plugins** | IDE language support and hot reload | Official extensions |
| **Material 3 Library** | UI styling, typography, and card components | Built into Flutter SDK |
| **flutter_test** | Unit & widget test automation | Built into Flutter SDK |
| **Git & GitHub** | Source code repository and version control | Git 2.x / GitHub Cloud |

---

## 8. SYSTEM DESIGN / METHODOLOGY

### 8.1 System Architecture

The application adopts a clean, layered architecture:

```
+-------------------------------------------------------+
|                    PRESENTATION LAYER                 |
|  HomeScreen          ResultScreen        AboutScreen   |
|         \                  |                  /       |
|          +-----------------+-----------------+        |
|                            |                          |
|                     REUSABLE WIDGETS                  |
|  CustomInputField   CustomButton   BmiResultCard      |
|  BmiCategoryIndicator                                 |
+-------------------------------------------------------+
                             |
                             v
+-------------------------------------------------------+
|                      LOGIC LAYER                      |
|                  BmiCalculator Service                |
|  - calculateBmiMetric()    - classifyBmi()            |
|  - computeResult()         - validateHeightCm()       |
|  - validateWeightKg()      - unit conversion helpers  |
+-------------------------------------------------------+
                             |
                             v
+-------------------------------------------------------+
|                      DATA MODEL                       |
|  BmiResult Model           BmiCategory Enum           |
+-------------------------------------------------------+
```

### 8.2 Application Navigation Workflow

```
[ Home Screen (Input Form) ]
           |
     (Tap Calculate)
           |
     [Form Valid?]
      /         \
   (No)         (Yes)
    /             \
[Show Errors]   [BmiCalculator.computeResult()]
                         |
                (Navigator.push)
                         |
                         v
             [ Screen 2: Result Screen ]
              /                       \
        (Recalculate)              (About BMI)
            /                            \
   (Navigator.pop)              (Navigator.pushNamed)
          /                                \
[ Return to Home Screen ]         [ Screen 3: About Screen ]
```

---

## 9. DAY-WISE PROGRESS REPORT

| Day | Activities Performed | Deliverables / Outcomes |
| :---: | :--- | :--- |
| **Day 1** | Requirement analysis, review of Flutter Lab Manual (Exp 2–10), and topic finalization. | Project requirements, feature checklist, and mathematical formula specifications finalized. |
| **Day 2** | Flutter and Dart environment verification (`flutter doctor`), project scaffolding in VS Code. | Configured workspace and verified Flutter 3.47.5 and Dart 3.13.4 setup. |
| **Day 3** | System design, domain modeling, and service layer creation (`BmiResult` and `BmiCalculator`). | Developed unit conversion logic, WHO category classifications, and validation logic. |
| **Day 4** | UI implementation: `AppTheme`, `CustomInputField`, `CustomButton`, and `HomeScreen`. | Built interactive input form with Metric/Imperial toggles and validation handling. |
| **Day 5** | Developed `ResultScreen`, `BmiResultCard`, `BmiCategoryIndicator`, and `AboutScreen`. | Completed animated result screen, WHO spectrum gauge, and multi-screen navigation flow. |
| **Day 6** | Automated testing using `flutter_test`, code formatting (`dart format`), static analysis (`flutter analyze`). | Ran unit tests and widget tests with 100% pass rate; resolved all lint warnings. |
| **Day 7** | GitHub repository setup, technical report preparation, and final project demonstration. | Committed clean codebase to GitHub and prepared final college project report. |

---

## 10. IMPLEMENTATION AND RESULTS

### 10.1 Key Mathematical Implementation

The core algorithm residing in `lib/services/bmi_calculator.dart` computes the index:

```dart
static double calculateBmiMetric({
  required double heightCm,
  required double weightKg,
}) {
  if (heightCm <= 0 || weightKg <= 0) {
    throw ArgumentError('Measurements must be greater than zero.');
  }
  final double heightMeters = heightCm / 100.0;
  return weightKg / (heightMeters * heightMeters);
}
```

### 10.2 Category Boundary Mapping

```dart
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
```

### 10.3 Test Execution Results

All unit and widget test cases executed successfully via `flutter test`:

| Test Case | Inputs | Expected Output | Actual Output | Result |
| :--- | :--- | :--- | :--- | :---: |
| Normal Case 1 | 170 cm, 65 kg | 22.5, Healthy Weight | 22.5, Healthy Weight | **PASSED** |
| Underweight Case | 170 cm, 50 kg | 17.3, Underweight | 17.3, Underweight | **PASSED** |
| Overweight Case | 170 cm, 80 kg | 27.7, Overweight | 27.7, Overweight | **PASSED** |
| Obesity Case | 170 cm, 100 kg | 34.6, Obesity | 34.6, Obesity | **PASSED** |
| Boundary Check 1 | BMI = 18.5 | Healthy Weight | Healthy Weight | **PASSED** |
| Boundary Check 2 | BMI = 25.0 | Overweight | Overweight | **PASSED** |
| Boundary Check 3 | BMI = 30.0 | Obesity | Obesity | **PASSED** |
| Empty Fields | Blank input | Error: "Please enter your height" | Error message displayed | **PASSED** |
| Reset Test | Tap Reset | Cleared fields & reset state | Fields cleared cleanly | **PASSED** |
| Navigation Test | Tap Calculate | Push to ResultScreen | Successfully navigated | **PASSED** |

---

## 11. LEARNING OUTCOMES

Through the execution of this one-week project, the following technical competencies were achieved:
1. **Flutter Layout Fluency:** Learned to nest `Scaffold`, `AppBar`, `Container`, `Card`, `Column`, and `Row` widgets effectively.
2. **Responsive Engineering:** Mastered `MediaQuery` and `LayoutBuilder` to adapt layouts dynamically and prevent `RenderFlex` overflow errors.
3. **Route Management:** Understood stack-based routing (`push`, `pop`, `pushNamed`) and transferring data payloads between screens.
4. **State Lifecycle:** Gained practical understanding of `StatefulWidget`, state mutations via `setState()`, and proper disposal of `TextEditingController` objects.
5. **Modular Reusability:** Built decoupled, reusable custom components and centralized application theming via `ThemeData`.
6. **Automated Testing:** Gained proficiency with the `flutter_test` package using `test()`, `testWidgets()`, and `WidgetTester`.

---

## 12. CHALLENGES FACED AND SOLUTIONS

| Challenge Encountered | Technical Action Taken | Outcome |
| :--- | :--- | :--- |
| **Keyboard Overlapping Inputs:** Soft keyboard triggered bottom pixel overflow on small screens. | Enclosed the form body inside a `SingleChildScrollView` combined with `SafeArea`. | Screen scrolls smoothly without any layout overflow warnings. |
| **Precision Discrepancies:** Raw floating-point arithmetic displayed unrounded values like `22.491349`. | Implemented `toStringAsFixed(1)` in the `BmiResult` presentation getter. | Clean, standardized output (e.g., `22.5`). |
| **Memory Leak Warnings:** Unreleased input controllers during navigation transitions. | Overrode the `dispose()` lifecycle method in `_HomeScreenState` to release all controllers. | Efficient memory lifecycle management without resource leaks. |
| **Form Reset Validation State:** Clearing text alone left red error borders on screen. | Utilized `_formKey.currentState?.reset()` alongside `controller.clear()`. | Fields and error borders reset completely to their clean initial state. |

---

## 13. CONCLUSION AND FUTURE SCOPE

### Conclusion:
The **BMI Calculator Mobile Application** was successfully engineered, tested, and documented within the one-week project timeframe. The application conforms strictly to the experiments in the ACE Engineering College Flutter Lab Manual, delivers accurate mathematical calculations, handles user validation gracefully, and runs seamlessly across mobile devices and web platforms.

### Future Scope:
1. **Local Data Persistence:** Implement SQLite or `shared_preferences` to maintain historical records of BMI measurements over time.
2. **Visual Graphing:** Integrate line charts to plot historical weight and BMI trends.
3. **Body Fat Percentage Calculator:** Incorporate circumference-based fat percentage estimations (US Navy Method).
4. **Export Health Summary:** Add PDF generation capability to share health assessment summaries with medical doctors.

---

## 14. REFERENCES

1. Google Flutter Documentation: [https://docs.flutter.dev/](https://docs.flutter.dev/)
2. Dart Language Tour: [https://dart.dev/guides/language/language-tour](https://dart.dev/guides/language/language-tour)
3. World Health Organization (WHO) BMI Classification: [https://www.who.int/data/gho/data/themes/topics/topic-details/GHO/body-mass-index](https://www.who.int/data/gho/data/themes/topics/topic-details/GHO/body-mass-index)
4. ACE Engineering College Flutter Lab Manual (2025–2026).
5. Flutter Material 3 Design Specifications: [https://m3.material.io/](https://m3.material.io/)

---

## 15. APPENDICES / SUPPORTING EVIDENCE

- **Source Code Repository:** [https://github.com/harinathpandla/bmi-calculator.git](https://github.com/harinathpandla/bmi-calculator.git)
- **Primary Platform:** Android / Cross-Platform Web
- **SDK Constraints:** Dart SDK `^3.13.4`, Flutter SDK `^3.47.5`

---

## 16. MENTOR EVALUATION SHEET

**Student Name:** Harinath &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; **Roll Number:** 24AG1A05A9  
**Project Title:** BMI Calculator Mobile Application Using Flutter and Dart  
**Mentor Name:** __________________________________  

| S.No. | Evaluation Criterion | Maximum Marks | Marks Awarded |
| :---: | :--- | :---: | :---: |
| 1 | Understanding of problem and objectives | 10 | &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |
| 2 | Technical knowledge and methodology | 20 | &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |
| 3 | Implementation / practical work | 25 | &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |
| 4 | Results, validation, and testing | 15 | &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |
| 5 | Report quality and documentation | 15 | &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |
| 6 | Presentation and viva-voce | 15 | &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |
| | **TOTAL** | **100** | &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |

<br>
**Mentor Remarks:**  
_______________________________________________________________________________________________  
_______________________________________________________________________________________________  

<br>
**Mentor Signature:** ____________________ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; **Date:** ____________________  

<br>
**Head of Department (HoD) Signature:** ____________________
