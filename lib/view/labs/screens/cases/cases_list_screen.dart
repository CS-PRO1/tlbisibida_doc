import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:searchable_listview/searchable_listview.dart';
import 'package:tlbisibida_doc/components/top_nav.dart';
import 'package:tlbisibida_doc/constants/constants.dart';

class CaseListScreen extends StatelessWidget {
  CaseListScreen({super.key});
  final List _casesList = [
    {
      'name': 'تحسين التحسيني',
      'date': DateFormat.yMd().format(DateTime.now()),
      'status': 'تم التوصيل'
    },
    {
      'name': 'تحسين التحسيني',
      'date': DateFormat.yMd().format(DateTime.now()),
      'status': 'ٌجاهزة'
    },
    {
      'name': 'تحسين التحسيني',
      'date': DateFormat.yMd().format(DateTime.now()),
      'status': 'قيد الإنجاز'
    },
    {
      'name': 'تحسين التحسيني',
      'date': DateFormat.yMd().format(DateTime.now()),
      'status': 'انتظار الموافقة'
    },
    {
      'name': 'تحسين التحسيني',
      'date': DateFormat.yMd().format(DateTime.now()),
      'status': 'تم التوصيل'
    },
    {
      'name': 'تحسين التحسيني',
      'date': DateFormat.yMd().format(DateTime.now()),
      'status': 'ٌجاهزة'
    },
    {
      'name': 'تحسين التحسيني',
      'date': DateFormat.yMd().format(DateTime.now()),
      'status': 'قيد الإنجاز'
    },
    {
      'name': 'تحسين التحسيني',
      'date': DateFormat.yMd().format(DateTime.now()),
      'status': 'انتظار الموافقة'
    },
    {
      'name': 'تحسين التحسيني',
      'date': DateFormat.yMd().format(DateTime.now()),
      'status': 'تم التوصيل'
    },
    {
      'name': 'تحسين التحسيني',
      'date': DateFormat.yMd().format(DateTime.now()),
      'status': 'ٌجاهزة'
    },
    {
      'name': 'تحسين التحسيني',
      'date': DateFormat.yMd().format(DateTime.now()),
      'status': 'قيد الإنجاز'
    },
    {
      'name': 'تحسين التحسيني',
      'date': DateFormat.yMd().format(DateTime.now()),
      'status': 'انتظار الموافقة'
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopNavigationBar(),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SearchableList(
            displayClearIcon: true,
            closeKeyboardWhenScrolling: true,
            textAlign: TextAlign.center,
            searchFieldHeight: 50,
            searchFieldPadding: EdgeInsets.symmetric(horizontal: 60),
            defaultSuffixIconSize: 0,
            shrinkWrap: true,
            displaySearchIcon: true,
            emptyWidget: const Center(
              child: Text('لم يتم العثور على نتيجة'),
            ),
            inputDecoration: InputDecoration(
                icon: Icon(
                  Icons.search,
                  color: cyan400,
                ),
                labelText: "ابحث عن مريض",
                labelStyle: TextStyle(fontSize: 14),
                fillColor: Colors.white,
                // enabledBorder: OutlineInputBorder(
                //     borderSide: const BorderSide(color: cyan50, width: 2.0),
                //     borderRadius: StandardBorderRadius),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: cyan300, width: 2.0),
                  borderRadius: activeBorderRadius,
                ),
                errorBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.redAccent, width: 2.0),
                  // borderRadius: ActiveBorderRadius,
                )),
            filter: (value) => _casesList
                .where(
                  (element) => element['name'].contains(value),
                )
                .toList(),
            initialList: _casesList,
            physics: BouncingScrollPhysics(),
            itemBuilder: (item) => catItemBuilder(context, item),
            //itemCount: 20,
            seperatorBuilder: (BuildContext context, int index) => Container(
                  height: 1,
                  color: Colors.grey,
                )),
      ),
    );
  }

  catItemBuilder(context, item) {
    return InkWell(
      onTap: () {},
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  item['name'],
                  //controller.caseListModel!.data[index].patient_name!,
                  //style: Theme.of(context).textTheme.headline6,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Column(
                children: [
                  Text(item['date']),
                  Text(item['status']),
                ],
              ),
              Icon(Icons.arrow_forward_ios_rounded),
            ],
          ),
        ),
      ),
    );
  }
}
