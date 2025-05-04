import 'package:flutter/material.dart';
import 'package:tlbisibida_doc/constants/constants.dart';
import 'package:tlbisibida_doc/view/secretary/component/carousel.dart';
import 'package:tlbisibida_doc/view/secretary/dialogs/sec_add_edit_dialog.dart';

class SecretaryScreen extends StatelessWidget {
  const SecretaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 15,
              ),
              SizedBox(height: 680, child: Carousel()),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return secAddEditDialog(context, 'إضافة سكرتير/ة');
            },
          );
        },
        child: Icon(
          Icons.add,
          size: 28,
        ),
        mini: true,
        backgroundColor: cyan400,
        foregroundColor: white,
        shape: RoundedRectangleBorder(
            side: BorderSide(color: cyan600, width: 1.5),
            borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
