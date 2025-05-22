import 'package:choice/choice.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tlbisibida_doc/constants/constants.dart'; // Assuming constants.dart contains color definitions

import 'package:tlbisibida_doc/services/navigation/routes.dart';
// import 'package:tlbisibida_doc/view/labs/components/carousel_labs.dart';
import 'package:tlbisibida_doc/view/labs/tables/lab_bills_table.dart';
import 'package:tlbisibida_doc/view/labs/tables/lab_cases_table.dart';
import 'package:tlbisibida_doc/view/labs/tables/lab_payments_table.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flip_card/flip_card.dart';
import 'package:tlbisibida_doc/components/tusk_icons.dart'; // Assuming this contains TuskIcons.lab_icon

// Define the list of labs for the carousel
final List<Map> imgList = [
  {
    'name': 'مخبر الحموي',
    'icon': Icon(
      TuskIcons.lab_icon, // Using the icon from your components
      size: 100,
      color: cyan500, // Using colors from your constants
    ),
    'credit': 5000000,
    'cases': [
      {
        'id': 1,
        'name': 'تحسين التحسيني',
        'date': DateTime(2025, 5, 5),
      },
      {
        'id': 2,
        'name': 'تحسين التحسيني',
        'date': DateTime(2025, 5, 5),
      },
      {
        'id': 3,
        'name': 'تحسين التحسيني',
        'date': DateTime(2025, 5, 5),
      },
      {
        'id': 4,
        'name': 'تحسين التحسيني',
        'date': DateTime(2025, 5, 5),
      }
    ],
  },
  {
    'name': 'مخبر الحموي 2', // Added a second lab for demonstration
    'icon': Icon(
      TuskIcons.lab_icon,
      size: 100,
      color: cyan500,
    ),
    'credit': -5000000,
    'cases': [
      {
        'id': 1,
        'name': 'حسان التحسيني',
        'date': DateTime(2025, 4, 22),
      },
      {
        'id': 1,
        'name': 'حسان التحسيني',
        'date': DateTime(2025, 4, 22),
      },
      {
        'id': 1,
        'name': 'حسان التحسيني',
        'date': DateTime(2025, 4, 22),
      },
      {
        'id': 1,
        'name': 'حسان التحسيني',
        'date': DateTime(2025, 4, 22),
      },
      {
        'id': 1,
        'name': 'حسان التحسيني',
        'date': DateTime(2025, 4, 22),
      },
      {
        'id': 1,
        'name': 'حسان التحسيني',
        'date': DateTime(2025, 4, 22),
      },
    ],
  },
  {
    'name': 'مخبر الحموي 3', // Added a third lab for demonstration
    'icon': Icon(
      TuskIcons.lab_icon,
      size: 100,
      color: cyan500,
    ),
    'credit': 1000000,
    'cases': [
      {
        'id': 1,
        'name': 'محسن التحسيني',
        'date': DateTime(2025, 12, 9),
      },
      {
        'id': 1,
        'name': 'محسن التحسيني',
        'date': DateTime(2025, 12, 9),
      },
      {
        'id': 1,
        'name': 'محسن التحسيني',
        'date': DateTime(2025, 12, 9),
      },
    ],
  },
];

// List of colors for the container, matching the number of carousel items
// You can customize these colors based on your design
final List<Color> containerBackgroundColors = [
  cyan100, // Color for the first carousel item
  cyan200, // Color for the second carousel item
  cyan300, // Color for the third carousel item
];

// MylabsScreen widget, now StatefulWidget to manage carousel index state
class MylabsScreen extends StatefulWidget {
  MylabsScreen({super.key});

  @override
  State<MylabsScreen> createState() => _MylabsScreenState();
}

class _MylabsScreenState extends State<MylabsScreen> {
  final List _choices = ['الحالات', 'الفواتير', 'الدفعات'];
  final ValueNotifier<String> _table = ValueNotifier<String>('الحالات');

