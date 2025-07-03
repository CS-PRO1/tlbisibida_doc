import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:tlbisibida_doc/constants/constants.dart';
import 'package:tlbisibida_doc/services/Cache/cache_helper.dart';
import 'package:tlbisibida_doc/services/dio/dio.dart';
import 'package:tlbisibida_doc/services/navigation/controllers.dart';
import 'package:tlbisibida_doc/services/navigation/go_router.dart'; // New: Import the GoRouter setup

void main() async {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: cyan200,
      systemNavigationBarColor: cyan400,
    ),
  );
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init(); // Assuming DioHelper is still needed for other services
  setupLocator();
  await CacheHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      // Use MaterialApp.router for go_router
      locale: const Locale('ar'),
      supportedLocales: const [
        Locale('ar'),
        Locale('en'),
      ],
      localizationsDelegates: const [
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
      routerConfig: AppRouter.router, // Provide the GoRouter instance
    );
  }
}
