import 'dart:math';

import 'package:bmicalculator/constans.dart';
import 'package:flutter/material.dart';

import 'drawer.dart';
import 'result_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData(
        primaryColor: kPrimaryColor,
        accentColor: kRectanglesColor,
        focusColor: kRectangleMaleAndFemaleColor,
        canvasColor: kPrimaryColor,
        iconTheme: IconThemeData(
          color: kSelectedColor,
          size: 70,
        ),
        textTheme: TextTheme(
          body1: TextStyle(
            color: kSelectedColor,
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
          title: TextStyle(
            color: kSelectedColor,
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
      ),
      theme: ThemeData(
        primaryColor: kSelectedColor,
        canvasColor: kSelectedColor,
        iconTheme: IconThemeData(
          color: kTextBlack,
          size: 70,
        ),
        accentColor: kLightRectangleColor,
        focusColor: kBlueColor,
        textTheme: TextTheme(
          body1: TextStyle(
            color: kSelectedColor,
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
          title: TextStyle(
            color: kTextBlack,
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _heightcount = 0;
  int _weightCount = 0;
  int _ageCount = 0;
  bool _isMale = true;
  _result() {
    double _result = _weightCount / pow(_heightcount / 100, 2);
    print(_result);

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ResultScreen(
          result: _result.round(),
          age: _ageCount,
          isMale: _isMale,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        title: Text(
          "BMI CALCULATOR",
        ),
        centerTitle: true,
        elevation: 4,
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(13),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _isMale = true;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: _isMale
                              ? Theme.of(context).focusColor
                              : Theme.of(context).accentColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.ac_unit,
                              color: Theme.of(context).iconTheme.color,
                              size: Theme.of(context).iconTheme.size,
                            ),
                            Text(
                              "Male",
                              style: Theme.of(context).textTheme.title,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _isMale = false;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: !_isMale
                              ? Theme.of(context).focusColor
                              : Theme.of(context).accentColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.ac_unit,
                              color: Theme.of(context).iconTheme.color,
                              size: Theme.of(context).iconTheme.size,
                            ),
                            Text(
                              "Female",
                              style: Theme.of(context).textTheme.title,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(13),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Theme.of(context).accentColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "Height",
                      style: Theme.of(context).textTheme.title,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "$_heightcount",
                          style: Theme.of(context).textTheme.title.copyWith(
                                fontSize: 65,
                              ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "cm",
                          style: Theme.of(context).textTheme.title,
                        ),
                      ],
                    ),
                    Slider(
                      value: _heightcount.toDouble(),
                      max: 250,
                      min: 0,
                      onChanged: (val) {
                        setState(() {
                          _heightcount = val.round();
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(13),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Theme.of(context).accentColor,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Wieght",
                            style: Theme.of(context).textTheme.title,
                          ),
                          Text(
                            "$_weightCount",
                            style: Theme.of(context).textTheme.title.copyWith(
                                  fontSize: 50,
                                ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              buildFloatingActionButton(
                                Icons.remove,
                                () {
                                  setState(() {
                                    if (_weightCount > 0) {
                                      _weightCount--;
                                    }
                                  });
                                },
                                "weight--",
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              buildFloatingActionButton(Icons.add, () {
                                setState(() {
                                  _weightCount++;
                                });
                              }, "weight++"),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).accentColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Age",
                            style: Theme.of(context).textTheme.title,
                          ),
                          Text(
                            "$_ageCount",
                            style: Theme.of(context).textTheme.title.copyWith(
                                  fontSize: 50,
                                ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              buildFloatingActionButton(Icons.remove, () {
                                setState(() {
                                  if (_ageCount > 0) {
                                    _ageCount--;
                                  }
                                });
                              }, "age--"),
                              SizedBox(
                                width: 10,
                              ),
                              buildFloatingActionButton(
                                Icons.add,
                                () {
                                  setState(() {
                                    _ageCount++;
                                  });
                                },
                                "age++",
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          SizedBox(
            width: double.infinity,
            height: 65,
            child: ElevatedButton(
              onPressed: _result,
              child: Text(
                "Claculator Your BMI",
                style: Theme.of(context).textTheme.title.copyWith(
                      color: Colors.white,
                    ),
              ),
              style: ElevatedButton.styleFrom(
                primary: kButtonColor,
              ),
            ),
          )
        ],
      ),
    );
  }

  FloatingActionButton buildFloatingActionButton(
    IconData icon,
    Function onpressed,
    String tag,
  ) {
    return FloatingActionButton(
      heroTag: tag,
      onPressed: onpressed,
      child: Icon(
        icon,
        size: 30,
        color: Theme.of(context).iconTheme.color,
      ),
      backgroundColor: Theme.of(context).focusColor,
    );
  }
}
