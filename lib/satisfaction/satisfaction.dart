import 'package:flutter/material.dart';

class SatisfactionScreen extends StatelessWidget {
  const SatisfactionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Survey"),
      ),
      body: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text("How satisfied are you with our services?"),
            SizedBox(
              height: 25,
            ),
            SatisfactionSlider(),
          ],
        ),
      ),
    );
  }
}

class SatisfactionSlider extends StatefulWidget {
  const SatisfactionSlider({super.key});

  @override
  State<SatisfactionSlider> createState() => _SatisfactionSliderState();
}

class _SatisfactionSliderState extends State<SatisfactionSlider> {
  double _happyValue = 3;

  String _happinessText(double sliderValue) {
    return switch (sliderValue) {
      1 => "Very poor",
      2 => "Poor",
      3 => "Average",
      4 => "Good",
      5 => "Very good",
      _ => "I don't know",
    };
  }

  @override
  Widget build(BuildContext context) {
    return Slider(
      value: _happyValue,
      max: 5,
      min: 1,
      divisions: 4,
      label: "Good", // _happinessText(_happyValue),
      onChanged: (value) {
        setState(() {
          _happyValue = value;
        });
      },
    );
  }
}
