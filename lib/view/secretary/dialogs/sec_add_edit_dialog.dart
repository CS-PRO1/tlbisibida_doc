import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tlbisibida_doc/components/default_button.dart';
import 'package:tlbisibida_doc/components/default_textfield.dart';

import 'package:tlbisibida_doc/constants/constants.dart';
import 'package:tlbisibida_doc/view/secretary/component/carousel.dart';
import 'package:tlbisibida_doc/view/secretary/component/bottom_action_buttons%20_sec.dart';

Dialog secAddEditDialog(BuildContext context, String title) {
  // TextEditingController itemnamecontroller =
  //     TextEditingController(text: 'سماكة 10');
  // TextEditingController itemunitcontroller =
  //     TextEditingController(text: 'بلوكة');
  // TextEditingController itemstandardquantitycontroller =
  //     TextEditingController(text: '50');
  // TextEditingController itemminimumquantitycontroller =
  //     TextEditingController(text: '10');
  // final TextEditingController catmenuController = TextEditingController();
  // final TextEditingController subcatmenuController = TextEditingController();

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
                              itemstandardquantitycontroller, context, 'الاسم',
                              style: TextStyle(color: cyan300)),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          width: 250,
                          child: defaultTextField(
                              itemstandardquantitycontroller,
                              context,
                              'العنوان',
                              style: TextStyle(color: cyan300)),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          width: 250,
                          child: defaultTextField(
                              itemstandardquantitycontroller, context, 'الرقم',
                              style: TextStyle(color: cyan300)),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          width: 250,
                          child: defaultTextField(
                              itemstandardquantitycontroller,
                              context,
                              'الايميل',
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
                                    onPressed: () {},
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
                                    onPressed: () {},
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
                      }),
                  const SizedBox(
                    height: 10,
                  ),
                  // deleteSecButton(
                  //   context,
                  // ),

                  // Text(
                  //   item['address'],
                  //   style: TextStyle(
                  //     color: Colors.white,
                  //     fontSize: 20.0,
                  //     fontWeight: FontWeight.bold,
                  //   ),
                  // ),
                  // SizedBox(
                  //   height: 20,
                  // ),
                  // Text(
                  //   item['number'],
                  //   style: TextStyle(
                  //     color: Colors.white,
                  //     fontSize: 20.0,
                  //     fontWeight: FontWeight.bold,
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
