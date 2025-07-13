import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:go_router/go_router.dart';
import 'package:tlbisibida_doc/components/custom_text.dart';
import 'package:tlbisibida_doc/constants/constants.dart';
import 'package:tlbisibida_doc/presentation/labs/cases/cubit/cases_cubit.dart';
import 'package:tlbisibida_doc/presentation/labs/cases/cubit/cases_states.dart';
import 'package:tlbisibida_doc/services/navigation/routes.dart';

class LabCasesTable extends StatelessWidget {
  LabCasesTable({super.key, this.data});
  List? data = [];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CasesCubit, CasesState>(
      listener: (context, state) {
        if (state is CasesError) {
          AnimatedSnackBar.material(
            state.message.isNotEmpty
                ? state.message
                : 'حدث خطأ ما، يرجى المحاولة لاحقاً',
            type: AnimatedSnackBarType.error,
            mobileSnackBarPosition: MobileSnackBarPosition.bottom,
            duration: Duration(seconds: 3),
            animationCurve: Easing.standard,
          ).show(context);
        }
      },
      builder: (context, state) {
        final cubit = context.read<CasesCubit>();
        if (state is CasesLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is CasesError) {
          return Center(child: Text('حدث خطأ أثناء تحميل الحالات'));
        } else if (state is CaseListLoaded) {
          final caseList = state.caseList;
          return Center(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: cyan200, width: .5),
                boxShadow: const [
                  BoxShadow(
                      offset: Offset(0, 6), color: Colors.grey, blurRadius: 12)
                ],
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.all(16),
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                SizedBox(
                  height: (56 * caseList.length) + 40,
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
                          'تاريخ الحالة',
                          style: TextStyle(color: cyan300),
                        )),
                      ),
                      DataColumn(
                        label: Center(
                            child: Text(
                          'المريض',
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
                      caseList.length,
                      (index) {
                        var caseitem = caseList[index];
                        return DataRow(
                          cells: [
                            DataCell(Center(
                                child: CustomText(
                              text: caseitem.createdAt!,
                              size: 14,
                              alignment: TextAlign.center,
                            ))),
                            DataCell(Center(
                                child: CustomText(
                              text: caseitem.patient!.fullName!,
                              size: 14,
                              alignment: TextAlign.center,
                            ))),
                            DataCell(Center(
                                child: IconButton(
                              onPressed: () {
                                context.push(caseDetailsRoute);
                              },
                              icon: const Icon(
                                Icons.arrow_circle_left_outlined,
                                color: cyan300,
                              ),
                            ))),
                          ],
                        );
                      },
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
