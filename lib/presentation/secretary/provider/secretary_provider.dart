import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tlbisibida_doc/data/repo/db_doc_repo.dart';
import 'package:tlbisibida_doc/domain/repo/doc_repo.dart';
import 'package:tlbisibida_doc/presentation/secretary/cubit/secretary_cubit.dart';
import 'package:tlbisibida_doc/presentation/secretary/secretary_screen.dart';
import 'package:tlbisibida_doc/services/navigation/controllers.dart';

class HistoryProvider extends StatelessWidget {
  HistoryProvider({super.key});
  final DocRepo repo = locator<DbDocRepo>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SecCubit(repo),
      child: SecretaryScreen(),
    );
  }
}
