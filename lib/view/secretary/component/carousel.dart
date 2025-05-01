import 'dart:ui';

import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tlbisibida_doc/components/default_button.dart';
import 'package:tlbisibida_doc/components/default_textfield.dart';
import 'package:tlbisibida_doc/constants/constants.dart';
import 'package:tlbisibida_doc/view/secretary/component/bottom_action_buttons%20_sec.dart';
import 'package:tlbisibida_doc/view/secretary/component/delete_sec_button.dart';

final List<Map> imgList = [
  {
    'name': 'اسماعيل احمد كنباوي',
    'address': 'شارع بغداد',
    'number': '0995996997',
    'email': 'esmaeelahmadkanabawi@gmail.com',
    'is_male': true,
    'is_day_shift': false,
  },
  {
    'name': 'سميحة السمحاني',
    'address': 'باب شرقي',
    'number': '0995911154',
    'email': 'same7aalsam7ani@gmail.com',
    'is_male': false,
    'is_day_shift': true,
  },
//   'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
//   'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
//   'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
//   'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
//   'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
//   'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
];
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
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: item['is_day_shift']
                            ? AssetImage('assets/sec/bg_day.png')
                            : AssetImage('assets/sec/bg_night.png'))),
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      bottom: 0.0,
                      left: 0.0,
                      right: 0.0,
                      child: Container(
                        // clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              // Color.fromARGB(200, 0, 0, 0),
                              item['is_day_shift']
                                  ? Color.fromARGB(200, 0, 0, 0)
                                  : const Color.fromARGB(200, 18, 124, 113),
                              Color.fromARGB(0, 0, 0, 0)
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                        ),
                        padding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                        child: Column(
                          children: [
                            Text(
                              item['name'],
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  item['number'],
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14.0,
                                    // fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Container(
                                  width: .5,
                                  height: 14,
                                  color: white,
                                ),
                                Text(
                                  item['address'],
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16.0,
                                    // fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              item['email'],
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12.0,
                                // fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            back: Card(
              shadowColor: cyan300,
              clipBehavior: Clip.antiAlias,
              child: Container(
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: item['is_day_shift']
                            ? AssetImage('assets/sec/bg_day.png')
                            : AssetImage('assets/sec/bg_night.png'))),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        bottom: 0.0,
                        left: 0.0,
                        right: 0.0,
                        child: Container(
                          // clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                const Color.fromARGB(200, 0, 0, 0),
                                Color.fromARGB(0, 0, 0, 0)
                              ],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                            ),
                          ),
                          // padding: EdgeInsets.symmetric(
                          //     vertical: 10.0, horizontal: 20.0),
                          child: Column(
                            children: [
                              Text(
                                'تعديل المعلومات',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  // fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                height: .5,
                                width: 100,
                                color: cyan50,
                                margin: const EdgeInsets.symmetric(vertical: 5),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              SizedBox(
                                height: 380,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    SizedBox(
                                      width: 250,
                                      child: defaultTextField(
                                          itemstandardquantitycontroller,
                                          context,
                                          'الاسم',
                                          style: TextStyle(color: white)),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    SizedBox(
                                      width: 250,
                                      child: defaultTextField(
                                          itemstandardquantitycontroller,
                                          context,
                                          'العنوان',
                                          style: TextStyle(color: white)),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    SizedBox(
                                      width: 250,
                                      child: defaultTextField(
                                          itemstandardquantitycontroller,
                                          context,
                                          'الرقم',
                                          style: TextStyle(color: white)),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    SizedBox(
                                      width: 250,
                                      child: defaultTextField(
                                          itemstandardquantitycontroller,
                                          context,
                                          'الايميل',
                                          style: TextStyle(color: white)),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      height: 50,
                                      width: 200,
                                      decoration: BoxDecoration(
                                          // color: white,
                                          border: Border.all(
                                              color: white, width: .5),
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            IconButton(
                                                onPressed: () {},
                                                icon: Icon(
                                                  CupertinoIcons.sun_max_fill,
                                                  color: Colors.amber[200],
                                                )),
                                            Container(
                                              width: .5,
                                              height: 14,
                                              color: white,
                                            ),
                                            IconButton(
                                                onPressed: () {},
                                                icon: Icon(
                                                  CupertinoIcons
                                                      .moon_stars_fill,
                                                  color: white,
                                                )),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              bottomActionButtonsSec(context),
                              // defaultButton(
                              //     text: 'تم',
                              //     function: () {
                              //       // Navigator.of(context).pop();
                              //     }),
                              // const SizedBox(
                              //   height: 10,
                              // ),
                              // deleteSecButton(
                              //   context,
                              // ),

                              // Text(
                              //   item['address'],
                              //   style: TextStyle(
                              //     color: Colors.white,
                              //     fontSize: 20.0,
                              //     fontWeight: FontWeight.bold,
                              //   ),
                              // ),
                              // SizedBox(
                              //   height: 20,
                              // ),
                              // Text(
                              //   item['number'],
                              //   style: TextStyle(
                              //     color: Colors.white,
                              //     fontSize: 20.0,
                              //     fontWeight: FontWeight.bold,
                              //   ),
                              // ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }))
    .toList();

class Carousel extends StatelessWidget {
  const Carousel({super.key});

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
                autoPlay: false,
                enlargeCenterPage: true,
                aspectRatio: 0.720,
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
