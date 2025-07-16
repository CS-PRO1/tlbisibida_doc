import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tlbisibida_doc/data/repo/dbPatients/db_patients_repo.dart';
import 'package:tlbisibida_doc/data/repo/dblabs/db_repo_labs.dart';

import 'package:tlbisibida_doc/domain/repo/labs/doc_repo_labs.dart';
import 'package:tlbisibida_doc/domain/repo/patients/doc_repo_patients.dart';

import 'package:tlbisibida_doc/presentation/labs/screens/cubit/labs_cubit.dart';
import 'package:tlbisibida_doc/presentation/patients/cubits/patients_cubit.dart';
import 'package:tlbisibida_doc/services/navigation/controllers.dart';

class FinanceProvider extends StatelessWidget {
  final Widget child;
  FinanceProvider({super.key, required this.child});
  final DocRepoLabs labsRepo = locator<DbRepoLabs>();
  final DocRepoPatients repoPatients = locator<DbPatientsRepo>();
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LabsCubit(labsRepo),
        ),
        BlocProvider(
          create: (context) => PatientsCubit(repoPatients),
        ),
      ],
      child: child,
    );
  }
}
