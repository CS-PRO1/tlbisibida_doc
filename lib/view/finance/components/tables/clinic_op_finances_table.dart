import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tlbisibida_doc/components/custom_text.dart';
import 'package:tlbisibida_doc/constants/constants.dart';

class ClinicOpFinancesTable extends StatelessWidget {
  ClinicOpFinancesTable({super.key});
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
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          SizedBox(
            height: (56 * count) + 40,
            child: DataTable2(
              columnSpacing: 2,
              dataRowHeight: 56,
              headingRowHeight: 40,
              horizontalMargin: 12,
              minWidth: 300,
              columns: const [
                DataColumn(
                  label: Center(
                      child: Text(
                    'المنتج/الخدمة',
                    style: TextStyle(color: cyan300),
                  )),
                ),
                DataColumn(
                  label: Center(
                      child: Text(
                    'السعر',
                    style: TextStyle(color: cyan300),
                  )),
                ),
                // DataColumn(
                //   label: Center(
                //       child: Text(
                //     'العدد',
                //     style: TextStyle(color: cyan300),
                //   )),
                // ),
                DataColumn(
                  label: Center(
                      child: Text(
                    'التاريخ',
                    style: TextStyle(color: cyan300),
                  )),
                ),
              ],
              rows: List<DataRow>.generate(
                count,
                (index) => DataRow(
                  cells: [
                    const DataCell(Center(
                        child: CustomText(
                      text: 'رواتب',
                      size: 14,
                      alignment: TextAlign.center,
                    ))),
                    DataCell(Center(
                        child: CustomText(
                      text: '3,000,000',
                      size: 14,
                      alignment: TextAlign.center,
                    ))),
                    // DataCell(Center(
                    //     child: CustomText(
                    //   text: '1',
                    //   size: 14,
                    //   alignment: TextAlign.center,
                    // ))),
                    DataCell(Center(
                        child: CustomText(
                      text: DateFormat.yMd().format(DateTime.now()),
                      size: 14,
                      alignment: TextAlign.center,
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
