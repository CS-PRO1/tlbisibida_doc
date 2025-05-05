import 'package:flutter/material.dart';
import 'package:tlbisibida_doc/components/bottom_nav.dart';
import 'package:tlbisibida_doc/components/top_nav.dart';
import 'package:tlbisibida_doc/services/navigation/locator.dart';
import 'package:tlbisibida_doc/services/navigation/navigation_service.dart';
import 'package:tlbisibida_doc/services/navigation/router.dart';
import 'package:tlbisibida_doc/services/navigation/routes.dart';

class SiteLayout extends StatefulWidget {
  const SiteLayout({super.key});

  @override
  State<SiteLayout> createState() => _SiteLayoutState();
}

class _SiteLayoutState extends State<SiteLayout> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  final NavigationService _navigationService = locator<NavigationService>();
  int currentPage = 2;

  @override
  void initState() {
    super.initState();
    _navigationService.init();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        key: scaffoldKey,
        extendBodyBehindAppBar: false,
        appBar: const TopNavigationBar(),
        bottomNavigationBar: CustomBottomNavigationBar(
          currentPage: currentPage,
          onTabChanged: (index) {
            setState(() => currentPage = index);
          },
        ),
        body: Navigator(
          key: _navigationService.navigatorKey,
          onGenerateRoute: generateRoute,
          initialRoute: rootRoute,
        ),
      ),
    );
  }
}
