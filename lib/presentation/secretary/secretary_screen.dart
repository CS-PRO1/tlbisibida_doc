import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:tlbisibida_doc/constants/constants.dart';
import 'package:tlbisibida_doc/presentation/secretary/component/carousel.dart';
import 'package:tlbisibida_doc/presentation/secretary/cubit/secretary_cubit.dart';
import 'package:tlbisibida_doc/presentation/secretary/cubit/secretary_states.dart';
import 'package:tlbisibida_doc/presentation/secretary/dialogs/sec_add_edit_dialog.dart';

class SecretaryScreen extends StatelessWidget {
  const SecretaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<SecCubit, SecretaryState>(
        listener: (context, state) {
          if (state is SecretaryError) {
            AnimatedSnackBar.material(
              state.message.isNotEmpty
                  ? state.message
                  : 'حدث خطأ ما، يرجى المحاولة لاحقاً',
              type: AnimatedSnackBarType.error,
              mobileSnackBarPosition: MobileSnackBarPosition.bottom,
              duration: Duration(seconds: 3),
              animationCurve: Easing.standard,
            ).show(context);
          } else if (state is SecretaryAdded) {
            AnimatedSnackBar.material(
              'تمت إضافة السكرتير/ة بنجاح!',
              type: AnimatedSnackBarType.success,
              mobileSnackBarPosition: MobileSnackBarPosition.bottom,
              duration: Duration(seconds: 3),
              animationCurve: Easing.standard,
            ).show(context);
          } else if (state is SecretaryUpdated) {
            AnimatedSnackBar.material(
              'تم تحديث بيانات السكرتير/ة بنجاح!',
              type: AnimatedSnackBarType.success,
              mobileSnackBarPosition: MobileSnackBarPosition.bottom,
              duration: Duration(seconds: 3),
              animationCurve: Easing.standard,
            ).show(context);
          } else if (state is SecretaryDeleted) {
            AnimatedSnackBar.material(
              'تم حذف السكرتير/ة بنجاح!',
              type: AnimatedSnackBarType.success,
              mobileSnackBarPosition: MobileSnackBarPosition.bottom,
              duration: Duration(seconds: 3),
              animationCurve: Easing.standard,
            ).show(context);
          }
        },
        builder: (context, state) {
          if (state is SecretaryLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is SecretaryError) {
            return Center(child: Text('حدث خطأ أثناء تحميل السكرتارية'));
          } else if (state is SecretaryLoaded) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 15,
                    ),
                    SizedBox(height: 680, child: Carousel()),
                  ],
                ),
              ),
            );
          } else {
            // Initial or other states
            return const Center(child: Text('لا توجد بيانات للعرض'));
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return secAddEditDialog(context, 'إضافة سكرتير/ة');
            },
          );
        },
        mini: true,
        backgroundColor: cyan400,
        foregroundColor: white,
        shape: RoundedRectangleBorder(
            side: BorderSide(color: cyan600, width: 1.5),
            borderRadius: BorderRadius.circular(10)),
        child: Icon(
          Icons.add,
          size: 28,
        ),
      ),
    );
  }
}
