import 'dart:io';
import 'package:choice/choice.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:tlbisibida_doc/components/date_picker.dart';
import 'package:tlbisibida_doc/components/default_button.dart';
import 'package:tlbisibida_doc/components/default_textfield.dart';
import 'package:tlbisibida_doc/components/image_picker.dart';
import 'package:tlbisibida_doc/components/top_nav.dart';
import 'package:tlbisibida_doc/constants/constants.dart';

class SendCaseToLabScreen extends StatefulWidget {
  SendCaseToLabScreen({super.key});

  @override
  State<SendCaseToLabScreen> createState() => _AddOrderState();
}

class _AddOrderState extends State<SendCaseToLabScreen> {
  List<String> _labslist = [
    'مخبر الحموي',
    'مخبر الحمصي',
    'مخبر الشامي',
    'مخبر التحسيني',
  ];
  var patientnamecontroller = TextEditingController(text: 'تحسين التحسيني');
  String? selectedLabName;
  var agecontroller = TextEditingController(text: '45');
  var notecontroller = TextEditingController(
      text:
          'الرجاء خفض التعويض لعدم وجود مسافة كافية وتضييق الفراغ بين السن والتعويض لضعف السن');
  var formkey = GlobalKey<FormState>();
  bool _needTrial = false;
  bool _isRepeat = false;
  String _toothshade = 'A1';
  List _labtypes = ['تعويض', 'تقويم', 'بدلات'];
  final ValueNotifier<String> _targetlabtype = ValueNotifier<String>('تعويض');
  DateTime expectedDeliveryDate = DateTime.now();
  List<File> images = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: cyan50,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Form(
              key: formkey,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'حالة تحسين التحسيني',
                      style: TextStyle(fontSize: 18, color: cyan600),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      color: cyan300,
                      width: 200,
                      height: .5,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: InlineChoice<String>.single(
                          value: _targetlabtype.value,
                          onChanged: (value) {
                            _targetlabtype.value = value!;
                            print(_targetlabtype.toString());
                          },
                          clearable: false,
                          itemCount: _labtypes.length,
                          itemBuilder: (state, i) {
                            return ChoiceChip(
                              selectedColor: cyan200,
                              side: const BorderSide(color: cyan300),
                              selected: state.selected(_labtypes[i]),
                              onSelected: state.onSelected(_labtypes[i]),
                              label: Text(_labtypes[i]),
                            );
                          },
                          listBuilder: ChoiceList.createWrapped(
                              runAlignment: WrapAlignment.center,
                              alignment: WrapAlignment.center,
                              direction: Axis.horizontal,
                              textDirection: TextDirection.rtl,
                              //spacing: 10,
                              //runSpacing: 10,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 5,
                              ))),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    DropdownSearch<String>(
                      mode: Mode.form,
                      selectedItem: selectedLabName,
                      onChanged: (value) {
                        selectedLabName = value.toString();
                      },
                      items: (f, cs) => _labslist,
                      suffixProps: DropdownSuffixProps(
                          clearButtonProps: ClearButtonProps(isVisible: true)),
                      dropdownBuilder: (context, selectedItem) {
                        if (selectedItem == null) {
                          return SizedBox.shrink();
                        }
                        return ListTile(
                          titleAlignment: ListTileTitleAlignment.center,
                          title: Text(selectedItem),
                        );
                      },
                      popupProps: PopupProps.menu(
                        disableFilter: true,
                        showSearchBox: true,
                        showSelectedItems: true,
                        itemBuilder: (ctx, item, isDisabled, isSelected) {
                          return ListTile(
                            selected: isSelected,
                            title: Text(item),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      color: cyan300,
                      width: 200,
                      height: .5,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        DropdownMenu(
                          dropdownMenuEntries: <DropdownMenuEntry<String>>[
                            DropdownMenuEntry(
                              value: 'BL1',
                              label: 'BL1',
                            ),
                            DropdownMenuEntry(value: 'BL2', label: 'BL2'),
                            DropdownMenuEntry(value: 'BL3', label: 'BL3'),
                            DropdownMenuEntry(value: 'BL4', label: 'BL4'),
                            DropdownMenuEntry(value: 'A1', label: 'A1'),
                            DropdownMenuEntry(value: 'A2', label: 'A2'),
                            DropdownMenuEntry(value: 'A3', label: 'A3'),
                            DropdownMenuEntry(value: 'A3.5', label: 'A3.5'),
                            DropdownMenuEntry(value: 'B1', label: 'A4'),
                            DropdownMenuEntry(value: 'B2', label: 'B1'),
                            DropdownMenuEntry(value: 'B3', label: 'B2'),
                            DropdownMenuEntry(value: 'A4', label: 'B3'),
                            DropdownMenuEntry(value: 'B4', label: 'B4'),
                            DropdownMenuEntry(value: 'C1', label: 'C1'),
                            DropdownMenuEntry(value: 'C2', label: 'C2'),
                            DropdownMenuEntry(value: 'C3', label: 'C3'),
                            DropdownMenuEntry(value: 'C4', label: 'C4'),
                            DropdownMenuEntry(value: 'D1', label: 'D1'),
                            DropdownMenuEntry(value: 'D2', label: 'D2'),
                            DropdownMenuEntry(value: 'D3', label: 'D3'),
                            DropdownMenuEntry(value: 'D4', label: 'D4'),
                          ],
                          menuHeight: 260,
                          width: 125,
                          label: Text(
                            'لون الأسنان',
                            style: TextStyle(fontSize: 12),
                          ),
                          onSelected: (value) {
                            setState(() {
                              _toothshade = value!;
                            });
                          },
                        ),
                        Container(
                          width: .5,
                          height: 100,
                          color: cyan300,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Checkbox(
                                  value: _isRepeat,
                                  onChanged: (value) {
                                    value = !_isRepeat;
                                  },
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                const Text('إعادة؟'),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Checkbox(
                                  value: _needTrial,
                                  onChanged: (value) {
                                    value = !_needTrial;
                                  },
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                const Text('بحاجة تجربة؟'),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      color: cyan300,
                      width: 200,
                      height: .5,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'موعد التسليم:',
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        datePicker(context),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      color: cyan300,
                      width: 200,
                      height: .5,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    imagePicker(images),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      color: cyan300,
                      width: 200,
                      height: .5,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    defaultTextField(
                      notecontroller,
                      context,
                      'ملاحظات',
                      prefixIcon: Icon(Icons.edit_note),
                      height: 5,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    defaultButton(
                      width: 150,
                      text: 'التالي',
                      function: () {
                        // var requestJson = {
                        //   "patient_name": patientnamecontroller.text,
                        //   "age": int.parse(agecontroller.text),
                        //   "gender": _isMale ? "male" : "female",
                        //   "need_trial": _needTrial ? 1 : 0,
                        //   "repeate": _isRepeat ? 1 : 0,
                        //   "notes": notecontroller.text,
                        //   "_toothshade": _toothshade,
                        //   "expect_delivery_time":
                        //       expectedDeliveryDate.toIso8601String(),
                        //   "images": images.map((image) => image.path).toList(),
                        // };
                        // Send requestJson to the server
                        //controller.addCase(requestJson);
                        //Get.toNamed('/teethselect');
                      },
                      heigh: 50,
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
