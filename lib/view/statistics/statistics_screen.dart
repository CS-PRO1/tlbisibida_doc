import 'package:choice/choice.dart';
import 'package:flutter/material.dart';
import 'package:tlbisibida_doc/components/top_nav.dart';
import 'package:tlbisibida_doc/constants/constants.dart';
import 'package:tlbisibida_doc/view/statistics/component/line_chart%20sec.dart';
import 'package:tlbisibida_doc/view/statistics/component/line_chart.dart';

class StatisticsScreen extends StatelessWidget {
  StatisticsScreen({super.key});
  final List _choices = ['الارباح', 'المخزن', 'عدد المرضى', 'مدفوعات'];
  final ValueNotifier<String> _table = ValueNotifier<String>('عدد المرضى');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: TopNavigationBar(),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Center(
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
                        showCheckmark: false,
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
            SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height / 1.4,
                // width: 1000,
                decoration: BoxDecoration(
                    color: cyan100,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: cyan300)),
                child: AnimatedBuilder(
                  animation: _table,
                  builder: (context, child) => (_table.value == 'عدد المرضى')
                      ? SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 25.0, bottom: 15),
                                child: Text(
                                  'عدد المرضى شهريا',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: cyan600),
                                ),
                              ),
                              Container(
                                height: .5,
                                width: 200,
                                color: cyan600,
                              ),
                              SizedBox(
                                height: 50,
                              ),
                              LineChartSample5(),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 25.0, bottom: 50),
                                child: Container(
                                  width: 200,
                                  height: .5,
                                  color: cyan500,
                                ),
                              ),
                              LineChartSample50(),
                            ],
                          ),
                        )
                      : (_table.value == 'الارباح')
                          ? LineChartSample5()
                          : (_table.value == 'المخزن')
                              ? LineChartSample5()
                              : LineChartSample5(),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            )
          ],
        ));
  }
}
