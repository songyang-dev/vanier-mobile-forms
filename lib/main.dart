import 'package:flutter/material.dart';

import 'home/home.dart';

void main() {
  runApp(const FormApp());
}

class FormApp extends StatelessWidget {
  const FormApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Form',
      home: HomeScreen(),
    );
  }
}
