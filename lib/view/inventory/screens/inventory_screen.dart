import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:searchable_listview/searchable_listview.dart';
import 'package:tlbisibida_doc/components/top_nav.dart';
import 'package:tlbisibida_doc/constants/constants.dart';
import 'package:tlbisibida_doc/view/inventory/components/add_subcat_button.dart';
import 'package:tlbisibida_doc/view/inventory/dialogs/add_cat_dialog%20.dart';
import 'package:tlbisibida_doc/view/inventory/dialogs/edit_subcat_dialog%20%20copy.dart';
import 'package:tlbisibida_doc/view/inventory/dialogs/subcat_delete_dialog.dart';
import 'package:tlbisibida_doc/view/inventory/components/bottom_action_buttons.dart';

// ignore: must_be_immutable
class InventoryScreen extends StatelessWidget {
  InventoryScreen({super.key});

  List<Map> info = [
    {
      'name': 'أدوات',
      'subcats': ['سنابل', 'مرايا', 'قبضات', 'كماشة', 'فرشاية'],
    },
    {
      'name': 'مواد تخدير',
      'subcats': ['سنابل', 'مرايا'],
    },
    {
      'name': 'مواد تخدير',
      'subcats': ['سنابل', 'مرايا'],
    },
    {
      'name': 'مواد تخدير',
      'subcats': ['سنابل', 'مرايا'],
    },
    {
      'name': 'مواد تخدير',
      'subcats': ['سنابل', 'مرايا'],
    },
    {
      'name': 'مواد تخدير',
      'subcats': ['سنابل', 'مرايا'],
    },
    {
      'name': 'مواد تخدير',
      'subcats': ['سنابل', 'مرايا'],
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cyan50,
      // appBar: TopNavigationBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SearchableList(
            displayClearIcon: true,
            closeKeyboardWhenScrolling: true,
            textAlign: TextAlign.center,
            // searchFieldWidth: 30,
            searchFieldHeight: 50,
            searchFieldPadding: EdgeInsets.symmetric(horizontal: 60),
            // defaultSuffixIconColor: cyan300,
            defaultSuffixIconSize: 0,
            //listViewPadding: EdgeInsets.only(top: 16),
            shrinkWrap: true,
            displaySearchIcon: true,
            initialList: info,
            itemBuilder: (info) => itemcard(context, info),
            filter: (value) => info
                .where(
                  (element) => element['name'].contains(value),
                )
                .toList(),
            emptyWidget: const Center(
              child: Text('لم يتم العثور على نتيجة'),
            ),
            inputDecoration: InputDecoration(
                icon: Icon(
                  Icons.search,
                  color: cyan400,
                ),
                labelText: "ابحث عن تصنيف رئيسي",
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
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return addCatDialog(context);
            },
          );
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
    );
  }

  Widget itemcard(BuildContext context, Map catinfo, {VoidCallback? onTap}) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: FlipCard(
        fill: Fill
            .fillBack, // Fill the back side of the card to make in the same size as the front.
        direction: FlipDirection.HORIZONTAL, // default
        side: CardSide.FRONT, // The side to initially display.
        front: Card(
          clipBehavior: Clip.antiAlias,
          color: white,
          child: SizedBox(
            height: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(
                  height: 40,
                ),
                Text(
                  catinfo['name'],
                  style: const TextStyle(
                      color: cyan400,
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ),
                Container(
                  height: .5,
                  width: 100,
                  color: cyan500,
                ),
                bottomActionButtons(context),
              ],
            ),
          ),
        ),

        back: Card(
          color: white,
          clipBehavior: Clip.antiAlias,
          child: SizedBox(
            height: 250,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SizedBox(
                    height: 230,
                    child: ListView.separated(
                        shrinkWrap: true,
                        itemBuilder: (context, index) =>
                            subcatrow(catinfo['subcats'][index], context),
                        separatorBuilder: (context, index) => Padding(
                              padding: const EdgeInsets.all(4.0),
                            ),
                        itemCount: catinfo['subcats'].length),
                  ),
                ),
                SizedBox(
                  height: 50,
                  child: addSubcatButton(context),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  subcatrow(String? subcat, BuildContext context) {
    if (subcat == null) {
      return Container(
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            color: cyan300, //Radius
            borderRadius: BorderRadius.circular(10),
          ),
          child: InkWell(
            child: Icon(Icons.add),
          ));
    }
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: cyan100, //Radius
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        TextButton(
          child: Text(subcat,
              style: TextStyle(
                fontSize: 18,
              )),
          onPressed: () {},
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return subcatDeleteConfirmationDialog(context);
                    },
                  );
                },
                icon: Icon(
                  Icons.delete,
                  color: redmid,
                )),
            IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return editSubcatDialog(context);
                    },
                  );
                },
                icon: Icon(
                  Icons.edit,
                  color: cyan400,
                )),
          ],
        ),
      ]),
    );
  }
}
