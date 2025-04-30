import 'package:flutter/material.dart';
import 'package:tlbisibida_doc/constants/constants.dart';
import 'package:tlbisibida_doc/services/navigation/locator.dart';
import 'package:tlbisibida_doc/services/navigation/navigation_service.dart';
import 'package:tlbisibida_doc/services/navigation/routes.dart';
import 'package:tlbisibida_doc/view/inventory/dialogs/edit_cat_dialog%20%20copy.dart';

Widget patientInfoButton(BuildContext context) {
  return InkWell(
    onTap: () {
      // showDialog(
      //   context: context,
      //   builder: (context) {
      //     return editCatDialog(context);
      //   },
      // );

      locator<NavigationService>().navigateTo(patientInfoRoute);
    },
    child: Container(
      width: double.infinity,
      clipBehavior: Clip.antiAlias,
      height: 30,
      decoration: const BoxDecoration(
        color: cyan300,
      ),
      child: const Icon(
        Icons.perm_contact_cal_rounded,
        color: white,
      ),
    ),
  );
}
