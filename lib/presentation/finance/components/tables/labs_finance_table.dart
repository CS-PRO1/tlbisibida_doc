import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tlbisibida_doc/components/custom_text.dart';
import 'package:tlbisibida_doc/constants/constants.dart';
import 'package:tlbisibida_doc/presentation/labs/screens/cubit/labs_cubit.dart';
import 'package:tlbisibida_doc/presentation/labs/screens/cubit/labs_states.dart';
import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:tlbisibida_doc/services/navigation/routes.dart';

class LabsFinanceTable extends StatelessWidget {
  LabsFinanceTable({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LabsCubit, LabsState>(
      listener: (context, state) {
        if (state is LabsError) {
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
        final labsCubit = context.read<LabsCubit>();
        if (state is LabsLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is LabsError) {
          return Center(child: Text('حدث خطأ أثناء تحميل قائمة المخابر'));
        } else if (state is MyLabsLoaded) {
          final labsList = state.myLabs.labsWithAccounts ?? [];
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
                  height: (56 * labsList.length) + 40,
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
                          'اسم المخبر',
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
                      labsList.length,
                      (index) => DataRow(
                        cells: [
                          DataCell(Center(
                              child: CustomText(
                            text: labsList[index].labName ?? '-',
                            size: 14,
                            alignment: TextAlign.center,
                          ))),
                          DataCell(Center(
                              child: CustomText(
                            textDirection: TextDirection.ltr,
                            text: labsList[index].currentAccount?.toString() ?? '-',
                            size: 14,
                            alignment: TextAlign.center,
                          ))),
                          DataCell(Center(
                              child: IconButton(
                            onPressed: () {
                              context.push(labInfoRoute,
                                  extra: labsList[index].labId);
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
