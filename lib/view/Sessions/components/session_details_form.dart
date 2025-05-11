import 'dart:io';

import 'package:flutter/material.dart';
import 'package:tlbisibida_doc/components/date_picker.dart';
import 'package:tlbisibida_doc/components/default_button.dart';
import 'package:tlbisibida_doc/components/default_textfield.dart';
import 'package:tlbisibida_doc/components/image_picker.dart';
import 'package:tlbisibida_doc/components/teeth_selection_screen.dart';
import 'package:tlbisibida_doc/constants/constants.dart';

class SessionDetailsForm extends StatelessWidget {
  SessionDetailsForm({super.key});
  TextEditingController treatmenttypecontroller = TextEditingController();
  TextEditingController descriptioncontroller = TextEditingController();
  List<File> images = [];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'المريض تحسين التحسيني',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 15,
            ),
            defaultTextField(treatmenttypecontroller, context, 'نوع المعالجة'),
            SizedBox(
              height: 15,
            ),
            defaultTextField(descriptioncontroller, context, 'الوصف',
                height: 3),
            SizedBox(
              height: 15,
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
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: imagePicker(images),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
                decoration: BoxDecoration(
                    color: cyan100,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: cyan200, width: 2)),
                child: TeethSelectionScreen(asset: 'assets/teeth.svg')),
            SizedBox(
              height: 15,
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
            ),
          ],
        ),
      ),
    );
  }
}
