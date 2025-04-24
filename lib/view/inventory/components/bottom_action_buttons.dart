import 'package:flutter/material.dart';

import 'package:tlbisibida_doc/constants/constants.dart';
import 'package:tlbisibida_doc/view/inventory/dialogs/add_cat_dialog%20.dart';
import 'package:tlbisibida_doc/view/inventory/dialogs/edit_cat_dialog%20%20copy.dart';
import 'package:tlbisibida_doc/view/inventory/dialogs/cat_delete_dialog.dart';
import 'package:tlbisibida_doc/view/inventory/dialogs/item_add_edit_dialog.dart';
import 'package:tlbisibida_doc/view/inventory/dialogs/item_delete_dialog%20copy.dart';

Row bottomActionButtons(BuildContext context) {
  return Row(
    children: [
      Expanded(
        child: InkWell(
          onTap: () {
            showDialog(
                context: context,
                builder: (context) {
                  return itemDeleteConfirmationDialog(context);
                });
          },
          child: Container(
            height: 50,
            decoration: const BoxDecoration(color: redbackground),
            child: const Icon(Icons.delete_outline_rounded, color: redmain),
          ),
        ),
      ),
      Expanded(
        child: InkWell(
          onTap: () {
            showDialog(
              context: context,
              builder: (context) {
                return itemAddEditDialog(context, 'تعديل مادة');
              },
            );
          },
          child: Container(
            height: 50,
            decoration: const BoxDecoration(
              color: cyan200,
            ),
            child: const Icon(
              Icons.edit_rounded,
              color: cyan400,
            ),
          ),
        ),
      ),
    ],
  );
}
