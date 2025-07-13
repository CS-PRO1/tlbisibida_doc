import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tlbisibida_doc/components/bottom_nav.dart'; // Re-use your bottom nav
import 'package:tlbisibida_doc/components/top_nav.dart'; // Re-use your top nav
import 'package:tlbisibida_doc/presentation/authentication/provider/auth_provider.dart';
import 'package:tlbisibida_doc/services/navigation/routes.dart';
import 'package:tlbisibida_doc/presentation/Sessions/screens/add_session_details_screen%20.dart';
import 'package:tlbisibida_doc/presentation/Sessions/screens/edit_session_details_screen.dart';
import 'package:tlbisibida_doc/presentation/Sessions/screens/session_details_screen.dart';
import 'package:tlbisibida_doc/presentation/about/about.dart';
import 'package:tlbisibida_doc/presentation/appointments/appointments_calendar_screen.dart';
import 'package:tlbisibida_doc/presentation/appointments/new_appointment_screen.dart';
import 'package:tlbisibida_doc/presentation/authentication/screens/email_verification_screen.dart';
import 'package:tlbisibida_doc/presentation/authentication/screens/role.dart';
import 'package:tlbisibida_doc/presentation/finance/finance_center_screen.dart';
import 'package:tlbisibida_doc/presentation/inventory/screens/inventory_screen.dart';
import 'package:tlbisibida_doc/presentation/labs/cases/case_details_screen.dart';
import 'package:tlbisibida_doc/presentation/labs/screens/lab_info_screen.dart';
import 'package:tlbisibida_doc/presentation/labs/screens/mylabs_screen.dart';
import 'package:tlbisibida_doc/presentation/labs/screens/new_labs_list_screen.dart';
import 'package:tlbisibida_doc/presentation/patients/screens/patient_info_screen.dart';
import 'package:tlbisibida_doc/presentation/patients/screens/patients_list_screen.dart';
import 'package:tlbisibida_doc/presentation/labs/cases/send_case_to_lab_screen.dart';
import 'package:tlbisibida_doc/presentation/profile/profile_edit_screen.dart';
import 'package:tlbisibida_doc/presentation/profile/profile_screen.dart';
import 'package:tlbisibida_doc/presentation/secretary/secretary_screen.dart';
import 'package:tlbisibida_doc/presentation/statistics/statistics_screen.dart';
import 'package:tlbisibida_doc/presentation/inventory/screens/item_list_screen.dart'; // Ensure this is imported
import 'package:tlbisibida_doc/presentation/patients/providers/patients_provider.dart';
import 'package:tlbisibida_doc/presentation/labs/screens/provider/labs_provider.dart';
import 'package:tlbisibida_doc/presentation/labs/cases/provider/case_details_provider.dart';
import 'package:tlbisibida_doc/presentation/profile/provider/profile_provider.dart';
import 'package:tlbisibida_doc/presentation/secretary/provider/secretary_provider.dart';
import 'package:tlbisibida_doc/presentation/appointments/provider/appointments_provider.dart';
import 'package:tlbisibida_doc/presentation/authentication/screens/login.dart';
import 'package:tlbisibida_doc/presentation/authentication/screens/register.dart';
import 'package:tlbisibida_doc/presentation/authentication/screens/register 2.dart';

// Define a map to easily get display names from route paths
final Map<String, String> routeDisplayNames = {
  rootRoute: appointmentDisplayName,
  addAppointmentRoute: addAppointmentDisplayName,
  financeRoute: financeDisplayName,
  inventoryRoute: inventoryDisplayName,
  itemListRoute: itemListDisplayName,
  caseDetailsRoute: caseDetailsDisplayName,
  labsListRoute: labsListDisplayName,
  myLabsListRoute: myLabsListDisplayName,
  labInfoRoute: labInfoDisplayName,
  sendCaseToLabRoute: sendCaseToLabDisplayName,
  patientInfoRoute: patientInfoDisplayName,
  patientListRoute: patientListDisplayName,
  profileEditRoute: profileEditDisplayName,
  profileRoute: profileDisplayName,
  addSessionDetailsRoute: addSessionDetailsDisplayName,
  editSessionDetailsRoute: editSessionDetailsDisplayName,
  sessionDetailsRoute: sessionDetailsDisplayName,
  secretaryRoute: secretaryDisplayName,
  statisticsRoute: statisticsDisplayName,
  loginRoute: loginDisplayName,
  aboutRoute: aboutDisplayName,
  registerRoute: registerDisplayName,
  roleRoute: roleDisplayName,
  emailVerificationRoute: emailVerificationDisplayName,
  register2Route: register2DisplayName,
};

