import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tlbisibida_doc/data/repo/dbCases/db_repo_cases.dart';
import 'package:tlbisibida_doc/domain/repo/cases/doc_repo_cases.dart';
import 'package:tlbisibida_doc/presentation/labs/screens/cases/case_details_screen.dart';
import 'package:tlbisibida_doc/presentation/labs/screens/cases/cubit/cases_cubit.dart';
import 'package:tlbisibida_doc/services/navigation/controllers.dart';

class CaseDetailsProvider extends StatelessWidget {
  CaseDetailsProvider({super.key});
  final DocRepoCases repo = locator<DbDocRepoCases>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CasesCubit(repo),
      child: CaseDetailsScreen(),
    );
  }
}
