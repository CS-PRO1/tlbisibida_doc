import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tlbisibida_doc/constants/constants.dart';
import 'package:tlbisibida_doc/presentation/secretary/cubit/secretary_cubit.dart';
import 'package:tlbisibida_doc/presentation/secretary/dialogs/sec_delete_confirmation_dialog.dart';

Row bottomActionButtonsSec(BuildContext context, int id) {
  TextEditingController secretaryEmailController = TextEditingController();
  TextEditingController secretaryNameController = TextEditingController();
  TextEditingController secretaryAddressController = TextEditingController();
  TextEditingController secretaryAttendenceTimeController =
      TextEditingController();
  TextEditingController secretaryPhoneNumberController =
      TextEditingController();
  final cubit = context.read<SecCubit>();

  return Row(
    children: [
      Expanded(
        child: InkWell(
          onTap: () {
            showDialog(
                context: context,
                builder: (context) {
                  return secDeleteConfirmationDialog(context, id);
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
            child: IconButton(
              icon: const Icon(Icons.check_rounded),
              onPressed: () {
                cubit.updatesec(
                    id,
                    secretaryNameController.text,
                    ' ',
                    secretaryPhoneNumberController.text,
                    secretaryEmailController.text,
                    secretaryAttendenceTimeController.text,
                    secretaryAddressController.text);
              },
              color: cyan400,
            ),
          ),
        ),
      ),
    ],
  );
}
