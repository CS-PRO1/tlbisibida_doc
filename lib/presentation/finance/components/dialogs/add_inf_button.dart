import 'package:flutter/material.dart';
import 'package:tlbisibida_doc/constants/constants.dart';
import 'package:tlbisibida_doc/presentation/finance/components/dialogs/add_inf_dialog.dart';

Widget addInFButton(BuildContext context) {
  return InkWell(
    onTap: () {
      showDialog(
        context: context,
        builder: (context) {
          return addInFDialog(context);
        },
      );
    },
    child: Container(
      width: double.infinity,
      clipBehavior: Clip.antiAlias,
      height: 50,
      decoration: const BoxDecoration(
        color: cyan300,
      ),
      child: const Icon(
        Icons.add,
        color: white,
      ),
    ),
  );
}
