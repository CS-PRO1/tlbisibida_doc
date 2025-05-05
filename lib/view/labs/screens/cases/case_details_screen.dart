import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tlbisibida_doc/components/image_gallery.dart';
import 'package:tlbisibida_doc/view/labs/components/case_process_timeline.dart';
import 'package:tlbisibida_doc/components/default_button.dart';
import 'package:tlbisibida_doc/constants/constants.dart';
import 'package:tlbisibida_doc/view/labs/components/message_board.dart';

class CaseDetailsScreen extends StatefulWidget {
  const CaseDetailsScreen({super.key});

  @override
  CaseDetailsScreenState createState() => CaseDetailsScreenState();
}

class CaseDetailsScreenState extends State<CaseDetailsScreen> {
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
    'تحسين التحسيني',
    '45',
    'ذكر',
    'D3',
    DateFormat.yMd().format(DateTime.now()),
    DateFormat.yMd().format(DateTime(2025, 5, 3)),
    'نعم',
    'لا',
    'المريض م'
  ];

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
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                CaseProcessTimeline(),
                Center(
                  child: defaultButton(
                    text: 'تأكيد الاستلام',
                    function: () {},
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
                                builder: (context) => messageBoard(context));
                          },
                        ),
                        defaultButton(
                          text: 'الصور',
                          function: () {
                            showModalBottomSheet(
                                context: context,
                                builder: (context) => Column(
                                      children: [
                                        ImageGallery(
                                          imageUrls: [
                                            'https://traveltodentist.com/wp-content/uploads/2020/04/dinti-noi-zirconiu-ceramica.jpg',
                                            'https://traveltodentist.com/wp-content/uploads/2020/04/dinti-afectati-de-parodontoza-1.jpg',
                                            'https://traveltodentist.com/wp-content/uploads/2020/04/caz-clinic-inainte-si-dupa-tratament-parodontoza-moldova.jpg',
                                          ],
                                        ),
                                        // SizedBox(
                                        //   height: 10,
                                        // ),
                                      ],
                                    ));
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
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
