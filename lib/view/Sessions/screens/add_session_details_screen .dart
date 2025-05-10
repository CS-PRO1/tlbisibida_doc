import 'package:flutter/material.dart';

import 'package:tlbisibida_doc/constants/constants.dart';
import 'package:tlbisibida_doc/view/Sessions/components/session_details_form.dart';

class AddSessionDetailsScreen extends StatelessWidget {
  AddSessionDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: true,
      maintainBottomViewPadding: true,
      child: Scaffold(
        backgroundColor: cyan50,
        body: SessionDetailsForm(),
      ),
    );
  }
}
