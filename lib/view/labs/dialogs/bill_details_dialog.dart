// ignore_for_file: prefer_interpolation_to_compose_strings, prefer_adjacent_string_concatenation

import 'package:flutter/material.dart';
import 'package:tlbisibida_doc/components/default_button.dart';
import 'package:tlbisibida_doc/constants/constants.dart';

class BillDetailsDialog extends StatelessWidget {
  const BillDetailsDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
      child: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'تفاصيل الفاتورة',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, color: cyan400),
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                width: 600,
                child: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) =>
                        listItemBuilder(context, index),
                    itemCount: 4,
                    separatorBuilder: (BuildContext context, int index) =>
                        Container()),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'الفاتورة النهائية',
                    style: TextStyle(fontSize: 18),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: cyan200,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(20)),
                    child: const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 18, vertical: 12),
                      child: Text(
                        '30.000.000',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              defaultButton(
                  text: 'تم',
                  function: () {
                    Navigator.pop(context);
                  })
            ]),
      ),
    ));
  }
}

listItemBuilder(context, index) {
  return InkWell(
    onTap: () {
      //Get.toNamed('/orderdetails', arguments: {'id': index});
    },
    child: Container(
      decoration: BoxDecoration(border: Border.all(width: .5, color: cyan200)),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                const Text('اسم المريض:' +
                    ' ' +
                    //controller.billsListModel!.data[index].patient_name
                    'تحسين'),
                SizedBox(
                  height: 5,
                ),
                Container(
                  color: const Color.fromARGB(137, 41, 157, 144),
                  height: .3,
                  width: 150,
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Column(
                      children: [
                        Text('التاريخ:'),
                        Text('09/12/2024'.toString().substring(0, 10)),
                      ],
                    ),
                    SizedBox(
                      width: 25,
                    ),
                    Container(
                      color: const Color.fromARGB(137, 41, 157, 144),
                      width: .3,
                      height: 40,
                    ),
                    SizedBox(
                      width: 25,
                    ),
                    Column(
                      children: [
                        const Text('الفاتورة: '),
                        const Text('3,000,000'),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
