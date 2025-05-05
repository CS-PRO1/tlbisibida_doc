import 'package:flutter/material.dart';
import 'package:tlbisibida_doc/constants/constants.dart';
import 'package:tlbisibida_doc/view/inventory/dialogs/patient_delete_confirmation_dialog.dart';
import 'package:tlbisibida_doc/view/patients/components/dialogs/patient_edit_dialog.dart';

Row bottomActionButtonsPatients(BuildContext context) {
  return Row(
    children: [
      Expanded(
        child: InkWell(
          onTap: () {
            showDialog(
                context: context,
                builder: (context) {
                  return patientDeleteConfirmationDialog(context);
                });
          },
          child: Container(
            height: 30,
            decoration: const BoxDecoration(color: redbackground),
            child: const Icon(
              Icons.delete_outline_rounded,
              color: redmain,
              size: 16,
            ),
          ),
        ),
      ),
      Expanded(
        child: InkWell(
          onTap: () {
            showDialog(
              context: context,
              builder: (context) {
                return patientEditDialog(context);
              },
            );
          },
          child: Container(
            height: 30,
            decoration: const BoxDecoration(
              color: cyan200,
            ),
            child: const Icon(
              size: 16,
              Icons.edit_rounded,
              color: cyan400,
            ),
          ),
        ),
      ),
    ],
  );
}
