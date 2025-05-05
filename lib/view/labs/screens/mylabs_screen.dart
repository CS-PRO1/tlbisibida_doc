import 'package:choice/choice.dart';
import 'package:flutter/material.dart';
import 'package:tlbisibida_doc/constants/constants.dart';
import 'package:tlbisibida_doc/services/navigation/locator.dart';
import 'package:tlbisibida_doc/services/navigation/navigation_service.dart';
import 'package:tlbisibida_doc/services/navigation/routes.dart';
import 'package:tlbisibida_doc/view/labs/components/carousel_labs.dart';
import 'package:tlbisibida_doc/view/labs/tables/lab_bills_table.dart';
import 'package:tlbisibida_doc/view/labs/tables/lab_cases_table.dart';
import 'package:tlbisibida_doc/view/labs/tables/lab_payments_table.dart';


class MylabsScreen extends StatelessWidget {
  MylabsScreen({super.key});
  final List _choices = ['الحالات', 'الفواتير', 'الدفعات'];
  final ValueNotifier<String> _table = ValueNotifier<String>('الحالات');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        // physics: NeverScrollableScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 250,
                child: CarouselLabs(),
              ),
              Container(
                clipBehavior: Clip.antiAlias,
                width: 400,
                height: 430,
                decoration: BoxDecoration(
                    color: cyan100, borderRadius: BorderRadius.circular(30)),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
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
                      SingleChildScrollView(
                        child: AnimatedBuilder(
                          animation: _table,
                          builder: (context, child) =>
                              (_table.value == 'الحالات')
                                  ? LabCasesTable()
                                  : (_table.value == 'الفواتير')
                                      ? LabBillsTable()
                                      : LabPaymentsTable(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          locator<NavigationService>().navigateTo(labsListRoute);
        },
        mini: true,
        backgroundColor: cyan400,
        foregroundColor: white,
        shape: RoundedRectangleBorder(
            side: BorderSide(color: cyan600, width: 1.5),
            borderRadius: BorderRadius.circular(10)),
        child: Icon(
          Icons.add,
          size: 28,
        ),
      ),
    );
  }
}
