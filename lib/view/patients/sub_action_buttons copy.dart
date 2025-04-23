import 'package:flutter/material.dart';
import 'package:tlbisibida_doc/constants/constants.dart';

Widget subcatActionButton(BuildContext context, String t) {
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
        height: 30,
        decoration: const BoxDecoration(
          color: cyan100,
        ),
        child: Center(
          child: Text(
            t,
            style: TextStyle(color: cyan500, fontSize: 16),
            textAlign: TextAlign.center,
          ),
        )),
  );
}
