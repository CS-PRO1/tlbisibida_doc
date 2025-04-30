import 'package:flutter/material.dart';

import 'package:tlbisibida_doc/constants/constants.dart';
import 'package:tlbisibida_doc/view/inventory/dialogs/item_add_edit_dialog.dart';
import 'package:tlbisibida_doc/view/inventory/dialogs/item_delete_dialog%20copy.dart';
import 'package:tlbisibida_doc/view/inventory/dialogs/patient_delete_dialog%20.dart';
import 'package:tlbisibida_doc/view/patients/components/dialogs/patient_edit_dialog.dart';
import 'package:tlbisibida_doc/view/secretary/dialogs/sec_delete_dialog%20copy.dart';

Row bottomActionButtonsSec(BuildContext context) {
  return Row(
    children: [
      Expanded(
        child: InkWell(
          onTap: () {
            showDialog(
                context: context,
                builder: (context) {
                  return secDeleteConfirmationDialog(context);
                });
          },
          child: Container(
            height: 30,
            decoration: const BoxDecoration(color: redbackground),
            child: const Icon(Icons.delete_outline_rounded, color: redmain),
          ),
        ),
      ),
      Expanded(
        child: InkWell(
          onTap: () {
            // showDialog(
            //   context: context,
            //   builder: (context) {
            //     return PatientEditDialog(context);
            //   },
            // );
          },
          child: Container(
            height: 30,
            decoration: const BoxDecoration(
              color: cyan200,
            ),
            child: const Icon(
              Icons.check_rounded,
              color: cyan400,
            ),
          ),
        ),
      ),
    ],
  );
}
