import 'package:flip_card/flip_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:tlbisibida_doc/components/float_button.dart';
import 'package:tlbisibida_doc/components/top_nav.dart';
import 'package:tlbisibida_doc/constants/constants.dart';
import 'package:tlbisibida_doc/view/patients/add_patient_dialog%20.dart';
import 'package:tlbisibida_doc/view/patients/buttom_action_buttons.dart';

class PatientsListScreen extends StatelessWidget {
  PatientsListScreen({super.key});

  List<Map> info = [
    {
      'name': 'اسماعيل احمد كنباوي',
      'age': '2010',
      'number': '0995996997',
      'is_smoker': false,
    },
    {
      'name': 'عثمان عبد الجليل ششه',
      'age': '2001',
      'number': '0995886887',
      'is_smoker': true,
    },
    {
      'name': 'اسماعيل احمد كنباوي',
      'age': '2010',
      'number': '0995996997',
      'is_smoker': false,
    },
    {
      'name': 'عثمان عبد الجليل ششه',
      'age': '2001',
      'number': '0995886887',
      'is_smoker': true,
    },
    {
      'name': 'اسماعيل احمد كنباوي',
      'age': '2010',
      'number': '0995996997',
      'is_smoker': false,
    },
    {
      'name': 'عثمان عبد الجليل ششه',
      'age': '2001',
      'number': '0995886887',
      'is_smoker': true,
    },
    {
      'name': 'اسماعيل احمد كنباوي',
      'age': '2010',
      'number': '0995996997',
      'is_smoker': false,
    },
    {
      'name': 'عثمان عبد الجليل ششه',
      'age': '2001',
      'number': '0995886887',
      'is_smoker': true,
    },
    {
      'name': 'اسماعيل احمد كنباوي',
      'age': '2010',
      'number': '0995996997',
      'is_smoker': false,
    },
    {
      'name': 'عثمان عبد الجليل ششه',
      'age': '2001',
      'number': '0995886887',
      'is_smoker': true,
    },
    {
      'name': 'اسماعيل احمد كنباوي',
      'age': '2010',
      'number': '0995996997',
      'is_smoker': false,
    },
    {
      'name': 'عثمان عبد الجليل ششه',
      'age': '2001',
      'number': '0995886887',
      'is_smoker': true,
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cyan50,
      appBar: TopNavigationBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SizedBox(
          width: 600,
          child: GridView.count(
              childAspectRatio: .9,
              shrinkWrap: true,
              crossAxisCount: 2,
              crossAxisSpacing: 7,
              mainAxisSpacing: 7,
              children: List.generate(
                      info.length,
                      (index) => itemcard(context, info, index, onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        PatientsListScreen()));
                          }))
                  .animate(
                    interval: const Duration(milliseconds: 50),
                  )
                  .slide(duration: const Duration(milliseconds: 300))
                  .fadeIn(
                      curve: Curves.easeInOut,
                      duration: const Duration(milliseconds: 250))
                  .flip(duration: const Duration(milliseconds: 200))),
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
        child: Icon(
          Icons.add,
          size: 28,
        ),
        mini: true,
        backgroundColor: cyan400,
        foregroundColor: white,
        shape: RoundedRectangleBorder(
            side: BorderSide(color: cyan600, width: 1.5),
            borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}

Widget itemcard(BuildContext context, List info, int index,
    {VoidCallback? onTap}) {
  return FlipCard(
    fill: Fill
        .fillBack, // Fill the back side of the card to make in the same size as the front.
    direction: FlipDirection.HORIZONTAL, // default
    side: CardSide.FRONT, // The side to initially display.
    front: Card(
      clipBehavior: Clip.antiAlias,
      color: white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(
            height: 5,
          ),
          Text(
            info[index]['name'],
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                CupertinoIcons.phone_circle_fill,
                size: 16,
                color: cyan500,
              ),
              SizedBox(
                width: 7,
              ),
              Text(
                info[index]['number'],
                style: const TextStyle(color: cyan400, fontSize: 16),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          bottomActionButton(context),
        ],
      ),
    ),

    back: Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(
            height: 5,
          ),
          Text(
            info[index]['age'],
            style: const TextStyle(color: cyan400, fontSize: 18),
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
          info[index]['is_smoker']
              ? Icon(
                  Icons.smoking_rooms_rounded,
                  color: redmain,
                )
              : Icon(
                  Icons.smoke_free_rounded,
                  color: cyan300,
                ),
          // info[index]['icon'],
          const SizedBox(
            height: 5,
          ),
        ],
      ),
    ),
  );
}
