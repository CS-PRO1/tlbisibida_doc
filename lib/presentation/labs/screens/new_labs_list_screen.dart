import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tlbisibida_doc/components/default_button.dart';
import 'package:tlbisibida_doc/components/tusk_icons.dart';
import 'package:tlbisibida_doc/constants/constants.dart';

import 'package:tlbisibida_doc/services/navigation/routes.dart';

class LabsListScreen extends StatelessWidget {
  const LabsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cyan50,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Container(
                color: cyan200,
                height: 200,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 20,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: cyan100,
                            borderRadius: BorderRadius.circular(30)),
                        height: 180,
                        child: const Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                TuskIcons.lab_icon,
                                size: 100,
                                color: cyan500,
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                'مخبر الحموي',
                                style: TextStyle(color: cyan600),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: cyan100,
                            borderRadius: BorderRadius.circular(30)),
                        height: 180,
                        child: const Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                TuskIcons.lab_icon,
                                size: 100,
                                color: cyan500,
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                'مخبر الحموي',
                                style: TextStyle(color: cyan600),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: cyan100,
                            borderRadius: BorderRadius.circular(30)),
                        height: 180,
                        child: const Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.home_repair_service_rounded,
                                size: 100,
                                color: cyan500,
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                'مخبر الحموي',
                                style: TextStyle(color: cyan600),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // SizedBox(
            //   height: 30,
            // ),
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                  color: cyan100,
                  borderRadius: BorderRadius.all(Radius.circular(30))),
              height: 500,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Icon(Icons.business),
                          Text(
                            'مخبر الحموي',
                            style: TextStyle(color: cyan600, fontSize: 22),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        color: cyan300,
                        height: .5,
                        width: 200,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Column(
                            children: [
                              Text('الاختصاص'),
                              SizedBox(
                                height: 10,
                              ),
                              Text('تقويم'),
                            ],
                          ),
                          Container(
                            color: cyan300,
                            height: 50,
                            width: .5,
                          ),
                          const Column(
                            children: [
                              Text('العنوان'),
                              SizedBox(
                                height: 10,
                              ),
                              Text('المرجة'),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        color: cyan300,
                        height: .5,
                        width: 200,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              Text('0999999999'),
                              SizedBox(
                                height: 10,
                              ),
                              Text('0988888888'),
                            ],
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text('ارقام التواصل'),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        color: cyan300,
                        height: .5,
                        width: 200,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              Text('9-4'),
                              SizedBox(
                                height: 10,
                              ),
                              Text('6-10'),
                            ],
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text('أوقات الدوام '),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        color: cyan300,
                        height: .5,
                        width: 200,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text('ابو تحسين'),
                          SizedBox(
                            width: 20,
                          ),
                          Text(' مدير المخبر '),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        color: cyan300,
                        height: .5,
                        width: 200,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      defaultButton(
                          text: ' طلب انضمام',
                          function: () {
                            // showDialog(
                            //   context: context,
                            //   builder: (context) => PaymentManagementDialog(),
                            // );
                            // locator<NavigationService>()
                            //     .navigateTo(labInfoRoute);
                            // Navigator.pushNamed(context, labInfoRoute);
                                                    context.push(labInfoRoute);

                          }),
                      const SizedBox(
                        height: 50,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
