import 'package:flip_card/flip_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tlbisibida_doc/components/default_button.dart';
import 'package:tlbisibida_doc/components/image_gallery.dart';
import 'package:tlbisibida_doc/constants/constants.dart';
import 'package:tlbisibida_doc/services/navigation/routes.dart';
import 'package:tlbisibida_doc/presentation/patients/components/dialogs/image_pick_dialog.dart';
import 'package:tlbisibida_doc/presentation/patients/components/dialogs/payment_management_dialog.dart';
import 'package:tlbisibida_doc/presentation/patients/components/tables/appointment_log_table.dart';

class PatientInfoScreen extends StatelessWidget {
  const PatientInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cyan50,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              FlipCard(
                front: Container(
                  decoration: BoxDecoration(
                      color: cyan100, borderRadius: BorderRadius.circular(30)),
                  height: MediaQuery.of(context).size.height / 2,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 15,
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'اسماعيل احمد كنباوي',
                                style: TextStyle(
                                    fontSize: 18,
                                    color: cyan600,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                'الرقم',
                                style: TextStyle(fontSize: 16),
                              ),
                              Text(
                                '0996677881',
                                style: TextStyle(
                                    fontSize: 18,
                                    color: cyan600,
                                    fontWeight: FontWeight.bold),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    'مدخن؟',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'نعم',
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    'العمر',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    '26',
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
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    'الادوية',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'هيبارين',
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    'الامراض',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'سكري',
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
                          SizedBox(
                            height: 15,
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                'الرصيد الحالي',
                                style: TextStyle(fontSize: 16),
                              ),
                              Text(
                                textDirection: TextDirection.ltr,
                                '-250,000',
                                style: TextStyle(
                                    fontSize: 18,
                                    color: cyan600,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          defaultButton(
                              text: ' المدفوعات',
                              function: () {
                                showDialog(
                                  context: context,
                                  builder: (context) =>
                                      PaymentManagementDialog(),
                                );
                              })
                        ],
                      ),
                    ),
                  ),
                ),
                back: Container(
                    decoration: BoxDecoration(
                        color: cyan100,
                        borderRadius: BorderRadius.circular(30)),
                    height: MediaQuery.of(context).size.height / 2,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: ImageGallery(images: [
                        //TODO ADD Patient IMGs Get function
                      ]),
                    )),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                clipBehavior: Clip.antiAlias,
                width: 350,
                height: MediaQuery.of(context).size.height / 3.5,
                decoration: BoxDecoration(
                    color: cyan100, borderRadius: BorderRadius.circular(30)),
                child: SingleChildScrollView(child: AppointmentLogTable()),
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 35,
            width: 35,
            child: FloatingActionButton(
              heroTag: 'add_images',
              onPressed: () {
                // Navigator.pushNamed(context, addSessionDetailsRoute);
                // context.push(addSessionDetailsRoute);
                showDialog(
                    context: context,
                    builder: (context) => imagePickDialog(context));
              },
              mini: true,
              backgroundColor: cyan50op,
              elevation: 0,
              foregroundColor: cyan400,
              shape: RoundedRectangleBorder(
                  side: const BorderSide(color: cyan500, width: 1),
                  borderRadius: BorderRadius.circular(20)),
              child: const Icon(
                // CupertinoIcons.photo,
                Icons.photo_camera_rounded,
                size: 22,
              ),
            ),
          ),
          SizedBox(
            height: 2,
          ),
          FloatingActionButton(
            heroTag: 'add_session',
            onPressed: () {
              // Navigator.pushNamed(context, addSessionDetailsRoute);
              context.push(addSessionDetailsRoute);
            },
            mini: true,
            backgroundColor: cyan400,
            foregroundColor: white,
            shape: RoundedRectangleBorder(
                side: const BorderSide(color: cyan600, width: 1.5),
                borderRadius: BorderRadius.circular(10)),
            child: const Icon(
              Icons.add,
              size: 28,
            ),
          ),
        ],
      ),
    );
  }
}