// Define the order of routes for the bottom navigation bar
final List<String> bottomNavRoutes = [
  patientListRoute, // Index 0
  financeRoute, // Index 1
  rootRoute, // Index 2 (Appointments)
  inventoryRoute, // Index 3
  myLabsListRoute, // Index 4
];

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: rootRoute, // Set initial route
    routes: [
      // Top-level routes that should NOT have any app bar (e.g., authentication)
      GoRoute(
        path: loginRoute,
        builder: (context, state) => LoginProvider(child: LoginScreen()),
      ),
      GoRoute(
        path: registerRoute,
        builder: (context, state) => RegisterProvider(child: Register()),
      ),
      GoRoute(
        path: register2Route,
        builder: (context, state) => Register2Provider(child: Register2()),
      ),
      GoRoute(
        path: roleRoute,
        builder: (context, state) => RoleScreen(),
      ),
      GoRoute(
        path: emailVerificationRoute,
        builder: (context, state) => EmailVerificationScreen(),
      ),

      // Top-level routes that should have an app bar but NO bottom nav
      GoRoute(
        path: addAppointmentRoute,
        builder: (context, state) => Scaffold(
          appBar: TopNavigationBar(
            title: routeDisplayNames[addAppointmentRoute]!,
            showBackButton: context.canPop(),
          ),
          body: NewAppointmentScreen(),
        ),
      ),
      GoRoute(
        path: caseDetailsRoute,
        builder: (context, state) => Scaffold(
          appBar: TopNavigationBar(
            title: routeDisplayNames[caseDetailsRoute]!,
            showBackButton: context.canPop(),
          ),
          body: CaseDetailsProvider(child: CaseDetailsScreen()),
        ),
      ),
      GoRoute(
        path: labInfoRoute,
        builder: (context, state) => Scaffold(
          appBar: TopNavigationBar(
            title: routeDisplayNames[labInfoRoute]!,
            showBackButton: context.canPop(),
          ),
          body: LabsProvider(child: LabInfoScreen()),
        ),
      ),
      GoRoute(
        path: sendCaseToLabRoute,
        builder: (context, state) => Scaffold(
          appBar: TopNavigationBar(
            title: routeDisplayNames[sendCaseToLabRoute]!,
            showBackButton: context.canPop(),
          ),
          body: SendCaseToLabScreen(),
        ),
      ),
      GoRoute(
        path: patientInfoRoute,
        builder: (context, state) {
          final patientId = state.extra as int? ?? 0;
          return Scaffold(
            appBar: TopNavigationBar(
              title: routeDisplayNames[patientInfoRoute]!,
              showBackButton: context.canPop(),
            ),
            body: PatientsProvider(
                child: PatientsProvider(
              child: PatientInfoScreen(patientId: patientId),
            )),
          );
        },
      ),
      GoRoute(
        path: profileEditRoute,
        builder: (context, state) => Scaffold(
          appBar: TopNavigationBar(
            title: routeDisplayNames[profileEditRoute]!,
            showBackButton: context.canPop(),
          ),
          body: ProfileProvider(child: ProfileEditScreen()),
        ),
      ),
      GoRoute(
        path: addSessionDetailsRoute,
        builder: (context, state) => Scaffold(
          appBar: TopNavigationBar(
            title: routeDisplayNames[addSessionDetailsRoute]!,
            showBackButton: context.canPop(),
          ),
          body: AddSessionDetailsScreen(),
        ),
      ),
      GoRoute(
        path: editSessionDetailsRoute,
        builder: (context, state) => Scaffold(
          appBar: TopNavigationBar(
            title: routeDisplayNames[editSessionDetailsRoute]!,
            showBackButton: context.canPop(),
          ),
          body: EditSessionDetailsScreen(),
        ),
      ),
      GoRoute(
        path: sessionDetailsRoute,
        builder: (context, state) => Scaffold(
          appBar: TopNavigationBar(
            title: routeDisplayNames[sessionDetailsRoute]!,
            showBackButton: context.canPop(),
          ),
          body: const SessionDetailsScreen(),
        ),
      ),
      GoRoute(
        path: aboutRoute,
        builder: (context, state) => Scaffold(
          appBar: TopNavigationBar(
            title: routeDisplayNames[aboutRoute]!,
            showBackButton: context.canPop(),
          ),
          body: About(),
        ),
      ),
      GoRoute(
        path: itemListRoute,
        builder: (context, state) => Scaffold(
          appBar: TopNavigationBar(
            title: routeDisplayNames[itemListRoute]!,
            showBackButton: context.canPop(),
          ),
          body: ItemListScreen(),
        ),
      ),
      GoRoute(
        path: labsListRoute,
        builder: (context, state) => Scaffold(
          appBar: TopNavigationBar(
            title: routeDisplayNames[labsListRoute]!,
            showBackButton: context.canPop(),
          ),
          body: const LabsListScreen(),
        ),
      ),
      GoRoute(
        path: statisticsRoute,
        builder: (context, state) => Scaffold(
          appBar: TopNavigationBar(
            title: routeDisplayNames[statisticsRoute]!,
            showBackButton: context.canPop(),
          ),
          body: StatisticsScreen(),
        ),
      ),
      GoRoute(
        path:
            secretaryRoute, // Moved secretaryRoute out of ShellRoute, assuming it's a top-level screen without bottom nav
        builder: (context, state) => Scaffold(
          appBar: TopNavigationBar(
            title: routeDisplayNames[secretaryRoute]!,
            showBackButton: context.canPop(),
          ),
          body: HistoryProvider(child: SecretaryScreen()),
        ),
      ),

      // ShellRoute for main tab routes that DO show the bottom navigation bar and TopNavigationBar
      ShellRoute(
        builder: (context, state, child) {
          final String currentPath = state.uri.toString();
          final String title = routeDisplayNames[currentPath] ?? 'LambdaDent';
          final bool showBackButton = context.canPop();

          // Determine current index for bottom nav based on current route
          int currentIndex = bottomNavRoutes.indexOf(currentPath);
          // If the current path is a nested route, find its parent tab
          if (currentIndex == -1) {
            if (currentPath.startsWith(patientListRoute))
              currentIndex = 0;
            else if (currentPath.startsWith(financeRoute))
              currentIndex = 1;
            else if (currentPath.startsWith(rootRoute))
              currentIndex = 2;
            else if (currentPath.startsWith(inventoryRoute))
              currentIndex = 3;
            else if (currentPath.startsWith(myLabsListRoute)) currentIndex = 4;
          }

          return SafeArea(
            top: false,
            child: Scaffold(
              appBar: TopNavigationBar(
                title: title,
                showBackButton: showBackButton,
              ),
              body: child, // The content of the current GoRoute
              bottomNavigationBar: CustomBottomNavigationBar(
                currentPage: currentIndex,
                onTabChanged: (index) {
                  // Navigate to the corresponding route when a tab is changed
                  context.go(bottomNavRoutes[index]);
                },
              ),
            ),
          );
        },
        routes: [
          // These are the main tab routes (direct children of ShellRoute)
          GoRoute(
            path: rootRoute, // /
            builder: (context, state) =>
                AppointmentsProvider(child: AppointmentsCalendarScreen()),
          ),
          GoRoute(
            path: financeRoute, // /finance
            builder: (context, state) => FinanceCenterScreen(),
          ),
          GoRoute(
            path: inventoryRoute, // /inventory
            builder: (context, state) => InventoryScreen(),
          ),
          GoRoute(
            path: patientListRoute, // /patient_list
            builder: (context, state) =>
                PatientsProvider(child: PatientsListScreen()),
          ),
          GoRoute(
            path: myLabsListRoute, // /my_labs_list
            builder: (context, state) => LabsProvider(child: MylabsScreen()),
          ),
          GoRoute(
            path: profileRoute, // /doc_profile
            builder: (context, state) => ProfileScreen(),
            routes: [
              GoRoute(
                path: 'edit', // /doc_profile/edit (nested under profile)
                builder: (context, state) => ProfileEditScreen(),
              ),
            ],
          ),
          // Secretary and Statistics are now top-level routes, so they are not here.
        ],
      ),
    ],
    errorBuilder: (context, state) => Scaffold(
      appBar: AppBar(title: const Text('Error')),
      body: Center(child: Text('Error: ${state.error}')),
    ),
  );
}
