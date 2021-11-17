import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: MyStepper(),
  ));
}

class MyStepper extends StatefulWidget {
  const MyStepper({Key? key}) : super(key: key);
  @override
  _MyStepperState createState() => _MyStepperState();
}

class _MyStepperState extends State<MyStepper> {
  int _currentStep = 0;

  List<Step> mySteps = [
    const Step(title: Text("Paso 1"), content: Text("Que hacer en paso 1")),
    const Step(title: Text("Paso 2"), content: Text("Que hacer en paso 2")),
    const Step(title: Text("Paso 3"), content: Text("Que hacer en paso 3")),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Stepper"),
      ),
      body: Container(
          child: Stepper(
        currentStep: _currentStep,
        steps: mySteps,
        type: StepperType.vertical,
        onStepTapped: (stop) {
          setState(() {
            _currentStep = stop;
          });
        },
        onStepCancel: () {
          setState(() {
            if (_currentStep > 0) {
              _currentStep = _currentStep - 1;
            } else {
              _currentStep = 0;
            }
          });
        },
        onStepContinue: () {
          setState(() {
            if (_currentStep < mySteps.length-1) {
              _currentStep = _currentStep + 1;
            } else {
              _currentStep = mySteps.length-1;
            }
          });
        },
      )),
    );
  }
}
