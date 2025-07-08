import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tlbisibida_doc/components/custom_text.dart';
import 'package:tlbisibida_doc/constants/constants.dart';
import 'package:tlbisibida_doc/presentation/labs/dialogs/bill_details_dialog.dart';

/// Example without datasource
// ignore: must_be_immutable
class LabBillsTable extends StatelessWidget {
  LabBillsTable({super.key});
  int count = 10;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: cyan200, width: .5),
          boxShadow: const [
            BoxShadow(offset: Offset(0, 6), color: Colors.grey, blurRadius: 12)
          ],
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.all(16),
        // margin: const EdgeInsets.only(bottom: 30),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          SizedBox(
            height: (56 * count) + 40,
            child: DataTable2(
              columnSpacing: 12,
              dataRowHeight: 56,
              headingRowHeight: 40,
              horizontalMargin: 12,
              minWidth: 300,
              columns: const [
                DataColumn(
                  label: Center(
                      child: Text(
                    'تاريخ الفاتورة',
                    style: TextStyle(color: cyan300),
                  )),
                ),
                DataColumn(
                  label: Center(
                      child: Text(
                    'المبلغ',
                    style: TextStyle(color: cyan300),
                  )),
                ),
                DataColumn(
                  label: Center(
                      child: Text(
                    'التفاصيل',
                    style: TextStyle(color: cyan300),
                  )),
                ),
              ],
              rows: List<DataRow>.generate(
                count,
                (index) => DataRow(
                  cells: [
                    DataCell(Center(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              'من',
                              style: TextStyle(color: cyan500),
                            ),
                            CustomText(
                              text: DateFormat.yMd().format(DateTime.now()),
                              size: 14,
                              alignment: TextAlign.center,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              'إلى',
                              style: TextStyle(color: cyan500),
                            ),
                            CustomText(
                              text: DateFormat.yMd().format(DateTime.now()),
                              size: 14,
                              alignment: TextAlign.center,
                            ),
                          ],
                        ),
                      ],
                    ))),
                    DataCell(Center(
                        child: CustomText(
                      text: '3,500,000',
                      size: 14,
                      alignment: TextAlign.center,
                    ))),
                    DataCell(Center(
                        child: IconButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) => BillDetailsDialog());
                      },
                      icon: const Icon(
                        Icons.arrow_circle_left_outlined,
                        color: cyan300,
                      ),
                    ))),
                  ],
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
