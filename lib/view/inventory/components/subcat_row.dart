import 'package:flutter/material.dart';
import 'package:tlbisibida_doc/constants/constants.dart';
import 'package:tlbisibida_doc/view/inventory/dialogs/edit_subcat_dialog.dart';
import 'package:tlbisibida_doc/view/inventory/dialogs/subcat_delete_dialog.dart';

Widget subcatrow(String? subcat, BuildContext context) {
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
                      return editSubcatDialog(context);
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
                      return subcatDeleteConfirmationDialog(context);
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
