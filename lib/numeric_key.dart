import 'package:flutter/material.dart';

class NumericKey extends StatelessWidget {
  final int digit;
  final int flex;
  final Function displayNumberOnScreen;

  NumericKey(this.digit, {this.displayNumberOnScreen, this.flex});
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
            displayNumberOnScreen(digit.toString());
          },
          child: Text(
            "$digit",
            style: TextStyle(
              color: Colors.white,
              fontSize: 28,
            ),
          ),
          color: Theme.of(context).accentColor,
        ),
      ),
    );
  }
}
