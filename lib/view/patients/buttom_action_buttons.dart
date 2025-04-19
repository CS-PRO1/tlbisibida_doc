import 'package:flutter/material.dart';
import 'package:tlbisibida_doc/constants/constants.dart';

Widget bottomActionButton(BuildContext context) {
  return InkWell(
    onTap: () {
      // showDialog(
      //   context: context,
      //   builder: (context) {
      //     return itemAddEditDialog(context);
      //   },
      // );
    },
    child: Container(
        width: double.infinity,
        height: 50,
        decoration: const BoxDecoration(
          color: cyan400,
        ),
        child: Center(
          child: Text(
            'معلومات المريض',
            style: TextStyle(color: cyan50, fontSize: 16),
            textAlign: TextAlign.center,
          ),
        )),
  );
}
