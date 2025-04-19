import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:tlbisibida_doc/components/default_button.dart';
import 'package:tlbisibida_doc/components/default_textfield.dart';

import 'package:tlbisibida_doc/constants/constants.dart';

Dialog addPatientDialog(BuildContext context) {
  TextEditingController itemstandardquantitycontroller =
      TextEditingController();
  bool v = true;

  return Dialog(
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
          decoration: BoxDecoration(
              border: Border.all(width: 2, color: cyan200),
              borderRadius: BorderRadius.circular(20)),
          width: MediaQuery.of(context).size.width / 1.1,
          height: MediaQuery.of(context).size.height / 1.25,
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
                            itemstandardquantitycontroller, context, 'الاسم'),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      SizedBox(
                        //width: 300,
                        child: defaultTextField(itemstandardquantitycontroller,
                            context, 'رقم الهاتف'),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      SizedBox(
                        //width: 250,
                        child: defaultTextField(itemstandardquantitycontroller,
                            context, 'المواليد'),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(35),
                          color: cyan50,
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Radio(
                                    value: true,
                                    groupValue: 'groupValue',
                                    onChanged: (value) {}),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text('ذكر '),
                                Radio(
                                    value: true,
                                    groupValue: 'groupValue',
                                    onChanged: (value) {}),
                                Text(' أنثى'),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Checkbox(
                                  value: v,
                                  onChanged: (value) {
                                    value = !v;
                                  },
                                ),
                                SizedBox(
                                  width: 40,
                                ),
                                const Text('مدخن؟'),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      SizedBox(
                        // width: 250,
                        child: defaultTextField(itemstandardquantitycontroller,
                            context, 'أمراض مزمنة '),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      SizedBox(
                        //  width: 250,
                        child: defaultTextField(
                            itemstandardquantitycontroller, context, 'أدوية'),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      SizedBox(
                        //  width: 250,
                        child: defaultTextField(
                            itemstandardquantitycontroller, context, 'الرصيد'),
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
