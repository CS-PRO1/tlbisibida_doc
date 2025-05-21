import 'package:choice/choice.dart';
import 'package:flutter/material.dart';
import 'package:tlbisibida_doc/components/top_nav.dart';
import 'package:tlbisibida_doc/constants/constants.dart';
import 'package:tlbisibida_doc/view/statistics/component/inventory_count_chart.dart';
import 'package:tlbisibida_doc/view/statistics/component/monthly_financial_chart.dart';
import 'package:tlbisibida_doc/view/statistics/component/monthly_op_expenses_chart.dart';
import 'package:tlbisibida_doc/view/statistics/component/monthly_patients_chart.dart';
import 'package:tlbisibida_doc/view/statistics/component/monthly_session_type_chart.dart';

class StatisticsScreen extends StatelessWidget {
  StatisticsScreen({super.key});
  final List _choices = ['الارباح', 'العلاجات', 'المرضى', 'المدفوعات'];
  final ValueNotifier<String> _table = ValueNotifier<String>('المدفوعات');
  final List _expChoices = ['التشغيلية', 'المخزن'];
  final ValueNotifier<String> _exptype = ValueNotifier<String>('المخزن');

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: true,
      top: false,
      child: Scaffold(
          // appBar: TopNavigationBar(),
          body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Column(
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
                height: MediaQuery.of(context).size.height / 1.24,
                // width: 1000,
                decoration: BoxDecoration(
                    color: cyan100,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: cyan300)),
                child: AnimatedBuilder(
                  animation: _table,
                  builder: (context, child) => (_table.value == 'المرضى')
                      ? SingleChildScrollView(
                          physics: NeverScrollableScrollPhysics(),
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
                              MonthlyPatientsChart(
                                data: [
                                  MonthlyDataPoint(
                                      month: 'يناير', patients: 515),
                                  MonthlyDataPoint(
                                      month: 'فبراير', patients: 622),
                                  MonthlyDataPoint(
                                      month: 'مارس', patients: 722),
                                  MonthlyDataPoint(
                                      month: 'أبريل', patients: 365),
                                  MonthlyDataPoint(
                                      month: 'مايو', patients: 421),
                                  MonthlyDataPoint(
                                      month: 'يونيو', patients: 592),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 25.0, bottom: 50),
                                child: Container(
                                  width: 200,
                                  height: .5,
                                  color: cyan500,
                                ),
                              ),
                              MonthlyPatientsChart(
                                data: [
                                  MonthlyDataPoint(
                                      month: 'يوليو', patients: 963),
                                  MonthlyDataPoint(
                                      month: 'أغسطس', patients: 763),
                                  MonthlyDataPoint(
                                      month: 'سبتمبر', patients: 542),
                                  MonthlyDataPoint(
                                      month: 'أكتوبر', patients: 762),
                                  MonthlyDataPoint(
                                      month: 'نوفمبر', patients: 545),
                                  MonthlyDataPoint(
                                      month: 'ديسمبر', patients: 223),
                                ],
                              ),
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
                                      child: MonthlyFinancialChart(chartData: [
                                        MonthlyFinancialData(
                                            id: 0,
                                            month: 'يناير',
                                            revenue: 9500,
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
                                            revenue: 7000,
                                            expenses: 7000),
                                        MonthlyFinancialData(
                                            id: 4,
                                            month: 'مايو',
                                            revenue: 6600,
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
                                      child: (MonthlyFinancialChart(chartData: [
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
                                      ]))),
                                ],
                              ),
                            )
                          : (_table.value == 'العلاجات')
                              ? SingleChildScrollView(
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 25.0, bottom: 15),
                                        child: Text(
                                          'عدد المرضى لكل علاج',
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
                                        height: 400,
                                        // width: 300,
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20.0),
                                          child:
                                              MonthlySessionsTypeChart(data: [
                                            TreatmentData(
                                                name: 'Fillings',
                                                values: [
                                                  190,
                                                  250,
                                                  0,
                                                  210,
                                                  240,
                                                  300
                                                ]), // Values for Jan-Jun
                                            TreatmentData(
                                                name: 'Extractions',
                                                values: [
                                                  130,
                                                  180,
                                                  200,
                                                  160,
                                                  190,
                                                  220
                                                ]),
                                            TreatmentData(
                                                name: 'Cleanings',
                                                values: [
                                                  80,
                                                  120,
                                                  150,
                                                  110,
                                                  130,
                                                  160
                                                ]),
                                            TreatmentData(
                                                name: 'Root Canals',
                                                values: [
                                                  50,
                                                  350,
                                                  90,
                                                  0,
                                                  200,
                                                  0
                                                ]), // Example with missing values
                                            TreatmentData(
                                                name: 'Crowns',
                                                values: [
                                                  100,
                                                  110,
                                                  60,
                                                  180,
                                                  290,
                                                  370
                                                ]), // Example with missing values
                                          ], monthLabels: [
                                            'يناير',
                                            'فبراير',
                                            'مارس',
                                            'أبريل',
                                            'مايو',
                                            'يونيو'
                                          ] // Month labels

                                                  ),
                                        ),
                                      ),

