import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final int age;
  final String gender;
  final String result;

  ResultPage({required this.age, required this.gender, required this.result});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("BMI Result")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Age: $age", style: TextStyle(fontSize: 22)),
            Text("Gender: $gender", style: TextStyle(fontSize: 22)),
            Text("Result: $result", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
