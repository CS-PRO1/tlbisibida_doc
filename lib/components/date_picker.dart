import 'package:flutter/material.dart';
import 'package:tlbisibida_doc/constants/constants.dart';
// import 'package:power_overload/Shared/constants.dart';

Widget datePicker(BuildContext context) {
  DateTime dateTime = DateTime.now();
  void getDatePicker() {
    showDatePicker(
      //barrierColor: green400,
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2050),
    ).then((value) {
      value != null ? dateTime = value : dateTime = DateTime.now();
    });
  }

  return SizedBox(
    width: 175,
    child: Card(
      clipBehavior: Clip.antiAlias,
      color: cyan100,
      elevation: 1,
      shape: RoundedRectangleBorder(
          side: const BorderSide(color: cyan400, width: .8),
          borderRadius: BorderRadius.circular(20)),
      child: InkWell(
        onTap: getDatePicker,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${dateTime.year}/${dateTime.month}/${dateTime.day}',
                style: const TextStyle(fontSize: 16),
              ),
              const Icon(Icons.calendar_month_outlined),
            ],
          ),
        ),
      ),
    ),
  );
}
