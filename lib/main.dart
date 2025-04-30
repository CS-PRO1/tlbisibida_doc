import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:keep_screen_on/keep_screen_on.dart';
import 'package:tlbisibida_doc/components/site_layout.dart';
import 'package:tlbisibida_doc/constants/constants.dart';
import 'package:tlbisibida_doc/services/dio/dio.dart';
import 'package:tlbisibida_doc/services/navigation/locator.dart';
import 'package:tlbisibida_doc/services/navigation/navigation_service.dart';
import 'package:tlbisibida_doc/view/secretary/component/carousel.dart';
import 'package:tlbisibida_doc/view/secretary/secretary_screen.dart';
import 'package:tlbisibida_doc/view/statistics/statistics_screen.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: cyan200,
      systemNavigationBarColor: cyan400,
    ),
  );
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
    return MaterialApp(
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
      home: SiteLayout(), // Set home directly
    );
  }
}
