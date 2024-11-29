import 'package:flutter/material.dart';
import 'dart:math';

import 'package:flutter/widgets.dart';

class CircleAreaView extends StatefulWidget {
  const CircleAreaView({super.key});

  @override
  State<CircleAreaView> createState() => _CircleAreaViewState();
}

class _CircleAreaViewState extends State<CircleAreaView> {
  double radius = 0.0;
  double area = 0.0; 
  final radiusController = TextEditingController(); 
  final myKey = GlobalKey<FormState>(); 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Circle Area'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Form(
          key: myKey,
          child: Column(
            children: [
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

              Text(
                'Area: ${area.toStringAsFixed(2)}',
                style: const TextStyle(fontSize: 30,color: Colors.teal),
              ),

              const SizedBox(height: 20),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (myKey.currentState!.validate()) {
                      setState(() {
                        
                        area = pi * pow(radius, 2);
                      });
                    }
                  },
                  child: const Text('Calculate Area',style: TextStyle(color: Colors.green),),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
