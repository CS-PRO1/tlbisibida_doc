// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:choice/choice.dart';
import 'package:cupertino_calendar_picker/cupertino_calendar_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tlbisibida_doc/components/custom_text.dart';
import 'package:tlbisibida_doc/components/image_picker.dart';
import 'package:tlbisibida_doc/constants/constants.dart';
import 'package:tlbisibida_doc/presentation/authentication/cubit/auth_cubit.dart';
import 'package:tlbisibida_doc/services/navigation/routes.dart';

class Register2 extends StatefulWidget {
  Register2({super.key});

  @override
  State<Register2> createState() => _Register2State();
}

class _Register2State extends State<Register2> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();
  TextEditingController firstname = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController address = TextEditingController();

  List<_WorkingHoursData> _workingHoursData = [];
  final List _subsicribe = ['ربع سنوي', 'نصف سنوي', 'سنوي'];
  final ValueNotifier<String> _subtype = ValueNotifier('سنوي');

  @override
  void initState() {
    super.initState();
    // Initialize with one set of default working hours data
    _workingHoursData.add(_WorkingHoursData());
  }

  void _addWorkingHoursData() {
    setState(() {
      _workingHoursData.add(_WorkingHoursData());
    });
  }

  void _deleteWorkingHoursData(int index) {
    setState(() {
      _workingHoursData.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<String> provincesList = [
      'دمشق',
      'ريف دمشق',
      'القنيطرة',
      'درعا',
      'السويداء',
      'حمص',
      'حماة',
      'اللاذقية',
      'طرطوس',
      'حلب',
      'إدلب',
      'الرقة',
      'دير الزور',
      'الحسكة',
    ];
    List<Uint8List> images = [];

    return Scaffold(
      body: BlocConsumer<AuthCubit, String>(
        listener: (context, state) {
          if (state == 'registered') {
            AnimatedSnackBar.material(
              'تم انشاءحساب بنجاح!',
              type: AnimatedSnackBarType.success,
              desktopSnackBarPosition: DesktopSnackBarPosition.bottomCenter,
              duration: Duration(seconds: 3),
              animationCurve: Easing.standard,
            ).show(context);
            context.go(rootRoute);

            // locator<NavigationService>().navigateTo(clientsLogPageRoute);
          }
          if (state == 'error') {
            AnimatedSnackBar.material(
              'لم يتم انشاء حساب ـ تأكد من المعلومات المدخلة ثم حاول مرة أخرى',
              type: AnimatedSnackBarType.error,
              desktopSnackBarPosition: DesktopSnackBarPosition.bottomCenter,
              duration: Duration(seconds: 3),
              animationCurve: Easing.standard,
            ).show(context);
          }
        },
        builder: (context, state) {
          final AuthCubit cubit = context.read<AuthCubit>();
          return Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/teeth_pattern.png'),
                repeat: ImageRepeat.repeat,
              ),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromARGB(149, 229, 243, 241),
                  cyan50,
                  cyan100,
                  cyan100,
                  cyan100,
                  cyan100,
                  cyan50,
                ],
              ),
            ),
            constraints: const BoxConstraints(maxWidth: 400),
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Padding(
                      //   padding: const EdgeInsets.only(top: 25, right: 12),
                      //   child: Image.asset(
                      //     "assets/icons/logo_v2.png",
                      //     width: 100,
                      //     height: 100,
                      //   ),
                      // ),
                      const SizedBox(height: 30),
                      Text(
                        "إنشاء حساب",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: cyan500,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          shadows: [
                            Shadow(
                              color: const Color.fromARGB(112, 125, 117, 117),
                              blurRadius: 2,
                              offset: Offset(-1, 2),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        decoration: BoxDecoration(
                          color: cyan50op,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                'اختر صورة الملف الشخصي',
                                style: TextStyle(color: cyan600, fontSize: 14),
                              ),
                              imagePicker(images, false),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),

                      Container(
                        decoration: BoxDecoration(
                          color: cyan50op,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                'اختر مدة الاشتراك',
                                style: TextStyle(color: cyan500, fontSize: 16),
                              ),
                              SizedBox(
                                width: double.infinity,
                                child: InlineChoice<String>.single(
                                    value: _subtype.value,
                                    onChanged: (obj) {
                                      _subtype.value = obj!;
                                      // print(_targetlabtype.toString());
                                    },
                                    clearable: false,
                                    itemCount: _subsicribe.length,
                                    itemBuilder: (state, i) {
                                      return ChoiceChip(
                                        selectedColor: cyan200,
                                        side: const BorderSide(color: cyan300),
                                        selected:
                                            state.selected(_subsicribe[i]),
                                        onSelected:
                                            state.onSelected(_subsicribe[i]),
                                        label: Text(_subsicribe[i]),
                                        showCheckmark: false,
                                      );
                                    },
                                    listBuilder: ChoiceList.createWrapped(
                                        // runAlignment: WrapAlignment.spaceAround,
                                        alignment: WrapAlignment.spaceAround,
                                        direction: Axis.horizontal,
                                        textDirection: TextDirection.rtl,
                                        //spacing: 10,
                                        //runSpacing: 10,
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 20,
                                          vertical: 5,
                                        ))),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),

                      // The SINGLE main container for all working hours blocks
                      Container(
                        height: MediaQuery.of(context).size.height / 2.2,
                        decoration: BoxDecoration(
                          color: cyan50op,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical:
                                  16.0), // Padding inside the main container
                          child: SingleChildScrollView(
                            child: Column(
                              // mainAxisAlignment: MainAxisAlignment.center,
                              // Make column only take required space
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Text(
                                  'أوقات الدوام',
                                  textAlign:
                                      TextAlign.center, // Center the title
                                  style:
                                      TextStyle(color: cyan500, fontSize: 16),
                                ),
                                // Dynamically build each working hours block
                                ..._workingHoursData
                                    .asMap()
                                    .entries
                                    .map((entry) {
                                  int index = entry.key;
                                  _WorkingHoursData data = entry.value;

                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0, vertical: 15),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: cyan50op,
                                        border: Border.all(
                                            width: .5, color: cyan300),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      height:
                                          MediaQuery.of(context).size.height /
                                              2.45,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 25),
                                        child: Column(
                                          children: [
                                            _SingleWorkingHoursBlockContent(
                                              key: ValueKey(
                                                  'working_hours_$index'), // Unique key for each block
                                              data: data,
                                              onDelete: () {
                                                _deleteWorkingHoursData(index);
                                              },
                                              showDeleteButton:
                                                  _workingHoursData.length >
                                                      1, // Pass condition
                                              onDataChanged: () {
                                                // Callback to rebuild parent when data changes
                                                setState(() {});
                                              },
                                            ),
                                            //dd separator if not the last item
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                }).toList(),
                              ],
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 15),
                      // Button to add more working hours
                      InkWell(
                        onTap: _addWorkingHoursData,
                        child: Container(
                          height: 35,
                          decoration: BoxDecoration(
                            color: cyan50op,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: cyan500, width: 1),
                          ),
                          alignment: Alignment.center,
                          width: double.maxFinite,
                          // padding: const EdgeInsets.symmetric(vertical: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.add, color: cyan400),
                              const SizedBox(
                                width: 8,
                                // height: 40,
                              ),
                              const CustomText(
                                text: "إضافة أوقات دوام أخرى",
                                color: cyan400,
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      InkWell(
                        onTap: () {
                          {
                            Map<String, String> workingHoursData = {};
                            for (int i = 0; i < _workingHoursData.length; i++) {
                              _WorkingHoursData data = _workingHoursData[i];

                              String startTime =
                                  '${data.startTime.hour.toString().padLeft(2, '0')}:${data.startTime.minute.toString().padLeft(2, '0')}';
                              String endTime =
                                  '${data.endTime.hour.toString().padLeft(2, '0')}:${data.endTime.minute.toString().padLeft(2, '0')}';

                              List<String> selectedDaysStrings = [];
                              data.selectedDays.forEach((day, isSelected) {
                                if (isSelected) {
                                  selectedDaysStrings
                                      .add(day.toString().split('.').last);
                                }
                              });
                              workingHoursData['block_$i'] =
                                  '${selectedDaysStrings.join(',')}|$startTime-$endTime';
                            }

                            int subscriptionDurationInt;
                            switch (_subtype.value) {
                              case 'ربع سنوي':
                                subscriptionDurationInt = 3;
                                break;
                              case 'نصف سنوي':
                                subscriptionDurationInt = 6;
                                break;
                              case 'سنوي':
                              default:
                                subscriptionDurationInt = 12;
                                break;
                            }

                            // 3. Call the cubit method
                            cubit.cookregistry2(
                              workingHours: workingHoursData,
                              subscriptionDuration: subscriptionDurationInt,
                            );
                          }
                        },
                        child: Container(
                          height: 40,
                          decoration: BoxDecoration(
                            color: cyan400,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          alignment: Alignment.center,
                          width: double.maxFinite,
                          // padding: const EdgeInsets.symmetric(vertical: 16),
                          child: const CustomText(
                            text: "إنشاء حساب",
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

// A new private StatelessWidget to represent the content of a single working hours block
class _SingleWorkingHoursBlockContent extends StatelessWidget {
  final _WorkingHoursData data;
  final VoidCallback onDelete;
  final bool showDeleteButton;
  final VoidCallback onDataChanged; // Callback to notify parent of data changes

  const _SingleWorkingHoursBlockContent({
    Key? key,
    required this.data,
    required this.onDelete,
    required this.showDeleteButton,
    required this.onDataChanged,
  }) : super(key: key);

  // Helper for building day checkbox rows
  Widget _buildDayCheckboxRow(List<Map<String, dynamic>> days,
      {bool center = false}) {
    return Row(
      mainAxisAlignment:
          center ? MainAxisAlignment.center : MainAxisAlignment.start,
      children: days
          .expand((dayInfo) => [
                Checkbox(
                  value: data.selectedDays[dayInfo['day']],
                  onChanged: (value) {
                    data.selectedDays[dayInfo['day']] = value!;
                    onDataChanged(); // Notify parent to rebuild
                  },
                ),
                CustomText(text: dayInfo['label']),
              ])
          .toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // This container is now purely for internal padding/styling of this block
      // Not the main cyan50op container.
      // decoration: BoxDecoration( // Removed background/border to be inside main container
      //   color: const Color.fromARGB(121, 255, 255, 255),
      //   borderRadius: BorderRadius.circular(30),
      // ),
      // clipBehavior: Clip.antiAlias, // Not needed here
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center, // Stretch children
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text('من'),
                      SizedBox(
                        width: 10,
                      ),
                      CupertinoTimePickerButton(
                        mainColor: cyan400,
                        initialTime:
                            data.startTime, // Use data model's current time
                        onTimeChanged: (time) {
                          data.startTime = time;
                          onDataChanged(); // Notify parent to rebuild
                        },
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text('إلى'),
                      SizedBox(
                        width: 10,
                      ),
                      CupertinoTimePickerButton(
                        mainColor: cyan400,
                        initialTime:
                            data.endTime, // Use data model's current time
                        onTimeChanged: (time) {
                          data.endTime = time;
                          onDataChanged(); // Notify parent to rebuild
                        },
                      ),
                    ],
                  ),
                ),
                showDeleteButton
                    ? IconButton(
                        icon: Icon(Icons.delete_sweep_sharp, color: redmid),
                        onPressed: onDelete,
                      )
                    : SizedBox(),
              ],
            ),
            _buildDayCheckboxRow([
              {'label': 'سبت', 'day': DayOfWeek.saturday},
              {'label': 'أحد', 'day': DayOfWeek.sunday},
              {'label': 'اثنين', 'day': DayOfWeek.monday},
              {'label': 'ثلاثاء', 'day': DayOfWeek.tuesday},
            ]),
            _buildDayCheckboxRow([
              {'label': 'أربعاء', 'day': DayOfWeek.wednesday},
              {'label': 'خميس', 'day': DayOfWeek.thursday},
              {'label': 'جمعة', 'day': DayOfWeek.friday},
            ], center: true),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 11.0, horizontal: 30),
              child: Container(
                height: .5,
                color: cyan300,
              ),
            ),
            Text(
              'وقت الاستراحة',
              style: TextStyle(color: cyan600, fontSize: 14),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('من'),
                  SizedBox(
                    width: 10,
                  ),
                  CupertinoTimePickerButton(
                    mainColor: cyan400,
                    initialTime:
                        data.startTime, // Use data model's current time
                    onTimeChanged: (time) {
                      data.startTime = time;
                      onDataChanged(); // Notify parent to rebuild
                    },
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Text('إلى'),
                  SizedBox(
                    width: 10,
                  ),
                  CupertinoTimePickerButton(
                    mainColor: cyan400,
                    initialTime: data.endTime, // Use data model's current time
                    onTimeChanged: (time) {
                      data.endTime = time;
                      onDataChanged(); // Notify parent to rebuild
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Enum for days of the week to better manage selected days
enum DayOfWeek {
  saturday,
  sunday,
  monday,
  tuesday,
  wednesday,
  thursday,
  friday,
}

// Data model for each working hours entry
class _WorkingHoursData {
  TimeOfDay startTime;
  TimeOfDay endTime;
  Map<DayOfWeek, bool> selectedDays;

  _WorkingHoursData({
    TimeOfDay? startTime,
    TimeOfDay? endTime,
    Map<DayOfWeek, bool>? selectedDays,
  })  : startTime = startTime ?? const TimeOfDay(hour: 9, minute: 0),
        endTime = endTime ?? const TimeOfDay(hour: 17, minute: 0),
        selectedDays = selectedDays ??
            {
              DayOfWeek.saturday: false,
              DayOfWeek.sunday: false,
              DayOfWeek.monday: false,
              DayOfWeek.tuesday: false,
              DayOfWeek.wednesday: false,
              DayOfWeek.thursday: false,
              DayOfWeek.friday: false,
            };
}
