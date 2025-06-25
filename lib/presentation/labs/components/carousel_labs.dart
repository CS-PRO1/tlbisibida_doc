import 'package:carousel_slider/carousel_slider.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:tlbisibida_doc/components/tusk_icons.dart';
import 'package:tlbisibida_doc/constants/constants.dart';

final List<Map> imgList = [
  {
    'name': 'مخبر الحموي',
    'icon': Icon(
      TuskIcons.lab_icon,
      size: 100,
      color: cyan500,
    ),
    'credit': 5000000,
  },
  {
    'name': 'مخبر الحموي',
    'icon': Icon(
      TuskIcons.lab_icon,
      size: 100,
      color: cyan500,
    ),
    'credit': -5000000,
  },
];

// final List _choices = ['الحالات', 'الفواتير', 'الدفعات'];
// final ValueNotifier<String> _table = ValueNotifier<String>('الحالات');

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
                  child: Container(
                    height: 170,
                    decoration: BoxDecoration(
                        border: Border.all(width: .5, color: cyan200),
                        // color: cyan100,
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            'الرصيد الحالي',
                            style: TextStyle(fontSize: 16, color: cyan400),
                          ),
                          // SizedBox(
                          //   height: 30,
                          // ),
                          Text(
                            item['credit'].toString(),
                            style: TextStyle(
                                fontSize: 14,
                                color: item['credit'] >= 0 ? cyan600 : redmid,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
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
                autoPlay: false,
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
