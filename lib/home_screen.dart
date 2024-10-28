
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:calculator_ui/buttom.dart';
import 'package:calculator_ui/buttom2.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String expression = '';
  String result = '0';

  void buttonPressed(String buttonText) {
    setState(() {
      if (buttonText == 'C') {
        expression = '';
        result = '0';
      } else if (buttonText == '=') {
        try {
          result = _evaluateExpression(expression);
        } catch (e) {
          
        }
      } else {
        expression += buttonText;
      }
    });
  }

String _evaluateExpression(String expression) {
  try {
    final tokens = expression.split(RegExp(r'(\D)')).where((token) => token.isNotEmpty).toList();
    double num1 = double.parse(tokens[0]);
    String operator = tokens[1];
    double num2 = double.parse(tokens[2]);
    double eval;
    switch (operator) {
      case '+':
        eval = num1 + num2;
        break;
      case '-':
        eval = num1 - num2;
        break;
      case '*':
        eval = num1 * num2;
        break;
      case '/':
        eval = num1 / num2;
        break;
      default:
        throw Exception('Invalid operator');
    }
    return eval.toString();
  } catch (e) {
    return 'Error';
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 60, horizontal: 10),
        child: Column(
          children: [
            Column(
              children: [
                Container(
                  alignment: Alignment.centerRight,
                  child: Text(
                    expression,
                    style: TextStyle(color: Color(0xff4e505f), fontSize: 30),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  alignment: Alignment.centerRight,
                  child: Text(
                    result,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 70,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Column(
                children: [
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        buttom_widget(text: 'C', onTap: () => buttonPressed('C')),
                        SizedBox(width: 20),
                        buttom_widget(text: '+/-', onTap: () => buttonPressed('+/-')),
                        SizedBox(width: 20),
                        buttom_widget(text: '%', onTap: () => buttonPressed('%')),
                        SizedBox(width: 20),
                        buttom2_widget(text: '/', onTap: () => buttonPressed('/')),
                        SizedBox(width: 20),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        buttom_widget(text: '7', onTap: () => buttonPressed('7')),
                        SizedBox(width: 20),
                        buttom_widget(text: '8', onTap: () => buttonPressed('8')),
                        SizedBox(width: 20),
                        buttom_widget(text: '9', onTap: () => buttonPressed('9')),
                        SizedBox(width: 20),
                        buttom2_widget(text: '*', onTap: () => buttonPressed('*')),
                        SizedBox(width: 20),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        buttom_widget(text: '4', onTap: () => buttonPressed('4')),
                        SizedBox(width: 20),
                        buttom_widget(text: '5', onTap: () => buttonPressed('5')),
                        SizedBox(width: 20),
                        buttom_widget(text: '6', onTap: () => buttonPressed('6')),
                        SizedBox(width: 20),
                        buttom2_widget(text: '-', onTap: () => buttonPressed('-')),
                        SizedBox(width: 20),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        buttom_widget(text: '1', onTap: () => buttonPressed('1')),
                        SizedBox(width: 20),
                        buttom_widget(text: '2', onTap: () => buttonPressed('2')),
                        SizedBox(width: 20),
                        buttom_widget(text: '3', onTap: () => buttonPressed('3')),
                        SizedBox(width: 20),
                        buttom2_widget(text: '+', onTap: () => buttonPressed('+')),
                        SizedBox(width: 20),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        buttom_widget(text: '.', onTap: () => buttonPressed('.')),
                        SizedBox(width: 20),
                        buttom_widget(text: '0', onTap: () => buttonPressed('0')),
                        SizedBox(width: 20),
                        FloatingActionButton(
                          backgroundColor: Color(0xff4b5efc),
                          onPressed: () => buttonPressed('C'),
                          child: Icon(
                            Icons.cancel_presentation_sharp,
                            color: Color(0xffffffff),
                          ),
                        ),
                        SizedBox(width: 20),
                        buttom2_widget(text: '=', onTap: () => buttonPressed('=')),
                        SizedBox(width: 20),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
