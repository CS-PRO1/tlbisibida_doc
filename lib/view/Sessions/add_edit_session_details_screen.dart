import 'dart:io';

import 'package:flutter/material.dart';
import 'package:tlbisibida_doc/components/date_picker.dart';
import 'package:tlbisibida_doc/components/default_button.dart';
import 'package:tlbisibida_doc/components/default_textfield.dart';
import 'package:tlbisibida_doc/components/image_picker.dart';
import 'package:tlbisibida_doc/components/top_nav.dart';
import 'package:tlbisibida_doc/constants/constants.dart';
import 'package:tlbisibida_doc/view/Sessions/teeth_selection_screen.dart';

class AddEditSessionDetailsScreen extends StatelessWidget {
  AddEditSessionDetailsScreen({super.key});

  TextEditingController treatmenttypecontroller = TextEditingController();
  List<File> images = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopNavigationBar(),
      backgroundColor: cyan50,
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          // physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              Text(
                'المريض تحسين التحسيني',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              defaultTextField(
                  treatmenttypecontroller, context, 'نوع المعالجة'),
              SizedBox(
                height: 10,
              ),
              defaultTextField(treatmenttypecontroller, context, 'الوصف'),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'تاريخ الجلسة',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  datePicker(context),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: cyan500),
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // Text(
                        //   'إضافة صور',
                        //   style: TextStyle(
                        //       fontSize: 18,
                        //       fontWeight: FontWeight.bold,
                        //       color: cyan500),
                        // ),
                        // SizedBox(
                        //   width: 5,
                        // ),
                        imagePicker(images),
                      ],
                    ),
                    //            Wrap(
                    //   children: images.map((image) {
                    //     return Padding(
                    //       padding: const EdgeInsets.all(8.0),
                    //       child: Image.file(
                    //         image,
                    //         width: 100,
                    //         height: 100,
                    //         fit: BoxFit.cover,
                    //       ),
                    //     );
                    //   }).toList(),
                    // ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Card(
                  color: cyan100,
                  child: TeethSelectionScreen(asset: 'assets/teeth.svg')),
              SizedBox(
                height: 10,
              ),
              defaultButton(
                text: 'إرسال',
                function: () {
                  // final selectedTeeth = cubit.getSelectedTeeth();
                  // for (Tooth t in selectedTeeth) {
                  //   print('${t.id}\n${t.material}\n${t.treatment}');
                  // }
                  // final selectedConnections = cubit.getSelectedConnections();
                  // for (ToothConnection c in selectedConnections) {
                  //   print('${c.id}\n${c.tooth1Id}\n${c.tooth2Id}');
                  // }
                  // Here you would call your API sending function
                  // cubit.sendTeeth();
                  // Navigator.pop(context);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
