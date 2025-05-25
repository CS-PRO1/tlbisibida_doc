import 'package:flutter/material.dart';
import 'package:tlbisibida_doc/constants/constants.dart';
// import 'package:power_overload/Shared/constants.dart';

Widget datePicker(BuildContext context, DateTime dateTime) {
  // DateTime dateTime = DateTime.now();
  void getDatePicker() {
    showDatePicker(
      //barrierColor: green400,
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1950),
      lastDate: DateTime(2050),
    ).then((value) {
      value != null ? dateTime = value : dateTime = DateTime.now();
    });
  }

  return SizedBox(
    width: 185,
    child: Card(
      clipBehavior: Clip.antiAlias,
      color: Colors.transparent,
      elevation: 0,
      shape: RoundedRectangleBorder(
          side: const BorderSide(color: cyan300, width: .5),
          borderRadius: BorderRadius.circular(20)),
      child: InkWell(
        onTap: getDatePicker,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${dateTime.year}/${dateTime.month}/${dateTime.day}',
                style: const TextStyle(fontSize: 16, color: cyan500),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: const Icon(
                  Icons.calendar_month_outlined,
                  color: cyan500,
                  size: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
