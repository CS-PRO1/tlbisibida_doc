import 'package:flutter/cupertino.dart';
import 'package:tlbisibida_doc/services/navigation/routes.dart';

// class NavigationService {
//   final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
//   Future<dynamic> navigateTo(String routeName) {
//     return navigatorKey.currentState!.pushNamed(routeName);
//   }

//   void goBack() {
//     return navigatorKey.currentState!.pop();
//   }
// }
class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  final ValueNotifier<String> currentTitle = ValueNotifier(homePageDisplayName);
  final ValueNotifier<bool> showBackButton = ValueNotifier(false);
  // Add this method
  void init() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      updateNavigationState();
    });
  }

  Future<dynamic> navigateTo(String routeName) {
    final title = _getTitleForRoute(routeName);
    currentTitle.value = title;
    showBackButton.value = true;
    if (routeName == homePageRoute) {
      navigatorKey.currentState!.popUntil(ModalRoute.withName('/'));
      return navigatorKey.currentState!.pushNamed(routeName).then((_) {
        updateNavigationState();
      });
    }

    return navigatorKey.currentState!.pushNamed(routeName).then((_) {
      updateNavigationState();
    });
  }

  void goBack() {
    navigatorKey.currentState!.pop();
    updateNavigationState();
  }

  void updateNavigationState() {
    final currentContext = navigatorKey.currentContext;
    if (currentContext == null) return;

    final currentRoute = ModalRoute.of(currentContext);
    if (currentRoute != null) {
      final routeName = currentRoute.settings.name;
      if (routeName != null && routeName.isNotEmpty && routeName != '/') {
        currentTitle.value = _getTitleForRoute(routeName);
      } else {
        currentTitle.value = appointmentDisplayName;
      }
    }
    showBackButton.value = navigatorKey.currentState?.canPop() ?? false;
  }

  String _getTitleForRoute(String routeName) {
    switch (routeName) {
      case authRoute:
        return authDisplayName;
      case homePageRoute:
        return homePageDisplayName;

      // Add all your other routes here
      default:
        return homePageDisplayName;
    }
  }
}
