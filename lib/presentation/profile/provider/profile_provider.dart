import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tlbisibida_doc/data/repo/dbAuth/db_repo_profile.dart';
import 'package:tlbisibida_doc/domain/repo/auth/doc_repo_profile.dart';
import 'package:tlbisibida_doc/presentation/profile/cubit/profile_cubit.dart';
import 'package:tlbisibida_doc/presentation/profile/profile_screen.dart';
import 'package:tlbisibida_doc/services/navigation/controllers.dart';

class ProfileProvider extends StatelessWidget {
  ProfileProvider({super.key});
  final DocRepoProfile repo = locator<DbRepoProfile>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit(repo),
      child: ProfileScreen(),
    );
  }
}
