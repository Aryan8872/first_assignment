import 'package:flutter/material.dart';

class ArithmeticView extends StatefulWidget {
  const ArithmeticView({super.key});

  @override
  State<ArithmeticView> createState() => _FirstViewState();
}

class _FirstViewState extends State<ArithmeticView> {
  int first=0; 
  int second=0;
  int result=0;

  final firstController = TextEditingController(text:'2');
  final secondController = TextEditingController(text:"3");
  final myKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My First App'),
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
                onChanged: (value) {
                  first = int.tryParse(value) ?? 0;
                },
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Enter first number',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter first no';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 10,),
              TextFormField(onChanged: (value){
                second = int.tryParse(value)??0;
              },
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "enter second number",
                border: OutlineInputBorder(),
              ),
              validator: (value){
                if(value==null || value.isEmpty){
                  return "please enter second number";
                }
                return null;
              },
              ),
              const SizedBox(height: 10,),

              Text(
                'Result: $result',
                style: const TextStyle(fontSize: 30),
              ),

              const SizedBox(height: 10,),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Page lai refresh garako
                    if (myKey.currentState!.validate()) {
                      setState(() {
                        result = first + second;
                      });
                    }
                  },
                  child: const Text('Addition'),
                ),
              ),
              const SizedBox(height: 10),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (myKey.currentState!.validate()) {
                      setState(() {
                        result = int.parse(firstController.text)- int.parse(secondController.text);
                      });
                    }
                  },
                  child: const Text('Subtraction'),
                ),
              )
            ],
          ),
        ),
      ),

              
        
       
        
    
    );
  }
}
