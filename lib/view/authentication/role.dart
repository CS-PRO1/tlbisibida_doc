import 'package:flutter/material.dart';
import 'package:tlbisibida_doc/components/tusk_icons.dart';
import 'package:tlbisibida_doc/constants/constants.dart';
import 'package:tlbisibida_doc/services/navigation/locator.dart';
import 'package:tlbisibida_doc/services/navigation/navigation_service.dart';
import 'package:tlbisibida_doc/services/navigation/routes.dart';

class RoleScreen extends StatelessWidget {
  const RoleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        color: cyan50,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 300,
                height: 150,
                decoration: BoxDecoration(
                    color: cyan200,
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
              SizedBox(
                height: 80,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, loginRoute);
                    },
                    child: Container(
                      height: 220,
                      width: 150,
                      decoration: BoxDecoration(
                          color: cyan100,
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
                                  color: cyan600, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, loginRoute);
                    },
                    child: Container(
                      width: 150,
                      height: 220,
                      decoration: BoxDecoration(
                          color: cyan100,
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
                                  color: cyan600, fontWeight: FontWeight.bold),
                            ),
                          ],
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
