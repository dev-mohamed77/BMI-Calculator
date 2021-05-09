import 'package:flutter/material.dart';
import 'constans.dart';

class ResultScreen extends StatelessWidget {
  final int result;
  final bool isMale;
  final int age;

  const ResultScreen({
    @required this.result,
    @required this.isMale,
    @required this.age,
  });

  String get _text {
    String resultname;

    if (result > 17 && result <= 25) {
      resultname = "Good Job!";
    } else {
      resultname = "Sad Job!";
    }
    return resultname;
  }

  String get _resultText {
    String resultText;
    if (result < 17) resultText = "Under Weight";
    if (result > 17 && result <= 25) resultText = "Normal";
    if (result > 25 && result <= 30) resultText = "Over Normal";
    if (result > 30 && result <= 50) resultText = "Obesity";
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "RESULT",
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.all(15),
            alignment: Alignment.topLeft,
            child: Text(
              "YOUR RESULT",
              textAlign: TextAlign.start,
              style: Theme.of(context).textTheme.title.copyWith(
                    fontSize: 30,
                  ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            width: double.infinity,
            height: 500,
            margin: EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: kRectangleMaleAndFemaleColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  _resultText,
                  style: Theme.of(context).textTheme.title.copyWith(
                        color: kResultColor,
                      ),
                ),
                Text(
                  "$result",
                  style: Theme.of(context).textTheme.body1.copyWith(
                        fontSize: 100,
                      ),
                ),
                Container(
                  width: 300,
                  child: Text(
                    "You Have a Normal body weight. $_text",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.body1,
                    maxLines: 2,
                  ),
                ),
                Text(
                  "Gender : ${isMale ? "Male" : "Female"}",
                  style: Theme.of(context).textTheme.body1,
                ),
                Text(
                  "Age : $age",
                  style: Theme.of(context).textTheme.body1,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 40,
          ),
          SizedBox(
            width: double.infinity,
            height: 65,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                "RE-Claculator Your BMI",
                style: Theme.of(context).textTheme.title,
              ),
              style: ElevatedButton.styleFrom(
                primary: kButtonColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
