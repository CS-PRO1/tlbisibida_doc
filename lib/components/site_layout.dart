import 'package:circle_bottom_navigation/circle_bottom_navigation.dart';
import 'package:circle_bottom_navigation/widgets/tab_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tlbisibida_doc/components/reponsiveness.dart';
import 'package:tlbisibida_doc/components/top_nav.dart';
import 'package:tlbisibida_doc/components/tusk_icons.dart';
import 'package:tlbisibida_doc/constants/constants.dart';
import 'package:tlbisibida_doc/services/navigation/locator.dart';
import 'package:tlbisibida_doc/services/navigation/navigation_service.dart';
import 'package:tlbisibida_doc/services/navigation/router.dart';
import 'package:tlbisibida_doc/services/navigation/routes.dart';
import 'package:tlbisibida_doc/view/appointments/appointments_calendar_screen.dart';
import 'package:tlbisibida_doc/view/finance/finance_center_screen.dart';
import 'package:tlbisibida_doc/view/inventory/screens/inventory_screen.dart';
import 'package:tlbisibida_doc/view/patients/screens/patients_list_screen.dart';
import 'package:tlbisibida_doc/view/statistics/statistics_screen.dart';

// ignore: must_be_immutable
class SiteLayout extends StatefulWidget {
  SiteLayout({super.key});

  @override
  State<SiteLayout> createState() => _SiteLayoutState();
}

class _SiteLayoutState extends State<SiteLayout> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  final NavigationService _navigationService = locator<NavigationService>();
  int currentPage = 2;

  final List _routes = [
    patientListRoute,
    financeRoute,
    rootRoute,
    inventoryRoute,
    labsListRoute
  ];

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
        appBar: TopNavigationBar(),
        bottomNavigationBar: CircleBottomNavigation(
          barHeight: 45,
          circleSize: 30,
          initialSelection: currentPage,
          inactiveIconColor: Colors.grey,
          textColor: cyan500,
          hasElevationShadows: true,
          barBackgroundColor: cyan100,
          arcHeight: 20,
          circleOutline: 8,
          blurShadowRadius: 3,
          tabs: [
            TabData(
              
              icon: Icons.people_rounded,
              iconSize: 20,
              title: 'المرضى',
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
            TabData(
              icon: CupertinoIcons.money_dollar,
              iconSize: 20,
              title: 'المالية',
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
            TabData(
              icon: Icons.calendar_month_rounded,
              iconSize: 20,
              title: 'المواعيد',
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
            TabData(
              icon: CupertinoIcons.bag,
              iconSize: 20,
              title: 'المخزن',
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
            TabData(
              icon: TuskIcons.lab_icon,
              iconSize: 40,
              title: 'المخابر',
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ],
          onTabChangedListener: (index) {
            setState(() => currentPage = index);
            // Navigate to the corresponding route instead of switching pages
            final route = _routes[index];
            if (route != null) {
              _navigationService.navigateTo(route);
            }
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
