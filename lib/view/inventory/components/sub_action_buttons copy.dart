import 'package:flutter/material.dart';
import 'package:tlbisibida_doc/constants/constants.dart';

Widget subcatActionButton(
  BuildContext context, {
  required String text,
  required VoidCallback function,
}) {
  return InkWell(
    onTap: function,
    child: SizedBox(
        width: 100,
        height: 30,
        child: Center(
          child: Text(
            text,
            style: TextStyle(color: cyan500, fontSize: 16),
            textAlign: TextAlign.center,
          ),
        )),
  );
}
