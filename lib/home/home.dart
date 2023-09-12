import 'package:flutter/material.dart';

import 'contact_form.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tell us what happened"),
      ),
      body: const ContactForm(),
    );
  }
}
