import 'package:flip_card/flip_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:tlbisibida_doc/components/default_textfield.dart';
import 'package:tlbisibida_doc/constants/constants.dart';
import 'package:tlbisibida_doc/view/patients/components/bottom_action_buttons_patients.dart';
import 'package:tlbisibida_doc/view/patients/components/dialogs/add_patient_dialog.dart';
import 'package:tlbisibida_doc/view/patients/components/dialogs/patient_info_button.dart';
import 'package:intl/intl.dart';

List<Map> mockPatients = [
  {
    'name': 'اسماعيل احمد كنباوي',
    'age': '2010',
    'number': '0995996997',
    'is_smoker': false,
    'last_appointment': DateTime(2023, 5, 15),
    'added_date': DateTime(2022, 1, 10),
    'credits': -520000
  },
  {
    'name': 'عثمان عبد الجليل ششه',
    'age': '2001',
    'number': '0995886887',
    'is_smoker': true,
    'last_appointment': DateTime(2023, 6, 20),
    'added_date': DateTime(2021, 11, 5),
    'credits': -1000000
  },
  {
    'name': 'أحمد محمد علي',
    'age': '1995',
    'number': '0995111222',
    'is_smoker': false,
    'last_appointment': DateTime(2023, 4, 10),
    'added_date': DateTime(2023, 2, 15),
    'credits': 52000
  },
  {
    'name': 'زينب حسن خالد',
    'age': '1988',
    'number': '0995333444',
    'is_smoker': false,
    'last_appointment': DateTime(2023, 7, 1),
    'added_date': DateTime(2022, 8, 20),
    'credits': -100000
  },
  {
    'name': 'سارة عبد الرحمن',
    'age': '1992',
    'number': '0995666777',
    'is_smoker': true,
    'last_appointment': DateTime(2023, 3, 5),
    'added_date': DateTime(2022, 5, 12),
    'credits': -75000
  },
  {
    'name': 'خالد مصطفى عمر',
    'age': '1975',
    'number': '0995888999',
    'is_smoker': true,
    'last_appointment': DateTime(2023, 8, 12),
    'added_date': DateTime(2021, 9, 3),
    'credits': 25000
  },
  {
    'name': 'نورا صلاح الدين',
    'age': '2005',
    'number': '0995123123',
    'is_smoker': false,
    'last_appointment': DateTime(2023, 2, 28),
    'added_date': DateTime(2023, 1, 7),
    'credits': -98765
  },
  {
    'name': 'يوسف أحمد إبراهيم',
    'age': '1980',
    'number': '0995456456',
    'is_smoker': true,
    'last_appointment': DateTime(2023, 9, 5),
    'added_date': DateTime(2022, 3, 18),
    'credits': -65000
  },
  {
    'name': 'هديل سعيد محمد',
    'age': '1998',
    'number': '0995789789',
    'is_smoker': false,
    'last_appointment': DateTime(2023, 1, 15),
    'added_date': DateTime(2022, 11, 30),
    'credits': -23500
  },
  {
    'name': 'عمر فاروق ناصر',
    'age': '2003',
    'number': '0995012012',
    'is_smoker': false,
    'last_appointment': DateTime(2023, 7, 25),
    'added_date': DateTime(2023, 4, 5),
    'credits': -480000
  },
];

enum SortOption {
  nameAsc,
  nameDesc,
  lastAppointmentAsc,
  lastAppointmentDesc,
  addedDateAsc,
  addedDateDesc,
  creditsAsc,
}

class PatientsListScreen extends StatefulWidget {
  const PatientsListScreen({super.key});

  @override
  State<PatientsListScreen> createState() => _PatientsListScreenState();
}

class _PatientsListScreenState extends State<PatientsListScreen> {
  late List<Map> filteredInfo;
  TextEditingController searchController = TextEditingController();
  SortOption currentSortOption = SortOption.nameAsc;
  final DateFormat dateFormat = DateFormat('yyyy-MM-dd');

