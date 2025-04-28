import 'package:flutter/material.dart';
import 'package:tlbisibida_doc/components/default_button.dart';
import 'package:tlbisibida_doc/components/default_textfield.dart';

import 'package:tlbisibida_doc/constants/constants.dart';

Dialog itemAddEditDialog(BuildContext context, String title) {
  TextEditingController itemnamecontroller =
      TextEditingController(text: 'سماكة 10');
  TextEditingController itemunitcontroller =
      TextEditingController(text: 'بلوكة');
  TextEditingController itemstandardquantitycontroller =
      TextEditingController(text: '50');
  TextEditingController itemminimumquantitycontroller =
      TextEditingController(text: '10');
  final TextEditingController catmenuController = TextEditingController();
  final TextEditingController subcatmenuController = TextEditingController();

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
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: const TextStyle(
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
                DropdownMenu<String>(
                    //initialSelection: menuItems.first,
                    width: MediaQuery.of(context).size.width / 2 - 16,
                    controller: catmenuController,
                    hintText: "اختر الصنف",
                    initialSelection: 'صنف1',
                    requestFocusOnTap: true,
                    enableFilter: true,
                    inputDecorationTheme: InputDecorationTheme(
                      border: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: cyan200, width: 1.0),
                          borderRadius: standardBorderRadius),
                    ),
                    menuStyle: const MenuStyle(
                        backgroundColor: WidgetStatePropertyAll(cyan100)),
                    label: const Text('الصنف الرئيسي'),
                    dropdownMenuEntries: const [
                      DropdownMenuEntry(value: 'صنف1', label: 'بلوكات زيركون'),
                      DropdownMenuEntry(
                          value: 'صنف2', label: 'بلوكات اكريل مؤقت'),
                      DropdownMenuEntry(value: 'صنف3', label: 'بودرة خزف'),
                      DropdownMenuEntry(value: 'صنف4', label: 'شمع'),
                    ]),
                const SizedBox(
                  height: 20,
                ),
                DropdownMenu<String>(
                    //initialSelection: menuItems.first,
                    //width: MediaQuery.of(context).size.width - 16.0,
                    width: MediaQuery.of(context).size.width / 2 - 16,
                    controller: subcatmenuController,
                    hintText: "اختر الصنف",
                    initialSelection: 'صنف1',
                    requestFocusOnTap: true,
                    enableFilter: true,
                    inputDecorationTheme: InputDecorationTheme(
                      border: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: cyan200, width: 1.0),
                          borderRadius: standardBorderRadius),
                    ),
                    menuStyle: const MenuStyle(
                        backgroundColor: WidgetStatePropertyAll(cyan100)),
                    label: const Text('الصنف الفرعي'),
                    dropdownMenuEntries: const [
                      DropdownMenuEntry(value: 'صنف1', label: 'صيني'),
                      DropdownMenuEntry(value: 'صنف2', label: 'ألماني'),
                      DropdownMenuEntry(value: 'صنف3', label: 'ملتي لاير'),
                      DropdownMenuEntry(value: 'صنف4', label: 'عالي شفوفية'),
                      DropdownMenuEntry(value: 'صنف5', label: 'كتيم'),
                    ]),
                const SizedBox(
                  height: 20,
                ),
                defaultTextField(
                  itemnamecontroller,
                  context,
                  'اسم المادة',
                ),
                const SizedBox(
                  height: 20,
                ),
                defaultTextField(itemunitcontroller, context, 'الواحدة'),
                const SizedBox(
                  height: 20,
                ),
                defaultTextField(
                    itemstandardquantitycontroller, context, 'الكمية القياسية'),
                const SizedBox(
                  height: 20,
                ),
                defaultTextField(itemminimumquantitycontroller, context,
                    'الحد الأدنى للكمية'),
                const SizedBox(
                  height: 20,
                ),
                defaultButton(
                    text: 'تم',
                    function: () {
                      Navigator.of(context).pop();
                    })
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
