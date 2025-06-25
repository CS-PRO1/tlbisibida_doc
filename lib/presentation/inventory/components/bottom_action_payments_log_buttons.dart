import 'package:flutter/material.dart';
import 'package:tlbisibida_doc/constants/constants.dart';
import 'package:tlbisibida_doc/presentation/inventory/dialogs/add_quantity_for_item_dialog.dart';
import 'package:tlbisibida_doc/presentation/inventory/tables/item_log_table.dart';

Row bottomActionPaymentsLogButtons(BuildContext context) {
  return Row(
    children: [
      Expanded(
        child: InkWell(
          onTap: () {
            // showDialog(
            //     context: context,
            //     builder: (context) {
            //       return itemLogDialog(context);
            //     });

            showItemLog(context);
          },
          child: Container(
            height: 50,
            decoration: const BoxDecoration(color: cyan50op),
            child: const Icon(Icons.menu, color: cyan400),
          ),
        ),
      ),
      Expanded(
        child: InkWell(
          onTap: () {
            showDialog(
              context: context,
              builder: (context) {
                return addQuantityForItem(context);
              },
            );
          },
          child: Container(
            height: 50,
            decoration: const BoxDecoration(
              color: cyan100,
            ),
            child: Center(
                child: Text(
              '- / +',
              style: TextStyle(color: cyan500, fontSize: 22),
            )),
            //  Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     const Icon(
            //       Icons.add,
            //       color: cyan400,
            //     ),

            //     const Icon(
            //       Icons.minimize_rounded,
            //       color: cyan400,
            //     ),
            //   ],
            // ),
          ),
        ),
      ),
    ],
  );
}

showItemLog(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(9.0),
            child: const Text(
              'سجل المادة',
              style: TextStyle(
                  color: cyan400, fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 440, // Set your desired height
            child: ItemLogTable(),
          ),
        ],
      );
    },
  );
}