                                      //
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 25.0, bottom: 50),
                                        child: Container(
                                          width: 200,
                                          height: .5,
                                          color: cyan500,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 400,
                                        // width: 300,
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20.0),
                                          child:
                                              MonthlySessionsTypeChart(data: [
                                            TreatmentData(
                                                name: 'Fillings',
                                                values: [
                                                  190,
                                                  250,
                                                  0,
                                                  210,
                                                  240,
                                                  300
                                                ]), // Values for Jan-Jun
                                            TreatmentData(
                                                name: 'Extractions',
                                                values: [
                                                  130,
                                                  180,
                                                  200,
                                                  160,
                                                  190,
                                                  220
                                                ]),
                                            TreatmentData(
                                                name: 'Cleanings',
                                                values: [
                                                  80,
                                                  120,
                                                  150,
                                                  110,
                                                  130,
                                                  160
                                                ]),
                                            TreatmentData(
                                                name: 'Root Canals',
                                                values: [
                                                  50,
                                                  350,
                                                  90,
                                                  0,
                                                  200,
                                                  0
                                                ]), // Example with missing values
                                            TreatmentData(
                                                name: 'Crowns',
                                                values: [
                                                  100,
                                                  110,
                                                  60,
                                                  180,
                                                  290,
                                                  370
                                                ]), // Example with missing values
                                          ], monthLabels: [
                                            'يوليو',
                                            'أغسطس',
                                            'سبتمبر',
                                            'أكتوبر',
                                            'نوفمبر',
                                            'ديسمبر',
                                          ] // Month labels

                                                  ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 50,
                                      )
                                      //
                                    ],
                                  ),
                                )
                              : Column(
                                  children: [
                                    Center(
                                      child: SizedBox(
                                        width: double.infinity,
                                        child: InlineChoice<String>.single(
                                            value: _exptype.value,
                                            onChanged: (value) {
                                              _exptype.value = value!;
                                              print(_exptype.toString());
                                            },
                                            clearable: false,
                                            itemCount: _expChoices.length,
                                            itemBuilder: (state, i) {
                                              return ChoiceChip(
                                                selectedColor: cyan200,
                                                side: const BorderSide(
                                                    color: cyan300),
                                                selected: state
                                                    .selected(_expChoices[i]),
                                                onSelected: state
                                                    .onSelected(_expChoices[i]),
                                                label: Text(_expChoices[i]),
                                                showCheckmark: false,
                                              );
                                            },
                                            listBuilder:
                                                ChoiceList.createWrapped(
                                                    runAlignment:
                                                        WrapAlignment.center,
                                                    alignment:
                                                        WrapAlignment.center,
                                                    direction: Axis.horizontal,
                                                    textDirection:
                                                        TextDirection.rtl,
                                                    //spacing: 10,
                                                    //runSpacing: 10,
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                      horizontal: 20,
                                                      vertical: 5,
                                                    ))),
                                      ),
                                    ),
                                    AnimatedBuilder(
                                      animation: _exptype,
                                      builder: (context, child) => (_exptype
                                                  .value ==
                                              'المخزن')
                                          ? Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: SingleChildScrollView(
                                                physics:
                                                    NeverScrollableScrollPhysics(),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 25.0,
                                                              bottom: 15),
                                                      child: Text(
                                                        'مدفوعات المخزن لهذا الشهر',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
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
                                                        height: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height /
                                                            1.7,
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(
                                                                  bottom: 20.0),
                                                          child:
                                                              InventoryCountChart(
                                                            rawChartData: [
                                                              {
                                                                'text': 'أدوات',
                                                                'count': '320',
                                                                'value':
                                                                    874100.0
                                                              },
                                                              {
                                                                'text':
                                                                    'مواد تخدير',
                                                                'count': '10',
                                                                'value':
                                                                    200000.0
                                                              },
                                                              {
                                                                'text': 'قبضات',
                                                                'count': '5',
                                                                'value':
                                                                    400000.0
                                                              },
                                                              {
                                                                'text': 'سنابل',
                                                                'count': '65',
                                                                'value':
                                                                    980000.0
                                                              },
                                                            ],
                                                          ),
                                                        ))
                                                  ],
                                                ),
                                              ))
                                          : Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 25.0,
                                                            bottom: 15),
                                                    child: Text(
                                                      'مدفوعات هذا الشهر',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
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
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height /
                                                              1.7,
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(
                                                                bottom: 20.0),
                                                        child:
                                                            MonthlyOpExpensesChart(),
                                                      ))
                                                ],
                                              )),
                                    )
                                  ],
                                ),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
