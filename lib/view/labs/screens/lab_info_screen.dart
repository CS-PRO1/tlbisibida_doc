import 'package:choice/choice.dart';
import 'package:flutter/material.dart';
import 'package:tlbisibida_doc/constants/constants.dart';
import 'package:tlbisibida_doc/view/labs/tables/lab_bills_table.dart';
import 'package:tlbisibida_doc/view/labs/tables/lab_cases_table.dart';
import 'package:tlbisibida_doc/view/labs/tables/lab_payments_table.dart';

class LabInfoScreen extends StatelessWidget {
  LabInfoScreen({super.key});
  final List _choices = ['الحالات', 'الفواتير', 'الدفعات'];
  final ValueNotifier<String> _table = ValueNotifier<String>('الحالات');

  List cases = [
    {
      'id': 1,
      'name': 'محسن التحسيني',
      'date': DateTime(2025, 12, 9),
    },
    {
      'id': 2,
      'name': 'محسن التحسيني',
      'date': DateTime(2025, 12, 9),
    },
    {
      'id': 3,
      'name': 'محسن التحسيني',
      'date': DateTime(2025, 12, 9),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cyan50,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                    color: cyan100, borderRadius: BorderRadius.circular(20)),
                //height: MediaQuery.of(context).size.height / 6,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '-600,000',
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
                        'مخبر الحموي',
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
                    color: cyan100, borderRadius: BorderRadius.circular(30)),
                child: SingleChildScrollView(
                  child: AnimatedBuilder(
                    animation: _table,
                    builder: (context, child) => (_table.value == 'الحالات')
                        ? LabCasesTable(
                            data: cases,
                          )
                        : (_table.value == 'الفواتير')
                            ? LabBillsTable()
                            : LabPaymentsTable(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
