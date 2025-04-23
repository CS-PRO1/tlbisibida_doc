import 'package:flip_card/flip_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:searchable_listview/searchable_listview.dart';
import 'package:tlbisibida_doc/components/top_nav.dart';
import 'package:tlbisibida_doc/constants/constants.dart';
import 'package:tlbisibida_doc/view/patients/components/dialogs/add_patient_dialog%20.dart';
import 'package:tlbisibida_doc/view/patients/buttom_action_buttons.dart';
import 'package:tlbisibida_doc/view/patients/patients_list_screen.dart';
import 'package:tlbisibida_doc/view/patients/sub_action_buttons%20copy.dart';

// ignore: must_be_immutable
class InventoryScreen extends StatelessWidget {
  InventoryScreen({super.key});

  List<Map> info = [
    {
      'name': 'أدوات',
      'sub1': 'سنابل',
      'sub2': 'مرايا',
      //   'age': '2010',
      //   'number': '0995996997',
      //   'is_smoker': false,
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cyan50,
      appBar: TopNavigationBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SearchableList(
          shrinkWrap: true,
          displaySearchIcon: true,
          initialList: info,
          itemBuilder: (info) => itemcard(context, info),
          filter: (value) => info
              .where(
                (element) => element['name'].contains(value),
              )
              .toList(),
          emptyWidget: const Center(
            child: Text('لم يتم العثور على نتيجة'),
          ),
          inputDecoration: InputDecoration(
              labelText: "ابحث عن تصنيف رئيسي",
              fillColor: Colors.white,
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.grey, width: 2.0),
                //  borderRadius: StandardBorderRadius
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: cyan300, width: 3.0),
                // borderRadius: ActiveBorderRadius,
              ),
              errorBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(color: Colors.redAccent, width: 2.0),
                // borderRadius: ActiveBorderRadius,
              )),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return addPatientDialog(context);
            },
          );
        },
        mini: true,
        backgroundColor: cyan400,
        foregroundColor: white,
        shape: RoundedRectangleBorder(
            side: const BorderSide(color: cyan600, width: 1.5),
            borderRadius: BorderRadius.circular(10)),
        child: const Icon(
          Icons.add,
          size: 28,
        ),
      ),
    );
  }
}

Widget itemcard(BuildContext context, Map info, {VoidCallback? onTap}) {
  return FlipCard(
    fill: Fill
        .fillBack, // Fill the back side of the card to make in the same size as the front.
    direction: FlipDirection.HORIZONTAL, // default
    side: CardSide.FRONT, // The side to initially display.
    front: Card(
      clipBehavior: Clip.antiAlias,
      color: white,
      child: Container(
        height: 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(
              height: 5,
            ),
            Text(
              info['name'],
              style: const TextStyle(
                  color: cyan400, fontSize: 18, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              height: .5,
              width: 100,
              color: cyan600,
            ),
            const SizedBox(
              height: 5,
            ),
            const SizedBox(
              height: 5,
            ),
            bottomActionButton(context),
          ],
        ),
      ),
    ),

    back: Card(
      child: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.,
          children: [
            const SizedBox(
              height: 5,
            ),
            subcatActionButton(context, info['sub1']),
            // Text(
            //  ,
            //   style: const TextStyle(color: cyan400, fontSize: 18),
            // ),
            const SizedBox(
              height: 5,
            ),
            subcatActionButton(context, info['sub2']),
            // Text(
            //   info['sub2'],
            //   style: const TextStyle(color: cyan400, fontSize: 18),
            // ),
            Container(
              height: .5,
              width: 100,
              color: cyan600,
            ),
            const SizedBox(
              height: 5,
            ),
            // info['is_smoker']
            //     ? Icon(
            //         Icons.smoking_rooms_rounded,
            //         color: redmain,
            //       )
            //     : Icon(
            //         Icons.smoke_free_rounded,
            //         color: cyan300,
            //       ),
            // info[index]['icon'],

            // const SizedBox(
            //   height: 5,
            // ),
            bottomActionButton(context),
          ],
        ),
      ),
    ),
  );
}
