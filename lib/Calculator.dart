import 'package:calculator/calculation_key.dart';
import 'package:calculator/numeric_key.dart';
import 'package:calculator/special_symbol_key.dart';
import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String firstOperand = "0";
  String secondOperand = "0";

  void displayKeyValue(String passedValue) {
    if (firstOperand == "0") {
      firstOperand = passedValue;
    } else {
      firstOperand = firstOperand + passedValue;
    }
    setState(() {});
  }

  void resetValue() {
    this.firstOperand = "0";
    setState(() {});
  }

  void removeLastCharacter() {
    if (firstOperand != null && firstOperand.length > 0) {
      firstOperand = firstOperand.substring(0, firstOperand.length - 1);
    }
    setState(() {});
  }

  void performOperation() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Calculator",
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Align(
            alignment: Alignment.bottomRight,
            child: Text(
              "$firstOperand",
              style: TextStyle(
                fontSize: 50,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.grey[800],
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    CalculationKey(
                      "C",
                      resetValue: resetValue,
                    ),
                    SpecialSymbolKey(
                      Icon(
                        Icons.backspace,
                        color: Colors.white,
                      ),
                      performSpecificOperation: removeLastCharacter,
                    ),
                    CalculationKey("%"),
                    CalculationKey("/"),
                  ],
                ),
                Row(
                  children: [
                    NumericKey(7, displayNumberOnScreen: displayKeyValue),
                    NumericKey(8, displayNumberOnScreen: displayKeyValue),
                    NumericKey(9, displayNumberOnScreen: displayKeyValue),
                    CalculationKey("x"),
                  ],
                ),
                Row(
                  children: [
                    NumericKey(4, displayNumberOnScreen: displayKeyValue),
                    NumericKey(5, displayNumberOnScreen: displayKeyValue),
                    NumericKey(6, displayNumberOnScreen: displayKeyValue),
                    CalculationKey("-"),
                  ],
                ),
                Row(
                  children: [
                    NumericKey(1, displayNumberOnScreen: displayKeyValue),
                    NumericKey(2, displayNumberOnScreen: displayKeyValue),
                    NumericKey(3, displayNumberOnScreen: displayKeyValue),
                    CalculationKey("+"),
                  ],
                ),
                Row(
                  children: [
                    NumericKey(
                      0,
                      flex: 2,
                      displayNumberOnScreen: displayKeyValue,
                    ),
                    CalculationKey("."),
                    CalculationKey(
                      "=",
                      keyColor: Colors.orange[800],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
