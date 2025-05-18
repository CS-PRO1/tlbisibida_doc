import 'package:flutter/material.dart';
import 'package:tlbisibida_doc/components/default_button.dart';
import 'package:tlbisibida_doc/components/image_gallery.dart';
import 'package:tlbisibida_doc/constants/constants.dart';
import 'package:tlbisibida_doc/services/navigation/locator.dart';
import 'package:tlbisibida_doc/services/navigation/navigation_service.dart';
import 'package:tlbisibida_doc/services/navigation/routes.dart';

class SessionDetailsScreen extends StatelessWidget {
  const SessionDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                    color: cyan100, borderRadius: BorderRadius.circular(30)),
                height: MediaQuery.of(context).size.height / 2.9,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 15,
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              'اسماعيل احمد كنباوي',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: cyan600,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'اسم المريض',
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          color: cyan400,
                          height: .5,
                          width: 250,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  'تاريخ المعالجة',
                                  style: TextStyle(fontSize: 16),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  '22/4/2025',
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: cyan600,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            const SizedBox(
                              width: 50,
                            ),
                            Container(
                              color: cyan400,
                              width: .5,
                              height: 50,
                            ),
                            const SizedBox(
                              width: 50,
                            ),
                            const Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  'نوع المعالجة',
                                  style: TextStyle(fontSize: 16),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'سحب عصب',
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: cyan600,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          color: cyan400,
                          height: .5,
                          width: 250,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        SingleChildScrollView(
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'الوصف',
                                style: TextStyle(fontSize: 16, color: cyan600),
                              ),
                              // const SizedBox(
                              //   height: 10,
                              // ),
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  textAlign: TextAlign.center,
                                  'سحب عصب مع تخدير موضعي سحب عصب مع تخدير موضعي سحب عصب مع تخدير موضعي سحب عصب مع تخدير موضعي سحب عصب مع تخدير موضعي سحب عصب مع تخدير موضعي سحب عصب مع تخدير موضعي سحب عصب مع تخدير موضعي سحب عصب مع تخدير موضعي سحب عصب مع تخدير موضعي سحب عصب مع تخدير موضعي سحب عصب مع تخدير موضعي سحب عصب مع تخدير موضعي سحب عصب مع تخدير موضعي سحب عصب مع تخدير موضعي سحب عصب مع تخدير موضعي سحب عصب مع تخدير موضعي سحب عصب مع تخدير موضعي سحب عصب مع تخدير موضعي سحب عصب مع تخدير موضعي سحب عصب مع تخدير موضعي سحب عصب مع تخدير موضعي سحب عصب مع تخدير موضعي سحب عصب مع تخدير موضعي سحب عصب مع تخدير موضعي سحب عصب مع تخدير موضعي سحب عصب مع تخدير موضعي',
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                    color: cyan100, borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ImageGallery(
                    imageUrls: [
                      'https://traveltodentist.com/wp-content/uploads/2020/04/dinti-noi-zirconiu-ceramica.jpg',
                      'https://traveltodentist.com/wp-content/uploads/2020/04/dinti-afectati-de-parodontoza-1.jpg',
                      'https://traveltodentist.com/wp-content/uploads/2020/04/caz-clinic-inainte-si-dupa-tratament-parodontoza-moldova.jpg',
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              defaultButton(
                  text: 'إرسال الحالة إلى مخبر',
                  function: () =>
                      // locator<NavigationService>().navigateTo(sendCaseToLabRoute),
                      Navigator.pushNamed(context, sendCaseToLabRoute))
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, editSessionDetailsRoute);
        },
        mini: true,
        backgroundColor: cyan400,
        foregroundColor: white,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: cyan600, width: 1.5),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(
          Icons.edit_rounded,
          size: 22,
        ),
      ),
    );
  }
}
