import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tlbisibida_doc/components/custom_text.dart';
import 'package:tlbisibida_doc/constants/constants.dart';
import 'package:tlbisibida_doc/presentation/labs/screens/cubit/labs_cubit.dart';
import 'package:tlbisibida_doc/services/navigation/routes.dart';

class LabsFinanceTable extends StatelessWidget {
  LabsFinanceTable({super.key});
  int count = 10;
  @override
  Widget build(BuildContext context) {
    final labsCubit = context.read<LabsCubit>();
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
                count,
                (index) => DataRow(
                  cells: [
                    DataCell(Center(
                        child: CustomText(
                      text: labsCubit
                          .myLabsIamJoind!.labsWithAccounts![index].labName!,
                      size: 14,
                      alignment: TextAlign.center,
                    ))),
                    DataCell(Center(
                        child: CustomText(
                      textDirection: TextDirection.ltr,
                      text: labsCubit.myLabsIamJoind!.labsWithAccounts![index]
                          .currentAccount
                          .toString(),
                      size: 14,
                      alignment: TextAlign.center,
                    ))),
                    DataCell(Center(
                        child: IconButton(
                      onPressed: () {
                        // locator<NavigationService>().navigateTo(labInfoRoute);
                        // Navigator.pushNamed(context, labInfoRoute);
                        context.push(labInfoRoute,
                            extra: labsCubit.myLabsIamJoind!
                                .labsWithAccounts![index].labId);
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
