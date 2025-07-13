import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tlbisibida_doc/data/repo/dbPatients/db_patients_repo.dart';
import 'package:tlbisibida_doc/domain/repo/patients/doc_repo_patients.dart';
import 'package:tlbisibida_doc/presentation/patients/cubits/patients_cubit.dart';
import 'package:tlbisibida_doc/services/navigation/controllers.dart';

class PatientsProvider extends StatelessWidget {
  final Widget child;
  PatientsProvider({super.key, required this.child});
  final DocRepoPatients repo = locator<DbPatientsRepo>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PatientsCubit>(
      create: (context) => PatientsCubit(repo),
      child: child,
    );
  }
}
