import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:tlbisibida_doc/components/site_layout.dart';
import 'package:tlbisibida_doc/constants/constants.dart';
import 'package:tlbisibida_doc/services/dio/dio.dart';
import 'package:tlbisibida_doc/services/navigation/locator.dart';
import 'package:tlbisibida_doc/services/navigation/navigation_service.dart';
import 'package:tlbisibida_doc/services/navigation/router.dart';
import 'package:tlbisibida_doc/services/navigation/routes.dart';

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
  // KeepScreenOn.turnOn();

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
      locale: Locale('ar'),
      supportedLocales: [
        Locale('ar'),
        Locale('en'),
      ],
      localizationsDelegates: [
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      title: 'LambdaDent Doctor App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.teal,
        primaryColor: cyan300,
        colorScheme: ColorScheme.fromSeed(seedColor: cyan400),
        scaffoldBackgroundColor: cyan50,
      ),
      onGenerateRoute: (settings) => generateRoute(settings),
      home: PopScope(
          canPop: false,
          onPopInvokedWithResult: (didPop, result) {
            if (didPop) {
              print('didpop = true');
            }
            print('didpop = false');
            if (locator<NavigationService>().currentTitle.value !=
                appointmentDisplayName) {
              locator<NavigationService>().goBack();
              print('goback is initiated');
            }
          },
          child: SiteLayout()), // Set home directly
    );
  }
}
