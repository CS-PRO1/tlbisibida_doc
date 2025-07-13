import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tlbisibida_doc/constants/constants.dart';
import 'package:tlbisibida_doc/services/navigation/routes.dart';

Widget patientInfoButton(BuildContext context, int patientId) {
  return InkWell(
    onTap: () {
      // locator<NavigationService>().navigateTo(patientInfoRoute);
      // Navigator.pushNamed(context, patientInfoRoute);
        context.pushNamed(
        patientInfoRoute, // or use context.go if you use go_router
        extra: patientId,
      );
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
        size: 16,
      ),
    ),
  );
}
