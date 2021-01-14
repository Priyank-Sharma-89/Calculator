import 'package:flutter/material.dart';

class NumericKey extends StatelessWidget {
  final int digit;
  final int flex;
  final Function concatenateDigitToExpression;

  NumericKey(this.digit, {this.concatenateDigitToExpression, this.flex});
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
            concatenateDigitToExpression(digit.toString());
          },
          child: Text(
            "$digit",
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
          color: Theme.of(context).accentColor,
        ),
      ),
    );
  }
}
