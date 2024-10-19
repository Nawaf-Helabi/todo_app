// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class Todocard extends StatelessWidget {
  final String vartitle;
  final bool donORnot;
  final Function myfun;
  final int iii;
  final Function delete;

  // ignore: use_key_in_widget_constructors
  Todocard({
    required this.vartitle,
    required this.donORnot,
    required this.myfun,
    required this.iii,
    required this.delete,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        myfun(iii);
      },
      child: FractionallySizedBox(
        widthFactor: 0.9,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(11),
              color: Color.fromRGBO(209, 224, 224, 0.2)),
          margin: EdgeInsets.only(top: 22),
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(
              vartitle,
              style: TextStyle(
                  color: donORnot ? Colors.green[300] : Colors.white,
                  fontSize: 22,
                  decoration: donORnot
                      ? TextDecoration.lineThrough
                      : TextDecoration.none),
            ),
            Row(
              children: [
                Icon(donORnot ? Icons.check : Icons.close,
                    size: 27, color: donORnot ? Colors.green : Colors.red),
                SizedBox(
                  width: 8,
                ),
                IconButton(
                    onPressed: () {
                      delete(iii);
                    },
                    icon: Icon(
                      Icons.delete,
                      size: 27,
                      color: const Color.fromARGB(255, 238, 147, 141),
                    ))
              ],
            )
          ]),
        ),
      ),
    );
  }
}
