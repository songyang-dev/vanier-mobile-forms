import 'package:flutter/material.dart';

import '../report/report.dart';
import '../services/contact.dart';

class ContactForm extends StatefulWidget {
  const ContactForm({super.key});

  @override
  State<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final _formKey = GlobalKey<FormState>();

  final name = TextEditingController();
  final email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
        child: Column(
          children: [
            // your TextFormFields
            TextFormField(
              controller: name,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                label: Text("Name"),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter your name";
                }
                return null; // may not be needed
              },
            ),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              controller: email,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                label: Text("Email"),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter your email";
                }
                if (!value.contains('@')) {
                  return "Please enter a valid email address";
                }
                return null; // may not be needed
              },
            ),

            ElevatedButton(
              onPressed: () {
                // Validate returns true if the form is valid, or false otherwise.
                if (_formKey.currentState!.validate()) {
                  // If the form is valid, display a snackbar. In the real world,
                  // you'd often call a server or save the information in a database.
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Welcome')),
                  );

                  // Populate the data model
                  final person = Contact(name: name.text, email: email.text);

                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ReportScreen(person: person),
                    ),
                  );
                }
              },
              child: const Text('Next'),
            ),
          ],
        ),
      ),
    );
  }
}
