import 'package:circle_bottom_navigation/circle_bottom_navigation.dart';
import 'package:circle_bottom_navigation/widgets/tab_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tlbisibida_doc/components/tusk_icons.dart';
import 'package:tlbisibida_doc/constants/constants.dart';
import 'package:tlbisibida_doc/services/navigation/locator.dart';
import 'package:tlbisibida_doc/services/navigation/navigation_service.dart';
import 'package:tlbisibida_doc/services/navigation/routes.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentPage;
  final Function(int) onTabChanged;

  const CustomBottomNavigationBar({
    super.key,
    required this.currentPage,
    required this.onTabChanged,
  });

  @override
  Widget build(BuildContext context) {
    final NavigationService _navigationService = locator<NavigationService>();
    final List _routes = [
      patientListRoute,
      financeRoute,
      rootRoute,
      inventoryRoute,
      myLabsListRoute
    ];

    return CircleBottomNavigation(
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
          icon: CupertinoIcons.lab_flask_solid,
          iconSize: 20,
          title: 'المخزن',
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
        TabData(
          icon: TuskIcons.lab_icon,
          iconSize: 18,
          title: 'المخابر',
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
      ],
      onTabChangedListener: (index) {
        onTabChanged(index);
        final route = _routes[index];
        if (route != null) {
          _navigationService.navigateTo(route);
        }
      },
    );
  }
}
