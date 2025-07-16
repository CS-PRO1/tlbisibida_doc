// ignore_for_file: prefer_interpolation_to_compose_strings, prefer_adjacent_string_concatenation

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tlbisibida_doc/components/default_button.dart';
import 'package:tlbisibida_doc/constants/constants.dart';
import 'package:tlbisibida_doc/domain/models/bills/show_bill_details.dart';
import 'package:tlbisibida_doc/presentation/labs/screens/cubit/labs_cubit.dart';

class BillDetailsDialog extends StatelessWidget {
  const BillDetailsDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<LabsCubit>();

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
                        listItemBuilder(context, index,
                            cubit.currentbill!.billCases![index]),
                    itemCount: cubit.currentbill!.billCases!.length,
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
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 18, vertical: 12),
                      child: Text(
                        cubit.currentbill!.bill!.totalCost.toString(),
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

listItemBuilder(context, index, BillCase billCase) {
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
                Text('اسم المريض: ' + billCase.fullName!),
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
                        Text(billCase.createdAt!),
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
                        Text(billCase.caseCost.toString()),
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
