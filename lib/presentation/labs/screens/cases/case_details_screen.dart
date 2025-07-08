import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:tlbisibida_doc/components/image_gallery.dart';
import 'package:tlbisibida_doc/presentation/labs/components/case_process_timeline.dart';
import 'package:tlbisibida_doc/components/default_button.dart';
import 'package:tlbisibida_doc/constants/constants.dart';
import 'package:tlbisibida_doc/presentation/labs/components/message_board.dart';
import 'package:tlbisibida_doc/presentation/labs/screens/cases/cubit/cases_cubit.dart';

class CaseDetailsScreen extends StatefulWidget {
  const CaseDetailsScreen({super.key});

  @override
  CaseDetailsScreenState createState() => CaseDetailsScreenState();
}

class CaseDetailsScreenState extends State<CaseDetailsScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: true,
      maintainBottomViewPadding: true,
      child: Scaffold(
        backgroundColor: cyan50,
        body: BlocConsumer<CasesCubit, String>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            final cubit = context.read<CasesCubit>();
            final orderdetailstitles = [
              'المريض',
              'العمر',
              'الجنس',
              'لون الأسنان',
              'تاريخ الحالة',
              'تاريخ التسليم',
              'حالة إعادة؟',
              'بحاجة تجربة؟',
            ];

            final List orderdetailsinfo = [
             cubit.caseDetails!.patientFullName,
             cubit.caseDetails!.age,
            cubit.caseDetails!.patientGender,
             cubit.caseDetails!.shade,
              DateFormat.yMd().format(DateTime(2025, 5, 3)),
              cubit.caseDetails!.expectedDeliveryDate,
             
          cubit.caseDetails!.,
          cubit.caseDetails!.,
              
         ];

            return SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  children: [
                    CaseProcessTimeline(),
                    Center(
                      child: defaultButton(
                        text: 'تأكيد الاستلام',
                        function: () {
                          cubit.confirmdelivery(cubit.caseDetails!.id);
                        },
                      ),
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
                              description: orderdetailsinfo[index],
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
                                showModalBottomSheet(
                                    context: context,
                                    builder: (context) =>
                                        messageBoard(context));
                              },
                            ),
                            defaultButton(
                              text: 'الصور',
                              function: () {
                                showModalBottomSheet(
                                    context: context,
                                    builder: (context) {
                                      final cubit = context.read<CasesCubit>();

                                      return Column(
                                        children: [
                                          ImageGallery(images: cubit.imgList),
                                          // SizedBox(
                                          //   height: 10,
                                          // ),
                                        ],
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
              description,
              style: TextStyle(fontSize: 18, color: Colors.blueGrey),
            ),
          ],
        ),
      ),
    );
  }
}
