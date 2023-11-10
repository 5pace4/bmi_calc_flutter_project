import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter-Learning',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Application: BMI calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inController = TextEditingController();
  var result = "";
  var bgColor = Colors.blueGrey.shade300;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(
            'Hello, GoodPeople!',
          ),
        ),
        body: Container(
          color: bgColor,
          child: Center(
            child: Container(
              width: 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'BMI',
                    style: TextStyle(fontSize: 44, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 21,
                  ),
                  TextField(
                    controller: wtController,
                    decoration: InputDecoration(
                        label: Text(
                          'Enter Your Weight',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                          ),
                        ),
                        prefixIcon: Icon(Icons.line_weight)),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(
                    height: 11,
                  ),
                  TextField(
                    controller: ftController,
                    decoration: InputDecoration(
                        label: Text(
                          'Enter Your Height (in Feet)',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                          ),
                        ),
                        prefixIcon: Icon(Icons.height)),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(
                    height: 11,
                  ),
                  TextField(
                    controller: inController,
                    decoration: InputDecoration(
                        label: Text(
                          'Enter Your Height (in Inches)',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                          ),
                        ),
                        prefixIcon: Icon(Icons.height)),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        var wt = wtController.text.toString();
                        var ft = ftController.text.toString();
                        var inch = inController.text.toString();

                        if (wt != "" && ft != "" && inch != "") {
                          //calculated BMI
                          var iwt = int.parse(wt);
                          var ift = int.parse(ft);
                          var inches = int.parse(inch);

                          inches = (ift * 12) + inches;
                          var ht = (inches * 2.54) / 100;
                          var bmi = iwt / (ht * ht);

                          var msg = "";
                          if (bmi > 24) {
                            msg =
                            "You are overweight!! Need to improve your condition.";
                            bgColor = Colors.red.shade300;
                          } else if (bmi < 18) {
                            msg =
                            "You are underweight!! Need to improve your condition.";
                            bgColor = Colors.grey.shade300;
                          } else {
                            msg = "Congrates!, You are physically fit.";
                            bgColor = Colors.green.shade300;
                          }
                          setState(() {
                            result =
                            "$msg \n Your BMI is: ${bmi.toStringAsFixed(2)}";
                          });
                        } else {
                          setState(() {
                            result = "Please fill-up all the required blanks!";
                          });
                        }
                      },
                      child: Text(
                        'Calculate',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      )),
                  SizedBox(
                    height: 11,
                  ),
                  Text(
                    result,
                    style: TextStyle(
                      fontSize: 19,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
