import 'package:choice/choice.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tlbisibida_doc/constants/constants.dart';
import 'package:tlbisibida_doc/presentation/labs/screens/cubit/labs_cubit.dart';
import 'package:tlbisibida_doc/presentation/labs/screens/cubit/labs_states.dart';
import 'package:tlbisibida_doc/presentation/labs/tables/lab_bills_table.dart';
import 'package:tlbisibida_doc/presentation/labs/tables/lab_cases_table.dart';
import 'package:tlbisibida_doc/presentation/labs/tables/lab_payments_table.dart';

class LabInfoScreen extends StatelessWidget {
  final int labId;
  LabInfoScreen({super.key, required this.labId});
  final List _choices = ['الحالات', 'الفواتير', 'الدفعات'];
  final ValueNotifier<String> _table = ValueNotifier<String>('الحالات');

  // List cases = [
  //   {
  //     'id': 1,
  //     'name': 'محسن التحسيني',
  //     'date': DateTime(2025, 12, 9),
  //   },
  //   {
  //     'id': 2,
  //     'name': 'محسن التحسيني',
  //     'date': DateTime(2025, 12, 9),
  //   },
  //   {
  //     'id': 3,
  //     'name': 'محسن التحسيني',
  //     'date': DateTime(2025, 12, 9),
  //   },
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cyan50,
      body: SingleChildScrollView(
        child: BlocConsumer<LabsCubit, LabsState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            final cubit = context.read<LabsCubit>();
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: cyan100,
                        borderRadius: BorderRadius.circular(20)),
                    //height: MediaQuery.of(context).size.height / 6,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                cubit.currentaccount.toString(),
                                textDirection: TextDirection.ltr,
                                style: TextStyle(
                                    fontSize: 18,
                                    color: cyan600,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                ' :الرصيد',
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                          Text(
                            cubit.unsubscribedLabDetails!.labName!,
                            style: TextStyle(
                                fontSize: 18,
                                color: cyan600,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: InlineChoice<String>.single(
                        value: _table.value,
                        onChanged: (value) {
                          _table.value = value!;
                          print(_table.toString());
                        },
                        clearable: false,
                        itemCount: _choices.length,
                        itemBuilder: (state, i) {
                          return ChoiceChip(
                            selectedColor: cyan200,
                            side: const BorderSide(color: cyan300),
                            selected: state.selected(_choices[i]),
                            onSelected: state.onSelected(_choices[i]),
                            label: Text(_choices[i]),
                          );
                        },
                        listBuilder: ChoiceList.createWrapped(
                            runAlignment: WrapAlignment.center,
                            alignment: WrapAlignment.center,
                            direction: Axis.horizontal,
                            textDirection: TextDirection.rtl,
                            //spacing: 10,
                            //runSpacing: 10,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 5,
                            ))),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    clipBehavior: Clip.antiAlias,
                    width: 400,
                    height: MediaQuery.of(context).size.height / 1.6,
                    decoration: BoxDecoration(
                        color: cyan100,
                        borderRadius: BorderRadius.circular(30)),
                    child: SingleChildScrollView(
                      child: AnimatedBuilder(
                        animation: _table,
                        builder: (context, child) => (_table.value == 'الحالات')
                            ? LabCasesTable()
                            : (_table.value == 'الفواتير')
                                ? LabBillsTable()
                                : LabPaymentsTable(),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
