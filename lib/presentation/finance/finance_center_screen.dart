import 'package:choice/choice.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tlbisibida_doc/constants/constants.dart';
import 'package:tlbisibida_doc/presentation/finance/components/dialogs/add_inf_button.dart';
import 'package:tlbisibida_doc/presentation/finance/components/dialogs/add_op_button.dart';
import 'package:tlbisibida_doc/presentation/finance/components/tables/clinic_common_finances_table.dart';
import 'package:tlbisibida_doc/presentation/finance/components/tables/clinic_infrequent_finances_table.dart';
import 'package:tlbisibida_doc/presentation/finance/components/tables/clinic_op_finances_table.dart';
import 'package:tlbisibida_doc/presentation/finance/components/tables/labs_finance_table.dart';
import 'package:tlbisibida_doc/presentation/finance/components/tables/patients_finance_table.dart';
import 'package:tlbisibida_doc/presentation/labs/screens/cubit/labs_cubit.dart';
import 'package:tlbisibida_doc/presentation/labs/screens/cubit/labs_states.dart';
import 'package:tlbisibida_doc/presentation/patients/cubits/patient_states.dart';
import 'package:tlbisibida_doc/presentation/patients/cubits/patients_cubit.dart';

class FinanceCenterScreen extends StatelessWidget {
  FinanceCenterScreen({super.key});
  final List _choices = [
    'المرضى',
    'المخابر',
    'مصاريف العيادة',
  ];
  final ValueNotifier<String> _financetype = ValueNotifier<String>('المرضى');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocConsumer<PatientsCubit, PatientsState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        final patientsCubit = context.read<PatientsCubit>();
        return BlocConsumer<LabsCubit, LabsState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            final labsCubit = context.read<LabsCubit>();
            return Padding(
              padding: EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                physics: NeverScrollableScrollPhysics(),
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
                        height: MediaQuery.of(context).size.height / 1.52,
                        decoration: BoxDecoration(
                            color: cyan100,
                            borderRadius: BorderRadius.circular(30)),
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
            );
          },
        );
      },
    ));
  }

  Widget showpatientstable() {
    return PatientsFinanceTable();
  }

  showlabstable() {
    return LabsFinanceTable();
  }

  showshowclinicstable() {
    final List clinicChoices = [
      'المخزن',
      'تشغيلية',
      'نادرة الشراء',
    ];
    final ValueNotifier<String> clinicfinancetype =
        ValueNotifier<String>('المخزن');
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: InlineChoice<String>.single(
              value: clinicfinancetype.value,
              onChanged: (value) {
                clinicfinancetype.value = value!;
                print(clinicfinancetype.toString());
              },
              clearable: false,
              itemCount: clinicChoices.length,
              itemBuilder: (state, i) {
                return ChoiceChip(
                  selectedColor: cyan200,
                  side: const BorderSide(color: cyan300),
                  selected: state.selected(clinicChoices[i]),
                  onSelected: state.onSelected(clinicChoices[i]),
                  label: Text(clinicChoices[i]),
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
            animation: clinicfinancetype,
            builder: (context, child) => clinicfinancetype.value == 'المخزن'
                ? ClinicCommonFinancesTable()
                : clinicfinancetype.value == 'تشغيلية'
                    ? Column(
                        children: [
                          SizedBox(
                              height: MediaQuery.of(context).size.height / 1.88,
                              child: SingleChildScrollView(
                                  child: ClinicOpFinancesTable())),
                          addOpButton(context),
                        ],
                      )
                    : Column(
                        children: [
                          SizedBox(
                              height: MediaQuery.of(context).size.height / 1.88,
                              child: SingleChildScrollView(
                                  child: ClinicInfrequentFinancesTable())),
                          addInFButton(context)
                        ],
                      )),
      ],
    );
  }
}
