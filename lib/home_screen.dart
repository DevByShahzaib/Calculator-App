import 'package:calculator_app/components/my_button.dart';
import 'package:calculator_app/constant.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:math_expressions/math_expressions.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var userInput = '';
  var answer = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                children: [
                  Text(
                    userInput.toString(),
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                  Text(
                    answer.toString(),
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    children: [
                      MyButton(
                        title: 'AC',
                        color: Colors.grey,
                        onPress: () {
                          userInput = '';
                          answer = '';
                          setState(() {});
                        },
                      ),
                      MyButton(
                          title: '+/-',
                          color: Colors.grey,
                          onPress: () {
                            userInput += '+';
                            setState(() {});
                          }),
                      MyButton(
                          title: '%',
                          color: Colors.grey,
                          onPress: () {
                            userInput += '%';
                            setState(() {});
                          }),
                      MyButton(
                          title: '/',
                          onPress: () {
                            userInput += '/';
                            setState(() {});
                          }),
                    ],
                  ),
                  Row(
                    children: [
                      MyButton(
                        title: '7',
                        color: Colors.grey,
                        onPress: () {
                          userInput += '7';
                          setState(() {});
                        },
                      ),
                      MyButton(
                          title: '8',
                          color: Colors.grey,
                          onPress: () {
                            userInput += '8';
                            setState(() {});
                          }),
                      MyButton(
                          title: '9',
                          color: Colors.grey,
                          onPress: () {
                            userInput += '9';
                            setState(() {});
                          }),
                      MyButton(
                          title: 'x',
                          onPress: () {
                            userInput += 'x';
                            setState(() {});
                          }),
                    ],
                  ),
                  Row(
                    children: [
                      MyButton(
                        title: '4',
                        color: Colors.grey,
                        onPress: () {
                          userInput += '4';
                          setState(() {});
                        },
                      ),
                      MyButton(
                          title: '5',
                          color: Colors.grey,
                          onPress: () {
                            userInput += '5';
                            setState(() {});
                          }),
                      MyButton(
                          title: '6',
                          color: Colors.grey,
                          onPress: () {
                            userInput += '6';
                            setState(() {});
                          }),
                      MyButton(
                          title: '-',
                          onPress: () {
                            userInput += '-';
                            setState(() {});
                          }),
                    ],
                  ),
                  Row(
                    children: [
                      MyButton(
                        title: '1',
                        color: Colors.grey,
                        onPress: () {
                          userInput += '1';
                          setState(() {});
                        },
                      ),
                      MyButton(
                          title: '2',
                          color: Colors.grey,
                          onPress: () {
                            userInput += '2';
                            setState(() {});
                          }),
                      MyButton(
                          title: '3',
                          color: Colors.grey,
                          onPress: () {
                            userInput += '3';
                            setState(() {});
                          }),
                      MyButton(
                          title: '+',
                          onPress: () {
                            userInput += '+';
                            setState(() {});
                          }),
                    ],
                  ),
                  Row(
                    children: [
                      MyButton(
                        title: '0',
                        color: Colors.grey,
                        onPress: () {
                          userInput += '0';
                          setState(() {});
                        },
                      ),
                      MyButton(
                          title: '.',
                          color: Colors.grey,
                          onPress: () {
                            userInput += '.';
                            setState(() {});
                          }),
                      MyButton(
                          title: 'DEL',
                          color: Colors.grey,
                          onPress: () {
                            userInput =
                                userInput.substring(0, userInput.length - 1);
                            setState(() {});
                          }),
                      MyButton(
                          title: '=',
                          onPress: () {
                            equal();
                            setState(() {});
                          }),
                    ],
                  )
                ],
              ),
            ),
          )

          // MyButton(title: 'Shahzaib', subTitle: 'Khan')// here i am just calling a my own widget
          // Text('Asif taj', style: TextStyle(fontSize: 30, color: GreenColor),),
          // Text('Asif taj', style: TextStyle(fontSize: 30, color: GreenColor),),
          // Text('Asif taj', style: textStyle),
          // Text('Asif taj', style: TextStyle(fontSize: 30, color: GreenColor),),
          // Text('Asif taj', style: TextStyle(fontSize: 30, color: GreenColor),),
          // Text('Asif taj', style: TextStyle(fontSize: 30, color: GreenColor),),
          // MyButton(),
        ],
      )),
    );
  }

  void equal() {
    Parser p = Parser();
    String finalUserInput;
    finalUserInput = userInput.replaceAll('x', '*');
    Expression expression = p.parse(finalUserInput);
    ContextModel contextModel = ContextModel();

    double eval = expression.evaluate(EvaluationType.REAL, contextModel);
    answer = eval.toString();
  }
}
