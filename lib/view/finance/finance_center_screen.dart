import 'package:choice/choice.dart';
import 'package:flutter/material.dart';
import 'package:tlbisibida_doc/components/top_nav.dart';
import 'package:tlbisibida_doc/constants/constants.dart';
import 'package:tlbisibida_doc/view/finance/components/tables/clinic_common_finances_table.dart';
import 'package:tlbisibida_doc/view/finance/components/tables/clinic_infrequent_finances_table.dart';
import 'package:tlbisibida_doc/view/finance/components/tables/labs_finance_table.dart';
import 'package:tlbisibida_doc/view/finance/components/tables/patients_finance_table.dart';

class FinanceCenterScreen extends StatelessWidget {
  FinanceCenterScreen({super.key});
  final List _choices = ['المرضى', 'المخابر', 'مصاريف العيادة'];
  final ValueNotifier<String> _financetype = ValueNotifier<String>('المرضى');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(children: [
          SizedBox(
            width: double.infinity,
            child: InlineChoice<String>.single(
                value: _financetype.value,
                onChanged: (value) {
                  _financetype.value = value!;
                  print(_financetype.toString());
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
          AnimatedBuilder(
            animation: _financetype,
            builder: (context, child) => Container(
                clipBehavior: Clip.antiAlias,
                // width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 1.3,
                decoration: BoxDecoration(
                    color: cyan100, borderRadius: BorderRadius.circular(30)),
                child: SingleChildScrollView(
                  child: (_financetype.value == 'المرضى')
                      ? showpatientstable()
                      : (_financetype.value == 'المخابر')
                          ? showlabstable()
                          : showshowclinicstable(),
                )),
          )
        ]),
      ),
    ));
  }

  Widget showpatientstable() {
    return PatientsFinanceTable();
  }

  showlabstable() {
    return LabsFinanceTable();
  }

  showshowclinicstable() {
    final List _clinicChoices = ['متكررة', 'نادرة الشراء'];
    final ValueNotifier<String> _clinicfinancetype =
        ValueNotifier<String>('متكررة');
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: InlineChoice<String>.single(
              value: _clinicfinancetype.value,
              onChanged: (value) {
                _clinicfinancetype.value = value!;
                print(_clinicfinancetype.toString());
              },
              clearable: false,
              itemCount: _clinicChoices.length,
              itemBuilder: (state, i) {
                return ChoiceChip(
                  selectedColor: cyan200,
                  side: const BorderSide(color: cyan300),
                  selected: state.selected(_clinicChoices[i]),
                  onSelected: state.onSelected(_clinicChoices[i]),
                  label: Text(_clinicChoices[i]),
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
        // SizedBox(
        //   height: 20,
        // ),
        AnimatedBuilder(
            animation: _clinicfinancetype,
            builder: (context, child) => _clinicfinancetype.value == 'متكررة'
                ? ClinicCommonFinancesTable()
                : ClinicInfrequentFinancesTable()),
      ],
    );
  }
}
