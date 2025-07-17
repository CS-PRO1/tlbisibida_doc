import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tlbisibida_doc/components/custom_text.dart';
import 'package:tlbisibida_doc/constants/constants.dart';
import 'package:tlbisibida_doc/presentation/patients/cubits/patients_cubit.dart';
import 'package:tlbisibida_doc/presentation/patients/cubits/patient_states.dart';
import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:tlbisibida_doc/services/navigation/routes.dart';

/// Example without datasource
// ignore: must_be_immutable
class PatientsFinanceTable extends StatelessWidget {
  PatientsFinanceTable({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PatientsCubit, PatientsState>(
      listener: (context, state) {
        if (state is PatientsError) {
          AnimatedSnackBar.material(
            state.message.isNotEmpty
                ? state.message
                : 'حدث خطأ ما، يرجى المحاولة لاحقاً',
            type: AnimatedSnackBarType.error,
            mobileSnackBarPosition: MobileSnackBarPosition.bottom,
            duration: const Duration(seconds: 3),
          ).show(context);
        }
      },
      builder: (context, state) {
        final patientsCubit = context.read<PatientsCubit>();
        if (state is PatientsLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is PatientsError) {
          return Center(child: Text('حدث خطأ أثناء تحميل قائمة المرضى'));
        } else if (state is PatientsLoaded) {
          final patientsList = state.patients;
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
                  height: (56 * patientsList.length) + 40,
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
                      patientsList.length,
                      (index) => DataRow(
                        cells: [
                          DataCell(Center(
                              child: CustomText(
                            text: patientsList[index].fullName ?? '-',
                            alignment: TextAlign.center,
                            size: 14,
                          ))),
                          DataCell(Center(
                              child: CustomText(
                            text: patientsList[index].currentBalance?.toString() ?? '-',
                            textDirection: TextDirection.ltr,
                            alignment: TextAlign.center,
                            size: 14,
                          ))),
                          DataCell(Center(
                              child: IconButton(
                            onPressed: () {
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
        } else {
          // Initial or other states
          return const Center(child: Text('لا توجد بيانات للعرض'));
        }
      },
    );
  }
}
