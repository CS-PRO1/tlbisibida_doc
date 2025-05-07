import 'package:choice/choice.dart';
import 'package:flutter/material.dart';
import 'package:tlbisibida_doc/components/top_nav.dart';
import 'package:tlbisibida_doc/constants/constants.dart';
import 'package:tlbisibida_doc/view/statistics/component/bar_chart.dart';
import 'package:tlbisibida_doc/view/statistics/component/donut_chart.dart';
import 'package:tlbisibida_doc/view/statistics/component/line_chart%20sec.dart';
import 'package:tlbisibida_doc/view/statistics/component/line_chart.dart';

class StatisticsScreen extends StatelessWidget {
  StatisticsScreen({super.key});
  final List _choices = ['الارباح', 'المخزن', 'عدد المرضى', 'مدفوعات'];
  final ValueNotifier<String> _table = ValueNotifier<String>('مدفوعات');

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: true,
      top: false,
      child: Scaffold(
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
                            ? SingleChildScrollView(
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 25.0, bottom: 15),
                                      child: Text(
                                        'الربح الشهري',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: cyan600),
                                      ),
                                    ),
                                    Container(
                                      height: .5,
                                      width: 130,
                                      color: cyan600,
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height /
                                                2.5,
                                        child:
                                            OverlayFinancialChart(chartData: [
                                          MonthlyFinancialData(
                                              id: 0,
                                              month: 'يناير',
                                              revenue: 1000,
                                              expenses: 5500),
                                          MonthlyFinancialData(
                                              id: 1,
                                              month: 'فبراير',
                                              revenue: 3500,
                                              expenses: 5500),
                                          MonthlyFinancialData(
                                              id: 2,
                                              month: 'مارس',
                                              revenue: 6000,
                                              expenses: 4000),
                                          MonthlyFinancialData(
                                              id: 3,
                                              month: 'ابريل',
                                              revenue: 4000,
                                              expenses: 7000),
                                          MonthlyFinancialData(
                                              id: 4,
                                              month: 'مايو',
                                              revenue: 4000,
                                              expenses: 6500),
                                          MonthlyFinancialData(
                                              id: 5,
                                              month: 'يونيو',
                                              revenue: 6000,
                                              expenses: 6500),
                                          // MonthlyFinancialData(
                                          //     id: 3, month: 'Apr', revenue: 400000, expenses: 650000),
                                          // MonthlyFinancialData(
                                          //     id: 3, month: 'Apr', revenue: 400000, expenses: 650000),
                                        ])),
                                    SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height /
                                                2.5,
                                        child:
                                            (OverlayFinancialChart(chartData: [
                                          MonthlyFinancialData(
                                              id: 0,
                                              month: 'يوليو',
                                              revenue: 1000,
                                              expenses: 5500),
                                          MonthlyFinancialData(
                                              id: 1,
                                              month: 'اغسطس',
                                              revenue: 3500,
                                              expenses: 5500),
                                          MonthlyFinancialData(
                                              id: 2,
                                              month: 'سبتمبر',
                                              revenue: 6000,
                                              expenses: 4000),
                                          MonthlyFinancialData(
                                              id: 3,
                                              month: 'اكتوبر',
                                              revenue: 4000,
                                              expenses: 7000),
                                          MonthlyFinancialData(
                                              id: 4,
                                              month: 'نوفمبر',
                                              revenue: 4000,
                                              expenses: 6500),
                                          MonthlyFinancialData(
                                              id: 5,
                                              month: 'ديسمبر',
                                              revenue: 6000,
                                              expenses: 6500),
                                          // MonthlyFinancialData(
                                          //     id: 3, month: 'Apr', revenue: 400000, expenses: 650000),
                                          // MonthlyFinancialData(
                                          //     id: 3, month: 'Apr', revenue: 400000, expenses: 650000),
                                        ]))),
                                  ],
                                ),
                              )
                            : (_table.value == 'المخزن')
                                ? Text('')
                                : Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: SingleChildScrollView(
                                      physics: NeverScrollableScrollPhysics(),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 25.0, bottom: 15),
                                            child: Text(
                                              'مدفوعات هذا الشهر',
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
                                          SizedBox(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  1.7,
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    bottom: 20.0),
                                                child: PieChartSample2(),
                                              ))
                                        ],
                                      ),
                                    )),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
