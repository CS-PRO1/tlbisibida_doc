import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tlbisibida_doc/data/repo/dbAuth/db_repo_auth.dart';
import 'package:tlbisibida_doc/domain/repo/auth/doc_repo_auth.dart';
import 'package:tlbisibida_doc/presentation/authentication/cubit/auth_cubit.dart';
import 'package:tlbisibida_doc/services/navigation/controllers.dart';

class LoginProvider extends StatelessWidget {
  final Widget child;
  LoginProvider({super.key, required this.child});
  final DocRepoAuth repo = locator<DbRepoAuth>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(repo),
      child: child,
    );
  }
}

class RegisterProvider extends StatelessWidget {
  final Widget child;
  RegisterProvider({super.key, required this.child});
  final DocRepoAuth repo = locator<DbRepoAuth>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(repo),
      child: child,
    );
  }
}

class Register2Provider extends StatelessWidget {
  final Widget child;
  Register2Provider({super.key, required this.child});
  final DocRepoAuth repo = locator<DbRepoAuth>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(repo),
      child: child,
    );
  }
}
