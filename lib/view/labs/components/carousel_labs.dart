import 'dart:ui';

import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:choice/choice.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tlbisibida_doc/components/default_button.dart';
import 'package:tlbisibida_doc/components/default_textfield.dart';
import 'package:tlbisibida_doc/components/tusk_icons.dart';
import 'package:tlbisibida_doc/constants/constants.dart';
import 'package:tlbisibida_doc/view/labs/tables/lab_bills_table.dart';
import 'package:tlbisibida_doc/view/labs/tables/lab_cases_table.dart';
import 'package:tlbisibida_doc/view/labs/tables/lab_payments_table.dart';
import 'package:tlbisibida_doc/view/secretary/component/bottom_action_buttons%20_sec.dart';
import 'package:tlbisibida_doc/view/secretary/component/delete_sec_button.dart';

final List<Map> imgList = [
  {
    'name': 'مخبر الحموي',
    'icon': Icon(
      TuskIcons.lab_icon,
      size: 100,
      color: cyan500,
    ),
  },
  {
    'name': 'مخبر الحموي',
    'icon': Icon(
      TuskIcons.lab_icon,
      size: 100,
      color: cyan500,
    ),
  },
];

final List _choices = ['الحالات', 'الفواتير', 'الدفعات'];
final ValueNotifier<String> _table = ValueNotifier<String>('الحالات');

TextEditingController itemstandardquantitycontroller = TextEditingController();
final List<Widget> imageSliders = imgList
    .map((item) => Builder(builder: (context) {
          return FlipCard(
            fill: Fill
                .fillBack, // Fill the back side of the card to make in the same size as the front.
            direction: FlipDirection.HORIZONTAL, // default
            side: CardSide.FRONT,
            front: Card(
              shadowColor: cyan300,
              clipBehavior: Clip.antiAlias,
              child: Container(
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(),
                padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    item['icon'],
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      item['name'],
                      style: TextStyle(
                        color: cyan500,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            back: Card(
              shadowColor: cyan300,
              clipBehavior: Clip.antiAlias,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    //mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: cyan100,
                            borderRadius: BorderRadius.circular(20)),
                        //height: MediaQuery.of(context).size.height / 6,
                        // child: Padding(
                        //   padding: const EdgeInsets.all(16.0),
                        //   child: Column(
                        //     children: [
                        //       const Row(
                        //         mainAxisAlignment:
                        //             MainAxisAlignment.spaceAround,
                        //         children: [
                        //           Row(
                        //             mainAxisAlignment:
                        //                 MainAxisAlignment.spaceBetween,
                        //             children: [
                        //               Text(
                        //                 '-600,000',
                        //                 style: TextStyle(
                        //                     fontSize: 18,
                        //                     color: cyan600,
                        //                     fontWeight: FontWeight.bold),
                        //               ),
                        //               Text(
                        //                 ' :الرصيد',
                        //                 style: TextStyle(fontSize: 16),
                        //               ),
                        //             ],
                        //           ),
                        //           Text(
                        //             'مخبر الحموي',
                        //             style: TextStyle(
                        //                 fontSize: 18,
                        //                 color: cyan600,
                        //                 fontWeight: FontWeight.bold),
                        //           ),
                        //         ],
                        //       ),
                        //     ],
                        //   ),
                        // ),
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
                        child: SingleChildScrollView(
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
                        width: 400,
                        height: MediaQuery.of(context).size.height / 1.6,
                        decoration: BoxDecoration(
                            color: cyan100,
                            borderRadius: BorderRadius.circular(30)),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }))
    .toList();

class CarouselLabs extends StatelessWidget {
  const CarouselLabs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CarouselWithIndicatorDemo(),
    );
  }
}

class CarouselWithIndicatorDemo extends StatefulWidget {
  const CarouselWithIndicatorDemo({super.key});

  @override
  State<StatefulWidget> createState() {
    return _CarouselWithIndicatorState();
  }
}

class _CarouselWithIndicatorState extends State<CarouselWithIndicatorDemo> {
  int _current = 0;
  final CarouselSliderController _controller = CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Expanded(
          child: CarouselSlider(
            items: imageSliders,
            carouselController: _controller,
            options: CarouselOptions(
                autoPlay: true,
                enlargeCenterPage: true,
                aspectRatio: 0.990,
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                  });
                }),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: imgList.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => _controller.animateToPage(entry.key),
              child: Container(
                width: 10.0,
                height: 20,
                margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: (Theme.of(context).brightness == Brightness.dark
                            ? cyan200
                            : cyan500)
                        .withOpacity(_current == entry.key ? 0.9 : 0.28)),
              ),
            );
          }).toList(),
        ),
      ]),
    );
  }
}
