import 'package:flutter/material.dart';
import 'package:tlbisibida_doc/constants/constants.dart';
import 'package:tlbisibida_doc/view/inventory/dialogs/edit_cat_dialog%20%20copy.dart';

Widget addSubcatButton(BuildContext context) {
  return InkWell(
    onTap: () {
      showDialog(
        context: context,
        builder: (context) {
          return editCatDialog(context);
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
