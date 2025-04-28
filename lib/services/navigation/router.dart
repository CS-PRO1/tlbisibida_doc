import 'package:flutter/material.dart';
import 'package:tlbisibida_doc/services/navigation/locator.dart';
import 'package:tlbisibida_doc/services/navigation/navigation_service.dart';
import 'package:tlbisibida_doc/services/navigation/routes.dart';
import 'package:tlbisibida_doc/view/Sessions/screens/add_edit_session_details_screen.dart';
import 'package:tlbisibida_doc/view/Sessions/screens/session_details_screen.dart';
import 'package:tlbisibida_doc/view/appointments/appointments_calendar_screen.dart';
import 'package:tlbisibida_doc/view/appointments/new_appointment_screen.dart';
import 'package:tlbisibida_doc/view/finance/finance_center_screen.dart';
import 'package:tlbisibida_doc/view/home_page.dart';
import 'package:tlbisibida_doc/view/inventory/screens/inventory_screen.dart';
import 'package:tlbisibida_doc/view/inventory/screens/item_list_screen.dart';
import 'package:tlbisibida_doc/view/labs/screens/cases/case_details_screen.dart';
import 'package:tlbisibida_doc/view/labs/screens/lab_info_screen.dart';
import 'package:tlbisibida_doc/view/labs/screens/labs_list_screen.dart';
import 'package:tlbisibida_doc/view/patients/screens/patient_info_screen.dart';
import 'package:tlbisibida_doc/view/patients/screens/patients_list_screen.dart';
import 'package:tlbisibida_doc/view/profile/profile_edit_screen.dart';
import 'package:tlbisibida_doc/view/profile/profile_screen.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  print('generateRoute: ${settings.name}');

  switch (settings.name) {
    //   //Auth
    // case '/':
    //   return _getPageRoute(const HomePage(), homePageDisplayName);
    // case authenticationPageRoute:
    //   return _getPageRoute(AuthenticationPage(), authenticationPageDisplayName);

    case addAppointmentRoute:
      return _getPageRoute(NewAppointmentScreen(), addAppointmentDisplayName);

    case appointmentRoute:
      return _getPageRoute(
          AppointmentsCalendarScreen(), appointmentDisplayName);

    case financeRoute:
      return _getPageRoute(FinanceCenterScreen(), financeDisplayName);

    case inventoryRoute:
      return _getPageRoute(InventoryScreen(), inventoryDisplayName);

    case itemListRoute:
      return _getPageRoute(ItemListScreen(), itemListDisplayName);

    case caseDetailsRoute:
      return _getPageRoute(CaseDetailsScreen(), caseDetailsDisplayName);

    case labsListRoute:
      return _getPageRoute(const LabsListScreen(), labsListDisplayName);

    case labInfoRoute:
      return _getPageRoute(LabInfoScreen(), labInfoDisplayName);

    case patientInfoRoute:
      return _getPageRoute(const PatientInfoScreen(), patientInfoDisplayName);

    case patientListRoute:
      return _getPageRoute(PatientsListScreen(), patientListDisplayName);

    case profileEditRoute:
      return _getPageRoute(ProfileEditScreen(), profileEditDisplayName);

    case profileRoute:
      return _getPageRoute(ProfileScreen(), profileDisplayName);

    case addEditSessionDetailsRoute:
      return _getPageRoute(
          AddEditSessionDetailsScreen(), addEditSessionDetailsDisplayName);

    case sessionDetailsRoute:
      return _getPageRoute(
          const SessionDetailsScreen(), sessionDetailsDisplayName);

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

    default:
      return _getPageRoute(
          AppointmentsCalendarScreen(), appointmentDisplayName);
  }
}

PageRoute _getPageRoute(Widget child, String title) {
  locator<NavigationService>().currentTitle.value = title;
  return MaterialPageRoute(
    builder: (context) => child,
    settings: RouteSettings(name: title),
  );
}
