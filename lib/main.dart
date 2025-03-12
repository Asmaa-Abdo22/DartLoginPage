import 'package:flutter/material.dart';
import 'chat_page.dart'; // استيراد صفحة المحادثات

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ChatPage(),     
    );
  }
}
