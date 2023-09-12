import 'package:flutter/material.dart';

import '../services/contact.dart';

class ReportScreen extends StatelessWidget {
  const ReportScreen({super.key, required this.person});

  final Contact person;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tell us what happened"),
      ),
      body: const ReportForm(),
    );
  }
}

class ReportForm extends StatefulWidget {
  const ReportForm({super.key});

  @override
  State<ReportForm> createState() => _ReportFormState();
}

class _ReportFormState extends State<ReportForm> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
