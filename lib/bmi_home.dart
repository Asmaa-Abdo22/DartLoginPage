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
      appBar: AppBar(
        title: Text("BMI CALCULATOR"),
        backgroundColor: const Color.fromARGB(255, 30, 30, 30),
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
      ),
      body: Column(
        children: [
          SizedBox(height: 20), 
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () => setState(() => isMale = true),
                  child: Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: isMale ? Colors.blue[800] : Colors.grey[600],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        Icon(Icons.male, size: 80, color: Colors.white),
                        Text("MALE", style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: GestureDetector(
                  onTap: () => setState(() => isMale = false),
                  child: Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: isMale ? Colors.grey[600] : Colors.pink[800],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
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
          SizedBox(height: 20),

          Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.grey[800],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                Text("HEIGHT", style: TextStyle(color: Colors.white)),
                Text(
                  "${height.round()} cm",
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
                Slider(
                  value: height,
                  min: 100,
                  max: 220,
                  onChanged: (value) => setState(() => height = value),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),

          Row(
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.grey[800],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      Text("WEIGHT", style: TextStyle(color: Colors.white)),
                      Text(
                        "$weight",
                        style: TextStyle(color: Colors.white, fontSize: 24),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            icon: Icon(Icons.remove, color: Colors.white),
                            onPressed: () => setState(() => weight--),
                          ),
                          IconButton(
                            icon: Icon(Icons.add, color: Colors.white),
                            onPressed: () => setState(() => weight++),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.grey[800],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      Text("AGE", style: TextStyle(color: Colors.white)),
                      Text(
                        "$age",
                        style: TextStyle(color: Colors.white, fontSize: 24),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            icon: Icon(Icons.remove, color: Colors.white),
                            onPressed: () => setState(() => age--),
                          ),
                          IconButton(
                            icon: Icon(Icons.add, color: Colors.white),
                            onPressed: () => setState(() => age++),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),

          ElevatedButton(
            onPressed: navigateToResult,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 10, 183, 15),
              padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
            ),
            child: Text(
              "CALCULATE",
              style: TextStyle(color: const Color.fromARGB(255, 255, 255, 255), fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}