  @override
  void initState() {
    super.initState();
    filteredInfo = List.from(mockPatients);
    searchController.addListener(_filterPatients);
    _sortPatients();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  void _filterPatients() {
    final query = searchController.text.toLowerCase();
    setState(() {
      filteredInfo = mockPatients.where((patient) {
        final name = patient['name'].toString().toLowerCase();
        return name.contains(query);
      }).toList();
      _sortPatients();
    });
  }

  void _sortPatients() {
    setState(() {
      switch (currentSortOption) {
        case SortOption.nameAsc:
          filteredInfo.sort((a, b) => a['name'].compareTo(b['name']));
          break;
        case SortOption.nameDesc:
          filteredInfo.sort((a, b) => b['name'].compareTo(a['name']));
          break;
        case SortOption.lastAppointmentAsc:
          filteredInfo.sort(
              (a, b) => a['last_appointment'].compareTo(b['last_appointment']));
          break;
        case SortOption.lastAppointmentDesc:
          filteredInfo.sort(
              (a, b) => b['last_appointment'].compareTo(a['last_appointment']));
          break;
        case SortOption.addedDateAsc:
          filteredInfo
              .sort((a, b) => a['added_date'].compareTo(b['added_date']));
          break;
        case SortOption.addedDateDesc:
          filteredInfo
              .sort((a, b) => b['added_date'].compareTo(a['added_date']));
          break;
        case SortOption.creditsAsc:
          filteredInfo.sort((a, b) => a['credits'].compareTo(b['credits']));
          break;
      }
    });
  }

  void _showSortDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            'ترتيب المرضى',
            style: TextStyle(color: cyan500),
            textAlign: TextAlign.center,
          ),
          content: SizedBox(
            width: double.maxFinite,
            child: ListView(
              shrinkWrap: true,
              children: [
                _buildSortOptionTile(
                  context,
                  'الاسم من أ إلى ي',
                  SortOption.nameAsc,
                ),
                _buildSortOptionTile(
                  context,
                  'الاسم من ي إلى أ',
                  SortOption.nameDesc,
                ),
                const Divider(),
                _buildSortOptionTile(
                  context,
                  'آخر موعد (الأقدم أولاً)',
                  SortOption.lastAppointmentAsc,
                ),
                _buildSortOptionTile(
                  context,
                  'آخر موعد (الأحدث أولاً)',
                  SortOption.lastAppointmentDesc,
                ),
                const Divider(),
                _buildSortOptionTile(
                  context,
                  'تاريخ الإضافة (الأقدم أولاً)',
                  SortOption.addedDateAsc,
                ),
                _buildSortOptionTile(
                  context,
                  'تاريخ الإضافة (الأحدث أولاً)',
                  SortOption.addedDateDesc,
                ),
                const Divider(),
                _buildSortOptionTile(
                  context,
                  'الرصيد (الأقل أولاً)',
                  SortOption.creditsAsc,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  ListTile _buildSortOptionTile(
      BuildContext context, String title, SortOption option) {
    return ListTile(
      title: Text(
        title,
        textAlign: TextAlign.center,
      ),
      trailing: currentSortOption == option
          ? const Icon(Icons.check, color: Colors.green)
          : null,
      onTap: () {
        setState(() {
          currentSortOption = option;
          _sortPatients();
        });
        Navigator.of(context).pop();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cyan50,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // Search and Sort Row
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 10.0, bottom: 15, left: 20.0, right: 10),
                    child: defaultTextField(
                      searchController,
                      context,
                      'ابحث عن مريض...',
                      style: TextStyle(color: cyan500),
                      prefixIcon: Icon(Icons.search, color: cyan400),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(
                    CupertinoIcons.sort_down,
                    color: cyan400,
                  ),
                  onPressed: () => _showSortDialog(context),
                  tooltip: 'ترتيب',
                  iconSize: 28,
                ),
              ],
            ),
            // Current sort indicator
            Text(
              _getCurrentSortDescription(),
              style: TextStyle(color: cyan500, fontSize: 14),
            ),
            const SizedBox(height: 15),
            // GridView wrapped in Expanded
            Expanded(
              child: SizedBox(
                width: 600,
                child: GridView.count(
                  childAspectRatio: .9,
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  crossAxisSpacing: 7,
                  mainAxisSpacing: 7,
                  children: List.generate(
                    filteredInfo.length,
                    (index) =>
                        itemcard(context, filteredInfo, index, onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PatientsListScreen(),
                        ),
                      );
                    }),
                  )
                      .animate(interval: const Duration(milliseconds: 50))
                      .slide(duration: const Duration(milliseconds: 300))
                      .fadeIn(
                          curve: Curves.easeInOut,
                          duration: const Duration(milliseconds: 250))
                      .flip(duration: const Duration(milliseconds: 200)),
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
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
          side: BorderSide(color: cyan600, width: 1.5),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(
          Icons.add,
          size: 28,
        ),
      ),
    );
  }

  String _getCurrentSortDescription() {
    switch (currentSortOption) {
      case SortOption.nameAsc:
        return 'مرتب حسب: الاسم من أ إلى ي';
      case SortOption.nameDesc:
        return 'مرتب حسب: الاسم من ي إلى أ';
      case SortOption.lastAppointmentAsc:
        return 'مرتب حسب: آخر موعد (الأقدم أولاً)';
      case SortOption.lastAppointmentDesc:
        return 'مرتب حسب: آخر موعد (الأحدث أولاً)';
      case SortOption.addedDateAsc:
        return 'مرتب حسب: تاريخ الإضافة (الأقدم أولاً)';
      case SortOption.addedDateDesc:
        return 'مرتب حسب: تاريخ الإضافة (الأحدث أولاً)';
      case SortOption.creditsAsc:
        return 'مرتب حسب الرصيد (الأقل أولاً)';
    }
  }
}

Widget itemcard(BuildContext context, List info, int index,
    {VoidCallback? onTap}) {
  return FlipCard(
    fill: Fill.fillBack,
    direction: FlipDirection.HORIZONTAL,
    side: CardSide.FRONT,
    front: Card(
      clipBehavior: Clip.antiAlias,
      color: white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(height: 5),
          Text(
            info[index]['name'],
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: cyan400,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 5),
          Container(
            height: .5,
            width: 100,
            color: cyan600,
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                CupertinoIcons.phone_circle_fill,
                size: 14,
                color: cyan500,
              ),
              SizedBox(width: 7),
              Text(
                info[index]['number'],
                style: const TextStyle(color: cyan400, fontSize: 14),
              ),
            ],
          ),
          const SizedBox(height: 5),
          bottomActionButtonsPatients(context),
        ],
      ),
    ),
    back: Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(height: 5),
          Column(
            children: [
              Text(
                'العمر: ${info[index]['age']}',
                style: const TextStyle(color: cyan400, fontSize: 16),
              ),
              const SizedBox(height: 8),
              Text(
                'آخر موعد: ${DateFormat('yyyy-MM-dd').format(info[index]['last_appointment'])}',
                style: const TextStyle(color: cyan400, fontSize: 14),
              ),
              const SizedBox(height: 8),
              Text(
                'تاريخ الإضافة: ${DateFormat('yyyy-MM-dd').format(info[index]['added_date'])}',
                style: const TextStyle(color: cyan400, fontSize: 14),
              ),
            ],
          ),
          const SizedBox(height: 5),
          Container(
            height: .5,
            width: 100,
            color: cyan600,
          ),
          const SizedBox(height: 5),
          info[index]['is_smoker']
              ? Icon(Icons.smoking_rooms_rounded, color: redmain)
              : Icon(Icons.smoke_free_rounded, color: cyan300),
          const SizedBox(height: 5),
          patientInfoButton(context),
        ],
      ),
    ),
  );
}
