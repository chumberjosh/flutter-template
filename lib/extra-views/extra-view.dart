import 'package:flutter/material.dart';

class ExtraView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
          child: Center(
        child: Text('Extra view'),
      )),
    );
  }
}
