import 'dart:io';
import 'package:choice/choice.dart';
import 'package:flutter/material.dart';
import 'package:tlbisibida_doc/components/date_picker.dart';
import 'package:tlbisibida_doc/components/default_button.dart';
import 'package:tlbisibida_doc/components/default_textfield.dart';
import 'package:tlbisibida_doc/components/image_picker.dart';
import 'package:tlbisibida_doc/constants/constants.dart';
import 'package:tlbisibida_doc/components/teeth_selection_screen.dart';
import 'package:tlbisibida_doc/view/labs/components/shade_guides/guide_button.dart';
import 'package:tlbisibida_doc/view/labs/components/search_for_lab.dart';

class SendCaseToLabScreen extends StatefulWidget {
  const SendCaseToLabScreen({super.key});

  @override
  State<SendCaseToLabScreen> createState() => _AddOrderState();
}

class _AddOrderState extends State<SendCaseToLabScreen> {
  final List<String> _labslist = [
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
  // ignore: unused_field
  String _toothshade = '';
  List _labtypes = ['تعويض', 'تقويم', 'بدلات'];
  ValueNotifier<String> _targetlabtype = ValueNotifier<String>('تعويض');
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
                    ChoiceButtonWithSearch(
                        names: _labslist,
                        hintText: 'اختر المخبر', // Example hint text in Arabic
                        onNameSelected: (selectedName) {
                          print('Selected: $selectedName');
                          // Do something with the selected name
                        }),
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
                        ShadeSelectionButton(),
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
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => TeethSelectionScreen(
                              asset: 'assets/teeth.svg',
                            ),
                          ),
                        );
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
