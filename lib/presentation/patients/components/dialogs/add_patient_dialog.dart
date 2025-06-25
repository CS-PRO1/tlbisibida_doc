import 'package:flutter/material.dart';
import 'package:tlbisibida_doc/components/date_picker.dart';
import 'package:tlbisibida_doc/components/default_button.dart';
import 'package:tlbisibida_doc/components/default_textfield.dart';

import 'package:tlbisibida_doc/constants/constants.dart';

Dialog addPatientDialog(BuildContext context,
    {String? name, String? phoneNumber}) {
  bool v = true;

  TextEditingController patientNameController =
      TextEditingController(text: name ?? '');
  TextEditingController phoneNumberController =
      TextEditingController(text: phoneNumber ?? '');
  TextEditingController chronicDiseasesController = TextEditingController();
  TextEditingController medicinesController = TextEditingController();
  TextEditingController creditController = TextEditingController();
  DateTime birthdate = DateTime.now();
  return Dialog(
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
          decoration: BoxDecoration(
              border: Border.all(width: 2, color: cyan200),
              borderRadius: BorderRadius.circular(20)),
          width: MediaQuery.of(context).size.width / 1.1,
          height: MediaQuery.of(context).size.height / 1.3,
          child: CustomScrollView(slivers: [
            SliverFillRemaining(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'إضافة مريض',
                        style: TextStyle(
                            color: cyan400,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      Container(
                        height: .5,
                        width: 100,
                        color: cyan200,
                        margin: const EdgeInsets.symmetric(vertical: 5),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        //width: 250,
                        child: defaultTextField(
                            patientNameController, context, 'الاسم'),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      SizedBox(
                        //width: 300,
                        child: defaultTextField(
                            phoneNumberController, context, 'رقم الهاتف'),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        //width: 250,
                        children: [
                          Text(
                            'المواليد',
                            style: TextStyle(color: cyan600, fontSize: 16),
                          ),
                          datePicker(context, birthdate)
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(35),
                          color: cyan50,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'ذكر',
                                      style: TextStyle(
                                          color: cyan600, fontSize: 16),
                                    ),
                                    Radio(
                                        value: true,
                                        groupValue: 'groupValue',
                                        onChanged: (value) {}),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'أنثى',
                                      style: TextStyle(
                                          color: cyan600, fontSize: 16),
                                    ),
                                    Radio(
                                        value: true,
                                        groupValue: 'groupValue',
                                        onChanged: (value) {}),
                                  ],
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'مدخن؟',
                                  style:
                                      TextStyle(color: cyan600, fontSize: 16),
                                ),
                                Checkbox(
                                  value: v,
                                  onChanged: (value) {
                                    value = !v;
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      SizedBox(
                        // width: 250,
                        child: defaultTextField(
                            chronicDiseasesController, context, 'أمراض مزمنة'),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      SizedBox(
                        //  width: 250,
                        child: defaultTextField(
                            medicinesController, context, 'أدوية'),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      SizedBox(
                        //  width: 250,
                        child: defaultTextField(
                            creditController, context, 'الرصيد'),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      defaultButton(
                          text: 'إضافة',
                          function: () {
                            Navigator.of(context).pop();
                          })
                    ],
                  ),
                ),
              ),
            ),
          ])),
    ),
  );
}
