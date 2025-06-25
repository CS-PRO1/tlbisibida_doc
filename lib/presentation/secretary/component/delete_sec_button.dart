import 'package:flutter/material.dart';
import 'package:tlbisibida_doc/constants/constants.dart';
import 'package:tlbisibida_doc/presentation/secretary/dialogs/sec_delete_confirmation_dialog.dart';

Widget deleteSecButton(BuildContext context) {
  return InkWell(
    onTap: () {
      showDialog(
        context: context,
        builder: (context) {
          return secDeleteConfirmationDialog(context);
        },
      );
    },
    child: Container(
      width: double.infinity,
      clipBehavior: Clip.antiAlias,
      height: 30,
      decoration: const BoxDecoration(
        color: redmid,
      ),
      child: const Icon(
        Icons.delete_outline_rounded,
        color: white,
      ),
    ),
  );
}
