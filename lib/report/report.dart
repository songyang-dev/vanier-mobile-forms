import 'package:flutter/material.dart';

import '../satisfaction/satisfaction.dart';
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hi ${person.name}, ",
              style: Theme.of(context).textTheme.displaySmall,
            ),
            const Divider(),
            ReportForm(person: person),
          ],
        ),
      ),
    );
  }
}

class ReportForm extends StatefulWidget {
  const ReportForm({super.key, required this.person});
  final Contact person;

  @override
  State<ReportForm> createState() => _ReportFormState();
}

class _ReportFormState extends State<ReportForm> {
  bool isEmployee = false;
  String? selectedDepartment;
  bool wantEmails = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Are you an existing client?"),
        ListTile(
          leading: Checkbox(
            value: isEmployee,
            onChanged: (value) => setState(() {
              isEmployee = value!;
            }),
          ),
          title: const Text("Yes, I am an existing client of TradeCo."),
        ),
        const SizedBox(
          height: 10,
        ),
        const Text(
          "Which department store are you looking for?",
        ),
        DropdownMenu(
          dropdownMenuEntries: const [
            DropdownMenuEntry(value: "Furniture", label: "Furniture"),
            DropdownMenuEntry(value: "Food", label: "Food"),
          ],
          onSelected: (value) => setState(() {
            selectedDepartment = value;
          }),
        ),
        Row(
          children: [
            Switch(
              // This bool value toggles the switch.
              value: wantEmails,
              onChanged: (bool value) {
                // This is called when the user toggles the switch.
                setState(() {
                  wantEmails = value;
                });
              },
            ),
            const Text("Receive news by email?"),
          ],
        ),
        ElevatedButton(
            onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const SatisfactionScreen(),
                )),
            child: const Text("Submit"))
      ],
    );
  }
}
