import 'package:calculator/calculation_key.dart';
import 'package:calculator/numeric_key.dart';
import 'package:calculator/special_keys.dart';
import 'package:flutter/material.dart';
import 'package:function_tree/function_tree.dart';

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String output = "0";
  String firstOperand, secondOperand, operator;
  var expressionResult;

  void getValueOfPressedKey(String passedValue) {
    if (output == "0") {
      firstOperand = passedValue;
      output = firstOperand;
    } else if (operator != null) {
      if (secondOperand == null) {
        secondOperand = passedValue;
        output = "$firstOperand$operator$secondOperand";
      } else {
        secondOperand = secondOperand + passedValue;
        output = "$firstOperand$operator$secondOperand";
      }
    } else {
      firstOperand = firstOperand + passedValue;
      output = firstOperand;
    }
    setState(() {});
  }

  void getOperator(String passedValue) {
    if (firstOperand == null) {
      return;
    } else if (operator == null) {
      operator = passedValue;
      output = "$firstOperand$operator";
    } else if (secondOperand == null) {
      return;
    }
    setState(() {});
  }

  void calculation(String _) {
    output = output.interpret().toString();
    expressionResult = output.split('.');
    int index = expressionResult.length - 1;
    if (int.parse(expressionResult[index]) > 0) {
      output = output;
    } else {
      output = expressionResult[0];
    }
    firstOperand = output;

    secondOperand = null;
    operator = null;
    setState(() {});
  }

  void resetValue(String _) {
    output = "0";
    setState(() {});
  }

  void removeLastCharacter() {
    if (output != null && output.length > 0) {
      output = output.substring(0, output.length - 1);
      firstOperand = output;
      if (firstOperand.endsWith(operator)) {
        secondOperand = null;
        firstOperand = firstOperand.substring(0, firstOperand.length - 1);
      }
    }
    setState(() {});
  }

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
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Align(
              alignment: Alignment.bottomRight,
              child: Text(
                "$output",
                style: TextStyle(
                  fontSize: 35,
                ),
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
                      performOperationOnExpression: resetValue,
                    ),
                    SpecialKeys(
                      Icon(
                        Icons.backspace,
                        color: Colors.white,
                      ),
                      performSpecificOperation: removeLastCharacter,
                    ),
                    CalculationKey("%",
                        performOperationOnExpression: getOperator),
                    CalculationKey("/",
                        performOperationOnExpression: getOperator),
                  ],
                ),
                Row(
                  children: [
                    NumericKey(
                        digit: 7,
                        concatenateDigitToExpression: getValueOfPressedKey),
                    NumericKey(
                        digit: 8,
                        concatenateDigitToExpression: getValueOfPressedKey),
                    NumericKey(
                        digit: 9,
                        concatenateDigitToExpression: getValueOfPressedKey),
                    CalculationKey("*",
                        performOperationOnExpression: getOperator),
                  ],
                ),
                Row(
                  children: [
                    NumericKey(
                        digit: 4,
                        concatenateDigitToExpression: getValueOfPressedKey),
                    NumericKey(
                        digit: 5,
                        concatenateDigitToExpression: getValueOfPressedKey),
                    NumericKey(
                        digit: 6,
                        concatenateDigitToExpression: getValueOfPressedKey),
                    CalculationKey("-",
                        performOperationOnExpression: getOperator),
                  ],
                ),
                Row(
                  children: [
                    NumericKey(
                        digit: 1,
                        concatenateDigitToExpression: getValueOfPressedKey),
                    NumericKey(
                        digit: 2,
                        concatenateDigitToExpression: getValueOfPressedKey),
                    NumericKey(
                        digit: 3,
                        concatenateDigitToExpression: getValueOfPressedKey),
                    CalculationKey(
                      "+",
                      performOperationOnExpression: getOperator,
                    ),
                  ],
                ),
                Row(
                  children: [
                    NumericKey(
                      digit: 0,
                      flex: 2,
                      concatenateDigitToExpression: getValueOfPressedKey,
                    ),
                    NumericKey(
                      dotSymbol: ".",
                      concatenateDigitToExpression: getValueOfPressedKey,
                    ),
                    CalculationKey("=",
                        keyColor: Colors.orange[800],
                        performOperationOnExpression: calculation),
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
