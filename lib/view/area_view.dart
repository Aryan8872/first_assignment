import 'package:flutter/material.dart';
import 'dart:math'; // For using the value of π.

class CircleAreaView extends StatefulWidget {
  const CircleAreaView({super.key});

  @override
  State<CircleAreaView> createState() => _CircleAreaViewState();
}

class _CircleAreaViewState extends State<CircleAreaView> {
  double radius = 0.0; // Variable to store the radius.
  double area = 0.0; // Variable to store the calculated area.

  final radiusController = TextEditingController(); // Controller for the radius input.
  final myKey = GlobalKey<FormState>(); // Key for form validation.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Circle Area Calculator'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Form(
          key: myKey,
          child: Column(
            children: [
              // Input field for the radius.
              TextFormField(
                controller: radiusController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Enter the radius',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  radius = double.tryParse(value) ?? 0.0;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the radius';
                  }
                  if (double.tryParse(value) == null) {
                    return 'Please enter a valid number';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 20),

              // Display the calculated area.
              Text(
                'Area: ${area.toStringAsFixed(2)}',
                style: const TextStyle(fontSize: 30),
              ),

              const SizedBox(height: 20),

              // Button to calculate the area.
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (myKey.currentState!.validate()) {
                      setState(() {
                        // Calculate the area using the formula π * radius^2.
                        area = pi * pow(radius, 2);
                      });
                    }
                  },
                  child: const Text('Calculate Area'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
