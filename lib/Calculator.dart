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
    print("before output - $output");
    print("before foperand - $firstOperand");
    print("before soperand - $secondOperand");
    if (output != null && output.length > 0) {
      output = output.substring(0, output.length - 1);
      firstOperand = output;
    }
    setState(() {});
    print("after output - $output");
    print("after foperand - $firstOperand");
    print("after soperand - $secondOperand");
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
                    NumericKey(7,
                        concatenateDigitToExpression: getValueOfPressedKey),
                    NumericKey(8,
                        concatenateDigitToExpression: getValueOfPressedKey),
                    NumericKey(9,
                        concatenateDigitToExpression: getValueOfPressedKey),
                    CalculationKey("*",
                        performOperationOnExpression: getOperator),
                  ],
                ),
                Row(
                  children: [
                    NumericKey(4,
                        concatenateDigitToExpression: getValueOfPressedKey),
                    NumericKey(5,
                        concatenateDigitToExpression: getValueOfPressedKey),
                    NumericKey(6,
                        concatenateDigitToExpression: getValueOfPressedKey),
                    CalculationKey("-",
                        performOperationOnExpression: getOperator),
                  ],
                ),
                Row(
                  children: [
                    NumericKey(1,
                        concatenateDigitToExpression: getValueOfPressedKey),
                    NumericKey(2,
                        concatenateDigitToExpression: getValueOfPressedKey),
                    NumericKey(3,
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
                      0,
                      flex: 2,
                      concatenateDigitToExpression: getValueOfPressedKey,
                    ),
                    CalculationKey("."),
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
