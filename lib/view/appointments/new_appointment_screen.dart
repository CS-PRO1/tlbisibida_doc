import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:calendar_view/calendar_view.dart';
import 'package:choice/choice.dart';
import 'package:flutter/material.dart';
import 'package:tlbisibida_doc/components/default_button.dart';
import 'package:tlbisibida_doc/components/top_nav.dart';
import 'package:tlbisibida_doc/constants/constants.dart';
import 'package:intl/intl.dart';

class NewAppointmentScreen extends StatelessWidget {
  NewAppointmentScreen({super.key});
  DateTime currentdate = DateTime.now();
  List lengthchoices = ['30 Minutes', '1 Hour'];
  List shortappointments = [
    '9:00 AM - 9:30 AM',
    '9:30 AM - 10:00 AM',
    '10:00 AM - 10:30 AM',
    '10:30 AM - 11:00 AM',
    '11:00 AM - 11:30 AM',
    '11:30 AM - 12:00 PM',
    '12:30 PM - 1:00 PM',
    '1:00 PM - 1:30 PM',
    '1:30 PM - 2:00 PM',
    '2:00 PM - 2:30 PM',
    '2:30 PM - 3:00 PM',
  ];
  List longappointments = [
    '9:00 AM - 10:00 AM',
    '10:00 AM - 11:00 AM',
    '11:00 AM - 12:00 AM',
    '12:00 PM - 1:00 PM',
    '1:00 PM - 2:00 PM',
    '2:00 PM - 3:00 PM',
    '3:00 PM - 4:00 PM',
    '4:00 PM - 5:00 PM',
    '5:00 PM - 6:00 PM',
  ];
  final ValueNotifier<bool> _islongapp = ValueNotifier<bool>(true);
  final ValueNotifier<String> _appointmenttime = ValueNotifier<String>('');

  @override
  Widget build(BuildContext context) {
    return CalendarControllerProvider(
      controller: EventController(),
      child: Scaffold(
        backgroundColor: cyan50,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                'Select Time',
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 24, color: cyan600),
              ),
              SizedBox(
                height: 10,
              ),
              CalendarTimeline(
                initialDate: DateTime.now(),
                firstDate: DateTime(2025, 1, 1),
                lastDate: DateTime(2030, 12, 31),
                onDateSelected: (date) =>
                    print(DateFormat.MMMEd().format(date)),
                leftMargin: 20,
                monthColor: cyan600,
                dayColor: cyan600,
                activeDayColor: Colors.white,
                activeBackgroundDayColor: cyan300,
                dotColor: cyan200,
                locale: 'en_ISO',
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                child: Container(
                  color: cyan200,
                  height: 1,
                  width: 300,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Select Appointment Length',
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 20, color: cyan600),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                width: double.infinity,
                child: InlineChoice<bool>.single(
                  value: _islongapp.value,
                  onChanged: (value) {
                    value == null ? value = false : value = value;
                    _islongapp.value = value;
                    print(_islongapp.value.toString());
                  },
                  clearable: false,
                  itemCount: lengthchoices.length,
                  itemBuilder: (state, i) {
                    return ChoiceChip(
                        selectedColor: cyan200,
                        side: const BorderSide(color: cyan300),
                        selected: state.selected(
                            lengthchoices[i] == '30 Minutes' ? true : false),
                        onSelected: state.onSelected(
                            lengthchoices[i] == '30 Minutes' ? true : false),
                        label: Text(lengthchoices[i]));
                  },
                  listBuilder: ChoiceList.createWrapped(
                    runAlignment: WrapAlignment.center,
                    alignment: WrapAlignment.center,
                    direction: Axis.horizontal,
                    //textDirection: TextDirection.rtl,
                    //spacing: 10,
                    //runSpacing: 10,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 5,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                child: Container(
                  color: cyan200,
                  height: 1,
                  width: 300,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Select Appointment Slot',
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 20, color: cyan600),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 300,
                child: AnimatedBuilder(
                    animation: _islongapp,
                    builder: (context, child) => SingleChildScrollView(
                          child: _islongapp.value
                              ? showshortappointments(context)
                              : showlongappointments(context),
                        )),
              ),
              SizedBox(
                height: 10,
              ),
              Center(child: defaultButton(text: 'Next', function: () {}))
            ]),
          ),
        ),
      ),
    );
  }

  Widget showshortappointments(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: InlineChoice<String>.single(
        //value: value,
        // onChanged: (value) {
        //   value == null ? value = false : value = value;
        //   _islongapp.value = value;
        // },
        value: _appointmenttime.value,

        clearable: false,
        itemCount: shortappointments.length,
        itemBuilder: (state, i) {
          return ChoiceChip(
            selectedColor: cyan200,
            side: const BorderSide(color: cyan300),
            selected: state.selected(shortappointments[i]),
            onSelected: state.onSelected(shortappointments[i]),
            label: Text(shortappointments[i]),
          );
        },
        listBuilder: ChoiceList.createWrapped(
          runAlignment: WrapAlignment.center,
          alignment: WrapAlignment.center,
          direction: Axis.horizontal,
          //textDirection: TextDirection.rtl,
          //spacing: 10,
          //runSpacing: 10,
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 5,
          ),
        ),
      ),
    );
  }

  Widget showlongappointments(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: InlineChoice<String>.single(
        //value: value,
        // onChanged: (value) {
        //   value == null ? value = false : value = value;
        //   _islongapp.value = value;
        // },
        value: _appointmenttime.value,

        clearable: false,
        itemCount: longappointments.length,
        itemBuilder: (state, i) {
          return ChoiceChip(
            selectedColor: cyan200,
            side: const BorderSide(color: cyan300),
            selected: state.selected(longappointments[i]),
            onSelected: state.onSelected(longappointments[i]),
            label: Text(longappointments[i]),
          );
        },
        listBuilder: ChoiceList.createWrapped(
          runAlignment: WrapAlignment.center,
          alignment: WrapAlignment.center,
          direction: Axis.horizontal,
          //textDirection: TextDirection.rtl,
          //spacing: 10,
          //runSpacing: 10,
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 5,
          ),
        ),
      ),
    );
  }
}
