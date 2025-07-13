import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tlbisibida_doc/data/repo/dblabs/db_repo_labs.dart';
import 'package:tlbisibida_doc/domain/repo/labs/doc_repo_labs.dart';
import 'package:tlbisibida_doc/presentation/labs/screens/cubit/labs_cubit.dart';
import 'package:tlbisibida_doc/services/navigation/controllers.dart';

class LabsProvider extends StatelessWidget {
  final Widget child;
  LabsProvider({super.key, required this.child});
  final DocRepoLabs repo = locator<DbRepoLabs>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LabsCubit(repo),
      child: child,
    );
  }
}
