import 'package:flutter/material.dart';
import 'package:searchable_listview/searchable_listview.dart';
import 'package:tlbisibida_doc/constants/constants.dart';
import 'package:tlbisibida_doc/presentation/inventory/components/item_card.dart';
import 'package:tlbisibida_doc/presentation/inventory/dialogs/item_add_edit_dialog.dart';

// ignore: must_be_immutable
class ItemListScreen extends StatelessWidget {
  ItemListScreen({super.key});

  List<Map> info = [
    {
      'name': 'سماكة 12',
      'quantity': 150,
      'standard_quantity': 50,
      'minimum': 20,
    },
    {
      'name': 'سماكة 12',
      'quantity': 200,
      'standard_quantity': 100,
      'minimum': 40,
    },
    {
      'name': 'سماكة 12',
      'quantity': 120,
      'standard_quantity': 90,
      'minimum': 20,
    },
    {
      'name': 'سماكة 12',
      'quantity': 10,
      'standard_quantity': 70,
      'minimum': 20,
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cyan50,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SearchableList(
            displayClearIcon: true,
            closeKeyboardWhenScrolling: true,
            textAlign: TextAlign.center,
            searchFieldHeight: 50,
            searchFieldPadding: EdgeInsets.symmetric(horizontal: 60),
            defaultSuffixIconSize: 0,
            shrinkWrap: true,
            displaySearchIcon: true,
            initialList: info,
            itemBuilder: (info) => itemcard(
              context,
              info,
            ),
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
                labelText: "ابحث عن عنصر",
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
              return itemAddEditDialog(context, 'إضافة مادة');
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
}
