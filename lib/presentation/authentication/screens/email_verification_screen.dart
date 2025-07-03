import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tlbisibida_doc/components/default_button.dart';
import 'package:tlbisibida_doc/components/num_input.dart';
import 'package:tlbisibida_doc/constants/constants.dart';
import 'package:tlbisibida_doc/presentation/authentication/cubit/emails_cubit.dart';
import 'package:tlbisibida_doc/services/navigation/routes.dart';

// ignore: must_be_immutable
class EmailVerificationScreen extends StatelessWidget {
  EmailVerificationScreen({super.key});

  final TextEditingController codecontroller = TextEditingController();
  // String email = Get.arguments;
  String email = 'abnc@exmaple.com';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<EmailsCubit, String>(
        listener: (context, state) {},
        builder: (context, state) {
          return Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      'assets/teeth_pattern.png',
                    ),

                    // fit: BoxFit.,
                    repeat: ImageRepeat.repeat),
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color.fromARGB(149, 229, 243, 241),
                      cyan50,
                      cyan100,
                      cyan100,
                      // cyan200,
                      // cyan200,
                      cyan100,
                      cyan100,
                      cyan50,
                    ])),
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Center(
                child: ClipRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                    child: Container(
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(125, 241, 255, 253),
                          borderRadius: BorderRadius.circular(20)),
                      child: Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 15,
                              ),
                              Text('التحقق من البريد الإلكتروني',
                                  style: TextStyle(
                                    color: cyan500,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    shadows: [
                                      Shadow(
                                          color: const Color.fromARGB(
                                              112, 125, 117, 117),
                                          blurRadius: 2,
                                          offset: Offset(-1, 2))
                                    ],
                                  )),

                              SizedBox(
                                  height: 250,
                                  width: 250,
                                  child: Image(
                                    image: AssetImage(
                                        'assets/icons/email-verify.png'),
                                  )),
                              SizedBox(
                                height: 15,
                              ),

                              Text(
                                'أدخل رمز التحقق الذي تم إرساله إلى بريدك',
                                style: TextStyle(color: cyan500, fontSize: 16),
                              ),
                              Text(
                                email,
                                style: TextStyle(
                                  color: cyan300,
                                ),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Directionality(
                                textDirection: TextDirection.ltr,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    NumInput(context,
                                        controller: codecontroller),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    NumInput(context),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    NumInput(context),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    NumInput(context),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    NumInput(context),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    NumInput(context),
                                  ],
                                ),
                              ),
                              // SizedBox(
                              //   height: 5,
                              // ),
                              TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    'إرسال الكود مرة أخرى',
                                    style: TextStyle(
                                      color: cyan400,
                                      fontSize: 14,
                                    ),
                                  )),
                              SizedBox(
                                height: 15,
                              ),
                              defaultButton(
                                  text: 'تحقق',
                                  function: () {
                                    // controller.emailverification('email', codecontroller.text);
                                    context.go(rootRoute);
                                  }),
                              SizedBox(
                                height: 15,
                              ),
                              TextButton(
                                  onPressed: () {
                                    context.pop();
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'العودة إلى صفحة التسجيل',
                                        style: TextStyle(
                                          color: cyan400,
                                          fontSize: 14,
                                          // decoration: TextDecoration.underline,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Icon(
                                        Icons.arrow_circle_left_rounded,
                                        color: cyan400,
                                        size: 16,
                                      ),
                                    ],
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
