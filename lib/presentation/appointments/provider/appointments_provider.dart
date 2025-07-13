import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tlbisibida_doc/data/repo/dbAppointments/db_appointments_repo.dart';
import 'package:tlbisibida_doc/domain/repo/appointments/doc_repo_appointments.dart';
import 'package:tlbisibida_doc/presentation/appointments/cubits/appointments_cubit.dart';
import 'package:tlbisibida_doc/services/navigation/controllers.dart';

class AppointmentsProvider extends StatelessWidget {
  final Widget child;

  AppointmentsProvider({super.key, required this.child});

  final DocRepoAppointments repo = locator<DbAppointmentsRepo>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppointmentsCubit(repo),
      child: child,
    );
  }
}
