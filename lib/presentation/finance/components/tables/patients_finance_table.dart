import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tlbisibida_doc/components/custom_text.dart';
import 'package:tlbisibida_doc/constants/constants.dart';
import 'package:tlbisibida_doc/services/navigation/routes.dart';

/// Example without datasource
// ignore: must_be_immutable
class PatientsFinanceTable extends StatelessWidget {
  PatientsFinanceTable({super.key});
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
                    'اسم المريض',
                    style: TextStyle(color: cyan300),
                  )),
                ),
                DataColumn(
                  label: Center(
                      child: Text(
                    'الرصيد',
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
                    const DataCell(Center(
                        child: CustomText(
                      text: 'تحسين التحسيني',
                      alignment: TextAlign.center,
                      size: 14,
                    ))),
                    DataCell(Center(
                        child: CustomText(
                      text: '-350000',
                      textDirection: TextDirection.ltr,
                      alignment: TextAlign.center,
                      size: 14,
                    ))),
                    DataCell(Center(
                        child: IconButton(
                      onPressed: () {
                        // Navigator.of(context).push(MaterialPageRoute(
                        //   builder: (context) => PatientInfoScreen(),
                        // ));
                        // Navigator.pushNamed(context, patientInfoRoute);
                        context.push(patientInfoRoute);
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
