import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tlbisibida_doc/components/custom_text.dart';
import 'package:tlbisibida_doc/constants/constants.dart';
import 'package:tlbisibida_doc/presentation/patients/cubits/patients_cubit.dart';

/// Example without datasource
// ignore: must_be_immutable
class PaymentsLogTable extends StatelessWidget {
  const PaymentsLogTable({super.key});
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<PatientsCubit>();
    if (cubit.patientPayments.isEmpty) {
      return const Center(child: Text('لا توجد بيانات للعرض'));
    }
    return Center(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: cyan200, width: 1),
          boxShadow: const [
            BoxShadow(offset: Offset(0, 6), color: Colors.grey, blurRadius: 12)
          ],
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.all(16),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          SizedBox(
            width: 230,
            height: (56 * cubit.patientPayments.length) + 40,
            child: DataTable2(
              columnSpacing: 12,
              dataRowHeight: 56,
              headingRowHeight: 40,
              horizontalMargin: 12,
              minWidth: 200,
              columns: const [
                DataColumn(
                  label: Center(
                      child: Text(
                    'القيمة المسددة',
                    style: TextStyle(color: cyan300),
                  )),
                ),
                DataColumn(
                  label: Center(
                      child: Text(
                    'تاريخ الدفع',
                    style: TextStyle(color: cyan300),
                  )),
                ),
              ],
              rows: List<DataRow>.generate(
                cubit.patientPayments.length,
                (index) => DataRow(
                  cells: [
                    DataCell(Center(
                        child: CustomText(
                      text: cubit.patientPayments[index].value.toString(),
                      textDirection: TextDirection.ltr,
                    ))),
                    DataCell(Center(
                        child: CustomText(
                            text: cubit.patientPayments[index].paymentDate ??
                                ''))),
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
