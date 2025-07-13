import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:tlbisibida_doc/components/image_gallery.dart';
import 'package:tlbisibida_doc/presentation/labs/components/case_process_timeline.dart';
import 'package:tlbisibida_doc/components/default_button.dart';
import 'package:tlbisibida_doc/constants/constants.dart';
import 'package:tlbisibida_doc/presentation/labs/components/message_board.dart';
import 'package:tlbisibida_doc/presentation/labs/cases/cubit/cases_cubit.dart';
import 'package:tlbisibida_doc/presentation/labs/cases/cubit/cases_states.dart';

class CaseDetailsScreen extends StatefulWidget {
  const CaseDetailsScreen({super.key});

  @override
  CaseDetailsScreenState createState() => CaseDetailsScreenState();
}

class CaseDetailsScreenState extends State<CaseDetailsScreen> {
  List<String> orderdetailstitles = [
    'المريض',
    'العمر',
    'الجنس',
    'لون الأسنان',
    'تاريخ الحالة',
    'تاريخ التسليم',
    'حالة إعادة؟',
    'بحاجة تجربة؟',
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: true,
      maintainBottomViewPadding: true,
      child: Scaffold(
        backgroundColor: cyan50,
        body: BlocConsumer<CasesCubit, CasesState>(
          listener: (context, state) {
            if (state is CasesError) {
              AnimatedSnackBar.material(
                state.message.isNotEmpty
                    ? state.message
                    : 'حدث خطأ ما، يرجى المحاولة لاحقاً',
                type: AnimatedSnackBarType.error,
                mobileSnackBarPosition: MobileSnackBarPosition.bottom,
                duration: Duration(seconds: 3),
                animationCurve: Easing.standard,
              ).show(context);
            } else if (state is CommentsLoaded) {
              showModalBottomSheet(
                  context: context,
                  builder: (context) => messageBoard(context));
            }
          },
          builder: (context, state) {
            final cubit = context.read<CasesCubit>();
            if (state is CasesLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is CasesError) {
              return Center(child: Text('حدث خطأ أثناء تحميل تفاصيل الحالة'));
            } else if (state is CaseDetailsLoaded) {
              final medicalCase = state.medicalCase;
              final orderdetailsinfo = [
                medicalCase.patientFullName,
                medicalCase.medicalCaseDetails!.age,
                medicalCase.patientGender,
                medicalCase.medicalCaseDetails!.shade,
                medicalCase.medicalCaseDetails!.createdAt,
                medicalCase.medicalCaseDetails!.expectedDeliveryDate,
                medicalCase.medicalCaseDetails!.repeat,
                medicalCase.medicalCaseDetails!.needTrial,
              ];
              return SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    children: [
                      CaseProcessTimeline(
                        currentProcessIndex:
                            medicalCase.medicalCaseDetails!.status!,
                        onProcessIndexChanged: (value) {},
                      ),
                      Center(
                        child: medicalCase.medicalCaseDetails!.status == 3
                            ? defaultButton(
                                text: 'تأكيد الاستلام',
                                function: () {
                                  cubit.confirmdelivery(
                                      medicalCase.medicalCaseDetails!.id!);
                                },
                              )
                            : SizedBox(),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          GridView.count(
                            padding: EdgeInsets.zero,
                            childAspectRatio: 1.2,
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            crossAxisCount: 2,
                            crossAxisSpacing: 1,
                            mainAxisSpacing: 1,
                            children: List.generate(
                              orderdetailstitles.length,
                              (index) => orderdetailsCard(
                                padding: EdgeInsets.all(12.0),
                                title: orderdetailstitles[index],
                                description: orderdetailsinfo[index].toString(),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              defaultButton(
                                  text: 'التعليقات',
                                  function: () {
                                    cubit.getcomment(
                                        medicalCase.medicalCaseDetails!.id!);
                                  }),
                              defaultButton(
                                text: 'الصور',
                                function: () {
                                  showModalBottomSheet(
                                      context: context,
                                      builder: (context) {
                                        // final cubit =
                                        //     context.read<CasesCubit>();
                                        return BlocBuilder<CasesCubit,
                                            CasesState>(
                                          builder: (context, state) {
                                            if (state is ImagesLoaded) {
                                              return Column(
                                                children: [
                                                  ImageGallery(
                                                      images: state.images),
                                                ],
                                              );
                                            } else {
                                              return const Center(
                                                  child:
                                                      CircularProgressIndicator());
                                            }
                                          },
                                        );
                                      });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
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
      ),
    );
  }

  Widget orderdetailsCard({
    required String title,
    required String description,
    required EdgeInsets padding,
    Icon? icon,
    bool centertitle = true,
  }) {
    return Card(
      shape: RoundedRectangleBorder(
          side: BorderSide(width: .1, color: cyan400),
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Padding(
        padding: padding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: centertitle
                  ? MainAxisAlignment.center
                  : MainAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: cyan500),
                ),
              ],
            ),
            Container(
              height: .5,
              width: 100,
              color: cyan400,
              margin: EdgeInsets.only(bottom: 5),
            ),
            Text(
              description.toString(),
              style: TextStyle(fontSize: 18, color: Colors.blueGrey),
            ),
          ],
        ),
      ),
    );
  }
}
