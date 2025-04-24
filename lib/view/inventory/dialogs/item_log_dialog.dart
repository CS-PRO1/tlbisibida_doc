import 'package:flutter/material.dart';

import 'package:tlbisibida_doc/constants/constants.dart';
import 'package:tlbisibida_doc/view/inventory/item_log_table.dart';

Dialog itemLogDialog(BuildContext context) {
  return Dialog(
    child: Container(
      height: 700,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Text(
            'سجل المادة',
            style: TextStyle(
                color: cyan400, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(
              width: MediaQuery.of(context).size.width / .5,
              height: MediaQuery.of(context).size.height / 1.5,
              child: const CustomScrollView(slivers: [
                SliverFillRemaining(
                  child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
                      child: ItemLogTable()),
                ),
              ])),
        ],
      ),
    ),
  );
}
