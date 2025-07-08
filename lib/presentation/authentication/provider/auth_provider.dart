import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tlbisibida_doc/data/repo/dbAuth/db_repo_auth.dart';
import 'package:tlbisibida_doc/domain/repo/auth/doc_repo_auth.dart';
import 'package:tlbisibida_doc/presentation/authentication/cubit/auth_cubit.dart';
import 'package:tlbisibida_doc/presentation/authentication/screens/login.dart';
import 'package:tlbisibida_doc/presentation/authentication/screens/register%202.dart';
import 'package:tlbisibida_doc/presentation/authentication/screens/register.dart';
import 'package:tlbisibida_doc/services/navigation/controllers.dart';

class LoginProvider extends StatelessWidget {
  LoginProvider({super.key});
  final DocRepoAuth repo = locator<DbRepoAuth>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(repo),
      child: LoginScreen(),
    );
  }
}

class RegisterProvider extends StatelessWidget {
  RegisterProvider({super.key});
  final DocRepoAuth repo = locator<DbRepoAuth>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(repo),
      child: Register(),
    );
  }
}

class Register2Provider extends StatelessWidget {
  Register2Provider({super.key});
  final DocRepoAuth repo = locator<DbRepoAuth>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(repo),
      child: Register2(),
    );
  }
}
