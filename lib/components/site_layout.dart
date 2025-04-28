import 'package:flutter/material.dart';
import 'package:tlbisibida_doc/components/reponsiveness.dart';
import 'package:tlbisibida_doc/components/top_nav.dart';
import 'package:tlbisibida_doc/services/navigation/locator.dart';
import 'package:tlbisibida_doc/services/navigation/navigation_service.dart';
import 'package:tlbisibida_doc/services/navigation/router.dart';
import 'package:tlbisibida_doc/services/navigation/routes.dart';

class SiteLayout extends StatelessWidget {
  SiteLayout({super.key});
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      extendBodyBehindAppBar: false,
      appBar: TopNavigationBar(),
      body: Navigator(
        key: locator<NavigationService>().navigatorKey,
        onGenerateRoute: generateRoute,
        initialRoute: appointmentRoute, // Change to rootRoute
      ),
    );
  }
}
