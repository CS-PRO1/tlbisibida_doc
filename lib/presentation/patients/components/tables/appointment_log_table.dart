import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tlbisibida_doc/components/custom_text.dart';
import 'package:tlbisibida_doc/constants/constants.dart';
import 'package:tlbisibida_doc/presentation/patients/cubits/patients_cubit.dart';
import 'package:tlbisibida_doc/services/navigation/routes.dart';

/// Example without datasource
// ignore: must_be_immutable
class AppointmentLogTable extends StatelessWidget {
  const AppointmentLogTable({super.key});
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<PatientsCubit>();
    final items = cubit.patientTreatments;

    if (items.isEmpty) {
      return const Center(child: Text('لا توجد بيانات للعرض'));
    }
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
            height: (56 * items.length) + 40,
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
                    'الجلسة',
                    style: TextStyle(color: cyan300),
                  )),
                ),
                DataColumn(
                  label: Center(
                      child: Text(
                    'تاريخ الجلسة',
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
                items.length,
                (index) => DataRow(
                  cells: [
                    DataCell(Center(
                        child: CustomText(text: items[index].type ?? ''))),
                    DataCell(Center(
                        child: CustomText(text: items[index].date ?? ''))),
                    DataCell(Center(
                        child: IconButton(
                      onPressed: () {
                        context.push(sessionDetailsRoute);
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

class AppointmentLogItem {
  final String sessionName;
  final String sessionDate;
  AppointmentLogItem({required this.sessionName, required this.sessionDate});
}
