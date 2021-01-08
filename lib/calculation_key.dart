import 'package:flutter/material.dart';

class CalculationKey extends StatelessWidget {
  final Color keyColor;
  final String symbol;
  final int flex;
  final Function resetValue;
  final Function operatorCalculation;
  final Function displayOperatorOnScreen;
  CalculationKey(this.symbol,
      {this.flex,
      this.resetValue,
      this.keyColor,
      this.operatorCalculation,
      this.displayOperatorOnScreen});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex ?? 1,
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: FlatButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          height: 100.0,
          onPressed: () {
            resetValue();
          },
          child: Text(
            "$symbol",
            style: TextStyle(
              color: Colors.white,
              fontSize: 28,
            ),
          ),
          color: keyColor ?? Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}
