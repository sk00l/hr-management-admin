// import 'package:flutter/material.dart';

// class CustomStepperExample extends StatefulWidget {
//   const CustomStepperExample({super.key});

//   @override
//   State<CustomStepperExample> createState() => _CustomStepperExampleState();
// }

// class _CustomStepperExampleState extends State<CustomStepperExample> {
//   int _currentStep = 0;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("Custom Stepper Example")),
//       body: Stepper(
//         type: StepperType.horizontal,
//         steps: getSteps(),
//         currentStep: _currentStep,
//         onStepContinue: _currentStep < getSteps().length - 1
//             ? () {
//                 setState(() => _currentStep += 1);
//               }
//             : null,
//         onStepCancel: _currentStep > 0
//             ? () {
//                 setState(() => _currentStep -= 1);
//               }
//             : null,
//         controlsBuilder: (BuildContext context, ControlsDetails details) {
//           return Padding(
//             padding: const EdgeInsets.only(top: 16),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: <Widget>[
//                 ElevatedButton(
//                   onPressed: details.onStepContinue,
//                   style: ElevatedButton.styleFrom(
//                     padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
//                     textStyle: const TextStyle(fontSize: 16),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(8),
//                     ),
//                   ),
//                   child: const Text('Next'),
//                 ),
//                 if (_currentStep > 0)
//                   OutlinedButton(
//                     onPressed: details.onStepCancel,
//                     style: OutlinedButton.styleFrom(
//                       padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
//                       textStyle: const TextStyle(fontSize: 16),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(8),
//                       ),
//                     ),
//                     child: const Text('Back'),
//                   ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }

//   List<Step> getSteps() => [
//         Step(
//           isActive: _currentStep >= 0,
//           title: const Text("Step 1"),
//           content: const Text("Content for Step 1"),
//         ),
//         Step(
//           isActive: _currentStep >= 1,
//           title: const Text("Step 2"),
//           content: const Text("Content
