import 'package:flutter/material.dart';
import 'bmi_result.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isMale = true;
  double height = 180;
  int weight = 60;
  int age = 28;

  double calculateBMI() {
    return weight / ((height / 100) * (height / 100));
  }

  void navigateToResult() {
    double result = calculateBMI();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ResultPage(
          age: age,
          gender: isMale ? "Male" : "Female",
          result: result.toStringAsFixed(1),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0A0E21),
      appBar: AppBar(
        title: Text("BMI CALCULATOR"),
        backgroundColor: Color(0xFF0A0E21),
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () => setState(() => isMale = true),
                    child: Container(
                      decoration: BoxDecoration(
                        color: isMale ? Color(0xFF1D1E33) : Color(0xFF111328),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      margin: EdgeInsets.all(10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.male, size: 80, color: Colors.white),
                          Text("MALE", style: TextStyle(color: Colors.white)),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () => setState(() => isMale = false),
                    child: Container(
                      decoration: BoxDecoration(
                        color: isMale ? Color(0xFF111328) : Color(0xFF1D1E33),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      margin: EdgeInsets.all(10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.female, size: 80, color: Colors.white),
                          Text("FEMALE", style: TextStyle(color: Colors.white)),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xFF1D1E33),
                borderRadius: BorderRadius.circular(10),
              ),
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("HEIGHT", style: TextStyle(color: Colors.white)),
                  Text("${height.round()} cm", style: TextStyle(color: Colors.white, fontSize: 24)),
                  Slider(
                    value: height,
                    min: 100,
                    max: 220,
                    activeColor: Colors.pink,
                    inactiveColor: Colors.grey,
                    onChanged: (value) => setState(() => height = value),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: _buildCounterCard("WEIGHT", weight, () => setState(() => weight--), () => setState(() => weight++)),
                ),
                Expanded(
                  child: _buildCounterCard("AGE", age, () => setState(() => age--), () => setState(() => age++)),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: navigateToResult,
            child: Container(
              color: Color(0xFFEB1555),
              width: double.infinity,
              height: 80,
              child: Center(
                child: Text("CALCULATE", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCounterCard(String label, int value, VoidCallback decrement, VoidCallback increment) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFF1D1E33),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(label, style: TextStyle(color: Colors.white)),
          Text("$value", style: TextStyle(color: Colors.white, fontSize: 24)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FloatingActionButton(
                heroTag: "$label-",
                onPressed: decrement,
                child: Icon(Icons.remove, color: Colors.white),
                backgroundColor: Color(0xFF4C4F5E),
                mini: true,
              ),
              SizedBox(width: 10),
              FloatingActionButton(
                heroTag: "$label+",
                onPressed: increment,
                child: Icon(Icons.add, color: Colors.white),
                backgroundColor: Color(0xFF4C4F5E),
                mini: true,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
