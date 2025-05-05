import 'package:choice/choice.dart';
import 'package:flutter/material.dart';
import 'package:tlbisibida_doc/components/tusk_icons.dart';
import 'package:tlbisibida_doc/constants/constants.dart';

class StatisticsScreen extends StatelessWidget {
  StatisticsScreen({super.key});
  final List _choices = ['الارباح', 'المخزن', 'عدد المرضى', 'مدفوعات متكررة'];
  final ValueNotifier<String> _table = ValueNotifier<String>('الحالات');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: cyan300,
      child: Center(
        child: SizedBox(
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
      ),
    ));
  }
}
