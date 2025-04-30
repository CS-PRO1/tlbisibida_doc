import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:tlbisibida_doc/components/custom_text.dart';
import 'package:tlbisibida_doc/constants/constants.dart';
import 'package:tlbisibida_doc/services/navigation/locator.dart';
import 'package:tlbisibida_doc/services/navigation/navigation_service.dart';
import 'package:tlbisibida_doc/services/navigation/routes.dart';

/// Example without datasource
// ignore: must_be_immutable
class AppointmentLogTable extends StatelessWidget {
  AppointmentLogTable({super.key});
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
              columnSpacing: 12,
              dataRowHeight: 56,
              headingRowHeight: 40,
              horizontalMargin: 12,
              minWidth: 300,
              columns: const [
                DataColumn(
                  label: Center(
                      child: Text(
                    'التفاصيل',
                    style: TextStyle(color: cyan300),
                  )),
                ),
                // DataColumn(
                //   label: Center(
                //       child: Text(
                //     'رقم الفاتورة',
                //     style: TextStyle(color: cyan300),
                //   )),
                // ),
                DataColumn(
                  label: Center(
                      child: Text(
                    'الجلسة',
                    style: TextStyle(color: cyan300),
                  )),
                ),
                DataColumn(
                  label: Center(
                      child: Text(
                    'تاريخ الموعد',
                    style: TextStyle(color: cyan300),
                  )),
                ),
              ],
              rows: List<DataRow>.generate(
                count,
                (index) => DataRow(
                  cells: [
                    DataCell(Center(
                        child: IconButton(
                      onPressed: () {
                        locator<NavigationService>()
                            .navigateTo(sessionDetailsRoute);
                      },
                      icon: const Icon(
                        Icons.arrow_circle_left_outlined,
                        color: cyan300,
                      ),
                    ))),
                    // const DataCell(Center(
                    //     child: CustomText(
                    //   text: '001',
                    // ))),
                    const DataCell(Center(child: CustomText(text: 'قلع ضرس'))),
                    const DataCell(
                        Center(child: CustomText(text: '5/11/2024'))),
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
