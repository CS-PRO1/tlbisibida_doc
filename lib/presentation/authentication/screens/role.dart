import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tlbisibida_doc/components/tusk_icons.dart';
import 'package:tlbisibida_doc/constants/constants.dart';
import 'package:tlbisibida_doc/services/Cache/cache_helper.dart';
import 'package:tlbisibida_doc/services/navigation/routes.dart';

class RoleScreen extends StatelessWidget {
  const RoleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
        height: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                  child: Container(
                    width: 300,
                    height: 150,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(127, 143, 229, 220),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: cyan500, width: .5)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            'أهلا بكم في تطبيق',
                            style: TextStyle(color: cyan600),
                          ),
                          Text(
                            'TUSK',
                            style: TextStyle(
                              color: white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            'يمكنكم تسجيل الدخول كـَ',
                            style: TextStyle(color: cyan600),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 80,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: () {
                      // Navigator.pushNamed(context, loginRoute);
                      context.push(loginRoute);
                      CacheHelper.setString('guard', 'dentist');
                    },
                    child: ClipRect(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                        child: Container(
                          height: 220,
                          width: 150,
                          decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: cyan600, width: .5)),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              children: [
                                Icon(
                                  TuskIcons.dentist,
                                  size: 100,
                                  color: cyan600,
                                ),
                                SizedBox(
                                  height: 25,
                                ),
                                Container(
                                  color: cyan500,
                                  height: .5,
                                  width: 100,
                                ),
                                SizedBox(
                                  height: 25,
                                ),
                                Text(
                                  'طبيب أسنان',
                                  style: TextStyle(
                                      color: cyan600,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      context.push(loginRoute);
                      CacheHelper.setString('guard', 'secretary');
                    },
                    child: ClipRect(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                        child: Container(
                          width: 150,
                          height: 220,
                          decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: cyan600, width: .5)),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              children: [
                                Icon(
                                  TuskIcons.secretary,
                                  size: 120,
                                  color: cyan600,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Container(
                                  color: cyan500,
                                  height: .5,
                                  width: 100,
                                ),
                                SizedBox(
                                  height: 25,
                                ),
                                Text(
                                  'سكرتير',
                                  style: TextStyle(
                                      color: cyan600,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
