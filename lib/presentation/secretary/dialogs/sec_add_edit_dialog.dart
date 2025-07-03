import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tlbisibida_doc/components/default_button.dart';
import 'package:tlbisibida_doc/components/default_textfield.dart';
import 'package:tlbisibida_doc/constants/constants.dart';
import 'package:tlbisibida_doc/presentation/secretary/cubit/secretary_cubit.dart';

Dialog secAddEditDialog(BuildContext context, String title) {
  final cubit = context.read<SecCubit>();
  TextEditingController secretaryEmailController = TextEditingController();
  TextEditingController secretaryNameController = TextEditingController();
  TextEditingController secretaryAddressController = TextEditingController();
  TextEditingController secretaryAttendenceTimeController =
      TextEditingController();
  TextEditingController secretaryPhoneNumberController =
      TextEditingController();
  return Dialog(
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(width: 2, color: cyan200),
            borderRadius: BorderRadius.circular(20)),
        width: MediaQuery.of(context).size.width / 3,
        height: MediaQuery.of(context).size.height / 1.5,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    'إضافة سكرتير/ة',
                    style: TextStyle(
                      color: cyan500,
                      fontSize: 20.0,
                      // fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: .5,
                    width: 100,
                    color: cyan400,
                    margin: const EdgeInsets.symmetric(vertical: 5),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 380,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          width: 250,
                          child: defaultTextField(
                              secretaryNameController, context, 'الاسم',
                              style: TextStyle(color: cyan300)),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          width: 250,
                          child: defaultTextField(
                              secretaryAddressController, context, 'العنوان',
                              style: TextStyle(color: cyan300)),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          width: 250,
                          child: defaultTextField(
                              secretaryPhoneNumberController, context, 'الرقم',
                              style: TextStyle(color: cyan300)),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          width: 250,
                          child: defaultTextField(
                              secretaryEmailController, context, 'الايميل',
                              style: TextStyle(color: cyan300)),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 50,
                          width: 200,
                          decoration: BoxDecoration(
                              // color: white,
                              border: Border.all(color: cyan400, width: .5),
                              borderRadius: BorderRadius.circular(20)),
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                IconButton(
                                    onPressed: () {
                                      secretaryAttendenceTimeController.text =
                                          'day';
                                    },
                                    icon: Icon(
                                      CupertinoIcons.sun_max_fill,
                                      color: Colors.amber[200],
                                    )),
                                Container(
                                  width: .5,
                                  height: 16,
                                  color: cyan400,
                                ),
                                IconButton(
                                    onPressed: () {
                                      secretaryAttendenceTimeController.text =
                                          'night';
                                    },
                                    icon: Icon(
                                      CupertinoIcons.moon_stars_fill,
                                      color: cyan200,
                                    )),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  // bottomActionButtonsSec(context),
                  defaultButton(
                      text: 'تم',
                      function: () {
                        // Navigator.of(context).pop();
                        cubit.addsec(
                            secretaryNameController.text,
                            ' ',
                            secretaryPhoneNumberController.text,
                            secretaryEmailController.text,
                            secretaryAttendenceTimeController.text,
                            secretaryAddressController.text);
                      }),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
