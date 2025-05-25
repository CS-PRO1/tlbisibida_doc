import 'dart:io';

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:tlbisibida_doc/components/date_picker.dart';
import 'package:tlbisibida_doc/components/default_button.dart';
import 'package:tlbisibida_doc/components/default_textfield.dart';
import 'package:tlbisibida_doc/components/image_picker.dart';
import 'package:tlbisibida_doc/components/searchable_drop.dart';
import 'package:tlbisibida_doc/components/teeth_selection_screen.dart';
import 'package:tlbisibida_doc/constants/constants.dart';

class SessionDetailsForm extends StatelessWidget {
  SessionDetailsForm({super.key});
  TextEditingController treatmenttypecontroller = TextEditingController();
  TextEditingController descriptioncontroller = TextEditingController();
  TextEditingController costController = TextEditingController();
  List<File> images = [];
  DateTime sessionDate = DateTime.now();
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
              style: TextStyle(
                  fontSize: 20, fontWeight: FontWeight.bold, color: cyan500),
            ),
            SizedBox(
              height: 25,
            ),
            Container(
              height: .5,
              color: cyan500,
              width: 200,
            ),
            SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'تاريخ الجلسة',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: cyan600),
                ),
                SizedBox(
                  width: 5,
                ),
                datePicker(context, sessionDate),
              ],
            ),
            SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'المعالجة',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: cyan600),
                ),
                SizedBox(
                  width: 5,
                ),
                SizedBox(
                  width: 180,
                  height: 50,
                  child: SearchableExpandableDropdown(
                    hintText: 'اختر المعالجة',
                    data: [
                      CategoryItem(
                        categoryName: 'تيجان وجسور',
                        items: ['معدن', 'خزف على معدن', 'زيركون'],
                      ),
                      CategoryItem(
                        categoryName: 'لثة',
                        items: ['تجريف تحت لثوي', 'تقليح'],
                      ),
                      CategoryItem(
                        categoryName: 'جراحة',
                        items: ['زرع', 'قلع جراحي', 'قلع'],
                      ),
                      CategoryItem(
                        categoryName: 'أطفال',
                        items: ['معالجة لبية', 'بتر لب', 'محافظة'],
                      ),
                      CategoryItem(
                        categoryName: 'مداواة',
                        items: ['سحب عصب', 'ترميمية'],
                      ),
                      CategoryItem(
                        categoryName: 'أجهزة (بدلات)',
                        items: ['جزئية', 'كاملة'],
                      ),
                      CategoryItem(
                        categoryName: 'تقويم',
                        items: ['وقائي', 'علاجي'],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: defaultTextField(descriptioncontroller, context, 'الوصف',
                  style: TextStyle(color: cyan500)),
            ),
            SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('الحساب',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: cyan600)),
                SizedBox(
                  width: 5,
                ),
                SizedBox(
                    width: 180,
                    child: defaultTextField(
                        costController, context, 'حساب الجلسة',
                        keyboardType: TextInputType.number)),
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: imagePicker(images),
            ),
            SizedBox(
              height: 25,
            ),
            Container(
                decoration: BoxDecoration(
                    color: cyan100,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: cyan200, width: 2)),
                child: TeethSelectionScreen(
                  showConnections: false,
                  asset: 'assets/teeth.svg',
                  isDocSheet: true,
                )),
            SizedBox(
              height: 25,
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
