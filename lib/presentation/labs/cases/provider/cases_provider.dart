import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tlbisibida_doc/data/repo/dbCases/db_repo_cases.dart';
import 'package:tlbisibida_doc/domain/repo/cases/doc_repo_cases.dart';
import 'package:tlbisibida_doc/presentation/labs/cases/cubit/cases_cubit.dart';
import 'package:tlbisibida_doc/services/navigation/controllers.dart';

class CasesProvider extends StatelessWidget {
  final Widget child;
  CasesProvider({super.key, required this.child});
  final DocRepoCases repo = locator<DbDocRepoCases>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CasesCubit(repo),
      child: child,
    );
  }
}
