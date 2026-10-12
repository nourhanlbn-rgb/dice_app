import 'dart:math';

import 'package:flutter/material.dart';

import 'dice.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Play Dice",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.lightBlueAccent,
          brightness: Brightness.dark,
        ),
      ),
      home: DiceScreen(),
    );
  }
}

class DiceScreen extends StatefulWidget {
  const DiceScreen({super.key});

  @override
  State<DiceScreen> createState() => DiceScreenState();
}

class DiceScreenState extends State<DiceScreen> {
  int dice_1 = 1;
  int dice_2 = 1;
  int total = 2;
  String imagePath = r'assets/sad.jpg';
  String resultText = 'You Lose';
  void reset() {
    setState(() {
      dice_1 = 1;
      dice_2 = 1;
      total = 2;
      imagePath = r'assets/sad.jpg';
      resultText = 'You Lose';
    });
  }

  void roll() {
    setState(() {
      dice_1 = Random().nextInt(6) + 1;
      dice_2 = Random().nextInt(6) + 1;
      total = dice_1 + dice_2;
      if (total >= 10) {
        imagePath = r'assets/happy.jpg';
        resultText = 'You Win';
      } else {
        imagePath = r'assets/sad.jpg';
        resultText = 'You Lose';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.casino),
        centerTitle: true,
        title: Text('Play Dice'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("total is $total", style: TextStyle(fontSize: 26)),
            SizedBox(height: 10),
            Image.asset(imagePath, height: 200),
            SizedBox(height: 10),
            Text(resultText, style: TextStyle(fontSize: 22)),
            SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Dice(value: dice_1),
                Dice(value: dice_2),
              ],
            ),
            SizedBox(height: 145),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: roll,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),
                    child: Text("roll"),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    onPressed: reset,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),
                    child: Text("reset"),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
