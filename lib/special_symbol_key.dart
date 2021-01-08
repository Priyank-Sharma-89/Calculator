import 'package:flutter/material.dart';

class SpecialSymbolKey extends StatelessWidget {
  final int flex;
  final Icon icon;
  final Function performSpecificOperation;

  SpecialSymbolKey(this.icon, {this.flex, this.performSpecificOperation});
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
            performSpecificOperation();
          },
          child: icon,
          color: Theme.of(context).primaryColor,
        ),
      ),
    );
    ;
  }
}
