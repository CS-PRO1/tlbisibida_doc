import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tlbisibida_doc/components/default_button.dart';
import 'package:tlbisibida_doc/components/image_gallery.dart';
import 'package:tlbisibida_doc/constants/constants.dart';
import 'package:tlbisibida_doc/presentation/patients/cubits/patient_states.dart';
import 'package:tlbisibida_doc/presentation/patients/cubits/patients_cubit.dart';
import 'package:tlbisibida_doc/services/navigation/routes.dart';

class SessionDetailsScreen extends StatelessWidget {
  const SessionDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<PatientsCubit, PatientsState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          final cubit = context.read<PatientsCubit>();
          cubit.getPatientSessionImages(cubit.treatmentDetails?.id ?? 0);
          return Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: cyan100,
                          borderRadius: BorderRadius.circular(30)),
                      height: MediaQuery.of(context).size.height / 2.9,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              SizedBox(
                                height: 15,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    'اسم المريض',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  Text(
                                    cubit.patientDetails?.fullName ?? '',
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
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        'تاريخ المعالجة',
                                        style: TextStyle(fontSize: 16),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        cubit.treatmentDetails?.createdAt ?? '',
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
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        'نوع المعالجة',
                                        style: TextStyle(fontSize: 16),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        cubit.treatmentDetails?.type ?? '',
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
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'الوصف',
                                      style: TextStyle(
                                          fontSize: 16, color: cyan600),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text(
                                        textAlign: TextAlign.center,
                                        cubit.treatmentDetails?.details ?? '',
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
                          color: cyan100,
                          borderRadius: BorderRadius.circular(30)),
                      // height: MediaQuery.of(context).size.height / 5,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              'حساب الجلسة',
                              style: TextStyle(fontSize: 16),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              cubit.treatmentDetails?.cost.toString() ?? '',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: cyan600,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: cyan100,
                          borderRadius: BorderRadius.circular(20)),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: ImageGallery(images: cubit.imgList),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    defaultButton(
                        text: 'إرسال الحالة إلى مخبر',
                        function: () =>
                            // locator<NavigationService>().navigateTo(sendCaseToLabRoute),
                            // Navigator.pushNamed(context, sendCaseToLabRoute))
                            context.push(sendCaseToLabRoute)),
                    SizedBox(
                      height: 30,
                    )
                  ],
                ),
              ));
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigator.pushNamed(context, editSessionDetailsRoute);
          context.push(editSessionDetailsRoute);
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
