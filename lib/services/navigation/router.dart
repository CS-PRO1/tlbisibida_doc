import 'package:flutter/material.dart';
import 'package:tlbisibida_doc/services/navigation/locator.dart';
import 'package:tlbisibida_doc/services/navigation/navigation_service.dart';
import 'package:tlbisibida_doc/services/navigation/routes.dart';

//Route<dynamic> 
//TODO
void generateRoute(RouteSettings settings) {
  // print('generateRoute: ${settings.name}');

  // switch (settings.name) {
  //   //Auth
  //   case authenticationPageRoute:
  //     return _getPageRoute(AuthenticationPage(), authenticationPageDisplayName);

  //   //Home
  //   case homePageRoute:
  //     return _getPageRoute(const HomePage(), homePageDisplayName);

  //   //Bills
  //   case billsPageRoute:
  //     return _getPageRoute(BillsPage(), billsPageDisplayName);

  //   //Cases
  //   case casesPageRoute:
  //     return _getPageRoute(const CasesListPage(), casesPageDisplayName);
  //   case caseDetailsPageRoute:
  //     return _getPageRoute(CaseDetails(), caseDetailsPageDisplayName);

  //   //Clients
  //   case clientPageRoute:
  //     return _getPageRoute(ClientsPage(), clientPageDisplayName);
  //   case clientDetailsPageRoute:
  //     return _getPageRoute(ClientDetailsPage(), clientDetailsPageDisplayName);

  //   //Employees
  //   case employeesPageRoute:
  //     return _getPageRoute(EmplyoeesPage(), employeesPageDisplayName);

  //   //Inventory
  //   case inventoryPageRoute:
  //     return _getPageRoute(InventoryPage(), inventoryPageDisplayName);

  //   //Payments
  //   case paymentsLogPageRoute:
  //     return _getPageRoute(PaymentsLogPage(), paymentsLogPageDisplayName);

  //   //User Profile
  //   case profilePageRoute:
  //     return _getPageRoute(ProfilePage(), profilePageDisplayName);

  //   //TODO: Statistics Page
  //   // case statisticsPageRoute:
  //   // return _getPageRoute(StatisticsPage());

  //   default:
      //return _getPageRoute(const HomePage(), homePageDisplayName);
      
  }


PageRoute _getPageRoute(Widget child, String title) {
  locator<NavigationService>().currentTitle.value = title;
  return MaterialPageRoute(
    builder: (context) => child,
    settings: RouteSettings(name: title),
  );
}
