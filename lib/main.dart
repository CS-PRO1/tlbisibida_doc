import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:tlbisibida_doc/components/site_layout.dart';
import 'package:tlbisibida_doc/constants/constants.dart';
import 'package:tlbisibida_doc/services/dio/dio.dart';
import 'package:tlbisibida_doc/services/navigation/locator.dart';
import 'package:tlbisibida_doc/services/navigation/navigation_service.dart';
import 'package:tlbisibida_doc/services/navigation/router.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  setupLocator();

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
      //TODO onGenerateRoute: (settings) => generateRoute(settings),
      title: 'LambdaDent Doctor App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.teal,
        primaryColor: cyan300,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        scaffoldBackgroundColor: cyan50,
      ),
      home: SiteLayout(), // Set home directly
    );
  }
}
