import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:tlbisibida_doc/constants/constants.dart';
import 'package:tlbisibida_doc/view/inventory/components/bottom_action_buttons.dart';
import 'package:tlbisibida_doc/view/inventory/components/bottom_action_payments_log_buttons.dart';
import 'package:tlbisibida_doc/view/inventory/components/percent_gauge.dart';
import 'package:tlbisibida_doc/view/inventory/components/triangle_card.dart';

Widget itemcard(BuildContext context, Map info, {VoidCallback? onTap}) {
  return Padding(
    padding: const EdgeInsets.only(top: 10.0),
    child: FlipCard(
        fill: Fill
            .fillBack, // Fill the back side of the card to make in the same size as the front.
        direction: FlipDirection.HORIZONTAL, // default
        side: CardSide.FRONT, // The side to initially display.
        front: Card(
          child: SizedBox(
            height: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        info['name'],
                        style: const TextStyle(color: cyan500, fontSize: 18),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: .5,
                        width: 100,
                        color: cyan200,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: percentCircle(context, info),
                      ),
                    ],
                  ),
                ),
                bottomActionPaymentsLogButtons(context),
              ],
            ),
          ),
        ),
        back: Card(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(11.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      info['name'],
                      style: const TextStyle(color: cyan500, fontSize: 18),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: .5,
                      width: 100,
                      color: cyan200,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ClipPath(
                      clipper: TriangleCard(),
                      clipBehavior: Clip.antiAlias,
                      child: Container(
                          height: 170,
                          width: 250,
                          color: cyan50,
                          child: SingleChildScrollView(
                            child: const Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text('سعر العنصر الواحد/قطعة'),
                                Text(
                                  '50.000',
                                  style: TextStyle(color: cyan400),
                                ),
                                Text('تاريخ آخر شراء'),
                                Text(
                                  '2/5/2024',
                                  style: TextStyle(color: cyan300),
                                ),
                                Text('الحد الادنى'),
                                Text('الحد الادنى'),
                                Text('الحد الادنى'),
                                Text('الحد الادنى'),
                                Text('الحد الادنى'),
                                Text('الحد الادنى'),
                                Text('الحد الادنى'),
                                Text('الحد الادنى'),
                                Text('الحد الادنى'),
                                Text('الحد الادنى'),
                                Text('الحد الادنى'),
                                Text('الحد الادنى'),
                                Text('الحد الادنى'),
                                Text('الحد الادنى'),
                                Text('الحد الادنى'),
                                Text('الحد الادنى'),
                                Text('الحد الادنى'),
                                Text('الحد الادنى'),
                                Text('الحد الادنى'),
                                Text(
                                  '50',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color:
                                          Color.fromARGB(255, 228, 132, 132)),
                                ),
                              ],
                            ),
                          )),
                    ),
                  ],
                ),
              ),
              bottomActionButtons(context),
            ],
          ),
        )),
  );
}
