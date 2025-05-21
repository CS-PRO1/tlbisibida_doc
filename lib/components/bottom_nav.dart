import 'package:circle_bottom_navigation/circle_bottom_navigation.dart';
import 'package:circle_bottom_navigation/widgets/tab_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tlbisibida_doc/components/tusk_icons.dart';
import 'package:tlbisibida_doc/constants/constants.dart';
// Removed: import 'package:tlbisibida_doc/services/navigation/locator.dart';
// Removed: import 'package:tlbisibida_doc/services/navigation/navigation_service.dart';
// Removed: import 'package:tlbisibida_doc/services/navigation/routes.dart'; // No longer needed for direct navigation

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentPage;
  final Function(int) onTabChanged; // This is the callback

  const CustomBottomNavigationBar({
    super.key,
    required this.currentPage,
    required this.onTabChanged,
  });

  @override
  Widget build(BuildContext context) {
    // Removed _navigationService and _routes list from here.
    // The navigation logic is now handled by the parent (ShellRoute builder).

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
          icon:
              CupertinoIcons.lab_flask_solid, // Assuming this is for Inventory
          iconSize: 20,
          title: 'المخزن',
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
        TabData(
          icon: TuskIcons.lab_icon, // Assuming this is for Labs
          iconSize: 18,
          title: 'المخابر',
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
      ],
      onTabChangedListener: (index) {
        // Simply call the provided callback with the selected index.
        // The actual navigation will happen in the ShellRoute's builder.
        onTabChanged(index);
      },
    );
  }
}
