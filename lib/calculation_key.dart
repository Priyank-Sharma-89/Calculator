import 'package:flutter/material.dart';

class CalculationKey extends StatelessWidget {
  final Color keyColor;
  final String symbol;
  final int flex;
  final Function performOperationOnExpression;
  CalculationKey(this.symbol,
      {this.flex, this.performOperationOnExpression, this.keyColor});
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
            performOperationOnExpression(symbol);
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
