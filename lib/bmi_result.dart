import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final int age;
  final String gender;
  final String result;

  ResultPage({required this.age, required this.gender, required this.result});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI Result"),
        backgroundColor: Color(0xFF8A2BE2),
      ),
      backgroundColor: Color(0xFF1D1E33),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Age: $age",
                style: TextStyle(color: Colors.white, fontSize: 24)),
            SizedBox(height: 10),
            Text("Gender: $gender",
                style: TextStyle(color: Colors.white, fontSize: 24)),
            SizedBox(height: 10),
            Text("Result: $result",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
