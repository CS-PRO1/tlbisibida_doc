import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:tlbisibida_doc/components/default_button.dart';
import 'package:tlbisibida_doc/components/image_picker.dart';
import 'package:tlbisibida_doc/constants/constants.dart';

Dialog imagePickDialog(BuildContext context) {
  List<Uint8List> images = [];

  return Dialog(
      child: Padding(
    padding: const EdgeInsets.all(16.0),
    child: Container(
      decoration: BoxDecoration(
          border: Border.all(width: 2, color: cyan200),
          borderRadius: BorderRadius.circular(20)),
      width: MediaQuery.of(context).size.width / 3,
      height: MediaQuery.of(context).size.height / 2,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                const Text(
                  'إضافة صور',
                  style: TextStyle(
                      color: cyan400,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: .5,
                  width: 100,
                  color: cyan200,
                  margin: const EdgeInsets.symmetric(vertical: 5),
                ),
              ],
            ),
            imagePicker(images, true),
            defaultButton(
                text: 'إضافة',
                function: () {
                  Navigator.of(context).pop();
                })
          ],
        ),
      ),
    ),
  ));
}
