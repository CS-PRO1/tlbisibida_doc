import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:keep_screen_on/keep_screen_on.dart';
import 'package:tlbisibida_doc/components/site_layout.dart';
import 'package:tlbisibida_doc/constants/constants.dart';
import 'package:tlbisibida_doc/services/dio/dio.dart';
import 'package:tlbisibida_doc/services/navigation/locator.dart';
import 'package:tlbisibida_doc/services/navigation/navigation_service.dart';
import 'package:tlbisibida_doc/services/navigation/router.dart';
import 'package:tlbisibida_doc/view/Sessions/session_details_screen.dart';
import 'package:tlbisibida_doc/view/appointments/calendar_screen.dart';
import 'package:tlbisibida_doc/view/appointments/new_appointment_screen.dart';
import 'package:tlbisibida_doc/view/home_page.dart';
import 'package:tlbisibida_doc/view/inventory/inventory_screen.dart';
import 'package:tlbisibida_doc/view/labs/labs_list_screen.dart';
import 'package:tlbisibida_doc/view/patients/patient_info_screen.dart';
import 'package:tlbisibida_doc/view/patients/patients_list_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  setupLocator();
  KeepScreenOn.turnOn();

  // Initialize navigation service after setup
  final navigationService = locator<NavigationService>();
  runApp(const MyApp());

  // Set initial title after app starts
  WidgetsBinding.instance.addPostFrameCallback((_) {
    navigationService.init();
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // Remove initialRoute to prevent double initialization
      //onGenerateRoute: (settings) => generateRoute(settings),
      title: 'LambdaDent Doctor App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.teal,
        primaryColor: cyan300,
        colorScheme: ColorScheme.fromSeed(seedColor: cyan400),
        scaffoldBackgroundColor: cyan50,
      ),
      home: InventoryScreen(), // Set home directly
    );
  }
}
