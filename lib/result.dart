import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  Result(
      {Key? key, required this.result, required this.isMale, required this.age})
      : super(key: key);

  Widget re(text) {
    return Text(
      text,
      style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
      textAlign: TextAlign.center,
    );
  }

  final double result;
  final bool isMale;
  final int age;

  String get resultPhase {
    String resultText = '';
    if (result >= 30)
      resultText = 'Obese';
    else if (result >= 25 && result < 30)
      resultText = 'Overweight';
    else if (result >= 18.5 && result < 24.9)
      resultText = 'Normal';
    else
      resultText = 'Thin';

    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(title: const Text("Result"), centerTitle: true),
      body: Center(
          child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            re("Result: ${result.toStringAsFixed(1)}"),
            re('Gender: ${isMale ? 'Male' : 'Female'}'),
            re("Age: $age"),
            re("Health: $resultPhase"),
          ],
        ),
      )),
    ));
  }
}
