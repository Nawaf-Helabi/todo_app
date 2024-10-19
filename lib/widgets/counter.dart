

import 'package:flutter/material.dart';

class Counter extends StatelessWidget {

  final int lastNum;
  final int firstNum;
  Counter({ required this.firstNum, required this.lastNum});  

  @override
  Widget build(BuildContext context) {
    return Text(
      "$firstNum/$lastNum",
      style: TextStyle(fontSize: 44, color: firstNum==lastNum?Colors.greenAccent:Colors.white),
    );
  }
}