import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tlbisibida_doc/constants/constants.dart';

Widget imagePicker(List images) {
  return StatefulBuilder(
    builder: (context, setState) {
      return Column(
        children: [
          // ElevatedButton(
          //   onPressed: () async {
          //     final pickedFile =
          //         await ImagePicker().pickImage(source: ImageSource.gallery);
          //     if (pickedFile != null) {
          //       setState(() {
          //         images.add(File(pickedFile.path));
          //       });
          //     }
          //   },
          //   child: Text('صور من المعرض'),
          // ),
          // ElevatedButton(
          //   onPressed: () async {
          //     final pickedFile =
          //         await ImagePicker().pickImage(source: ImageSource.camera);
          //     if (pickedFile != null) {
          //       setState(() {
          //         images.add(File(pickedFile.path));
          //       });
          //     }
          //   },
          //   child: Text('التقاط صورة'),
          // ),
          Row(
            children: [
              Text(
                'إضافة صور',
                style: TextStyle(
                    fontSize: 18, fontWeight: FontWeight.bold, color: cyan500),
              ),
              SizedBox(
                width: 5,
              ),
              IconButton(
                onPressed: () async {
                  final pickedFile = await ImagePicker()
                      .pickImage(source: ImageSource.gallery);
                  if (pickedFile != null) {
                    setState(() {
                      images.add(File(pickedFile.path));
                    });
                  }
                },
                icon: Icon(Icons.image_search_rounded),
                color: cyan500,
              ),
              IconButton(
                onPressed: () async {
                  final pickedFile =
                      await ImagePicker().pickImage(source: ImageSource.camera);
                  if (pickedFile != null) {
                    setState(() {
                      images.add(File(pickedFile.path));
                    });
                  }
                },
                icon: Icon(Icons.camera_alt_rounded),
                color: cyan500,
              ),
            ],
          ),
          SizedBox(height: 10),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Wrap(
              direction: Axis.horizontal,
              alignment: WrapAlignment.center,
              children: images.map((image) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    clipBehavior: Clip.antiAlias,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(10)),
                    child: Image.file(
                      image,
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      );
    },
  );
}