  // State variable to hold the current carousel index
  int _currentCarouselIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 250,
                // Pass the onPageChanged callback to CarouselLabs
                child: CarouselLabs(
                  onPageChanged: (index) {
                    setState(() {
                      _currentCarouselIndex = index;
                    });
                  },
                ),
              ),
              // Container whose decoration changes based on the carousel index
              Container(
                clipBehavior: Clip.antiAlias,
                width: 400, // Consider making this responsive
                height: 430, // Consider making this responsive
                decoration: BoxDecoration(
                  // Dynamically set the color based on the current carousel index
                  color: cyan300,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
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
                              selectedColor:
                                  cyan200, // Using colors from your constants
                              side: const BorderSide(
                                  color:
                                      cyan300), // Using colors from your constants
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
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 5,
                            ),
                          ),
                        ),
                      ),
                      SingleChildScrollView(
                        child: AnimatedBuilder(
                          animation: _table,
                          builder: (context, child) => (_table.value ==
                                  'الحالات')
                              ? LabCasesTable(
                                  data: imgList[_currentCarouselIndex]['cases'],
                                ) // Assuming these tables exist
                              : (_table.value == 'الفواتير')
                                  ? LabBillsTable() // Assuming these tables exist
                                  : LabPaymentsTable(), // Assuming these tables exist
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // locator<NavigationService>()
          //     .navigateTo(labsListRoute); // Assuming labsListRoute is defined
          // Navigator.pushNamed(context, labsListRoute);
                                  context.push(labsListRoute);

        },
        mini: true,
        backgroundColor: cyan400, // Using colors from your constants
        foregroundColor: white, // Using colors from your constants
        shape: RoundedRectangleBorder(
            side: BorderSide(
                color: cyan600, width: 1.5), // Using colors from your constants
            borderRadius: BorderRadius.circular(10)),
        child: Icon(
          Icons.add,
          size: 28,
        ),
      ),
    );
  }
}

// CarouselLabs widget, now accepts an onPageChanged callback
class CarouselLabs extends StatefulWidget {
  const CarouselLabs({super.key, required this.onPageChanged});

  final Function(int) onPageChanged; // Callback function

  @override
  State<StatefulWidget> createState() {
    return _CarouselWithIndicatorState();
  }
}

class _CarouselWithIndicatorState extends State<CarouselLabs> {
  int _current = 0;
  final CarouselSliderController _controller = CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Expanded(
          child: CarouselSlider(
            items: imageSliders, // imageSliders defined below
            carouselController: _controller,
            options: CarouselOptions(
              autoPlay: false,
              enlargeCenterPage: true,
              aspectRatio: 0.990,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
                // Call the callback function passed from MylabsScreen
                widget.onPageChanged(index);
              },
            ),
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
                          ? cyan200 // Using colors from your constants
                          : cyan500) // Using colors from your constants
                      .withOpacity(_current == entry.key ? 0.9 : 0.28),
                ),
              ),
            );
          }).toList(),
        ),
      ]),
    );
  }
}

// Define imageSliders here as it's used by CarouselLabs
final List<Widget> imageSliders = imgList
    .map((item) => Builder(builder: (context) {
          return FlipCard(
            fill: Fill.fillBack,
            direction: FlipDirection.HORIZONTAL,
            side: CardSide.FRONT,
            front: Card(
              shadowColor: cyan300, // Using colors from your constants
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
                        color: cyan500, // Using colors from your constants
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            back: Card(
              shadowColor: cyan300, // Using colors from your constants
              clipBehavior: Clip.antiAlias,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    height: 170, // Consider making this responsive
                    decoration: BoxDecoration(
                        border: Border.all(
                            width: .5,
                            color: cyan200), // Using colors from your constants
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            'الرصيد الحالي',
                            style: TextStyle(
                                fontSize: 16,
                                color:
                                    cyan400), // Using colors from your constants
                          ),
                          Text(
                            item['credit'].toString(),
                            style: TextStyle(
                                fontSize: 14,
                                color: item['credit'] >= 0
                                    ? cyan600
                                    : redmid, // Using colors from your constants
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

// Assuming these classes/constants are defined elsewhere in your project:
// - constants.dart (for cyan100, cyan200, cyan300, cyan400, cyan500, cyan600, white, redmid)
// - services/navigation/locator.dart
// - services/navigation/navigation_service.dart
// - services/navigation/routes.dart (for labsListRoute)
// - view/labs/tables/lab_bills_table.dart
// - view/labs/tables/lab_cases_table.dart
// - view/labs/tables/lab_payments_table.dart
// - components/tusk_icons.dart (for TuskIcons.lab_icon)
