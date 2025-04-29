import 'package:flutter/material.dart';
import 'package:tlbisibida_doc/components/tusk_icons.dart';
import 'package:tlbisibida_doc/constants/constants.dart';

class StatisticsScreen extends StatelessWidget {
  const StatisticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: cyan300,
      child: Center(
          child: Icon(
        TuskIcons.lab_icon,
        size: 90,
        textDirection: TextDirection.ltr,
      )),
    ));
  }
}
