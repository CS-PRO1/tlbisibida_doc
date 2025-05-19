import 'package:flutter/material.dart';
import 'package:tlbisibida_doc/components/date_picker.dart';
import 'package:tlbisibida_doc/components/default_button.dart';
import 'package:tlbisibida_doc/components/default_textfield.dart';
import 'package:tlbisibida_doc/constants/constants.dart';
import 'package:tlbisibida_doc/view/patients/components/tables/payments_log_table.dart';

class PaymentManagementDialog extends StatelessWidget {
  PaymentManagementDialog({
    super.key,
  });
  TextEditingController titleController = TextEditingController();
  TextEditingController costController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            // mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                ' المدفوعات ',
                style: TextStyle(fontSize: 20, color: cyan500),
              ),
              const SizedBox(
                height: 15,
              ),
              SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      width: 400,
                      height: 300,
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            width: 1,
                            color: cyan200,
                          )),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'تاريخ التسديد',
                            style: TextStyle(fontSize: 18),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          datePicker(context),
                          const SizedBox(
                            height: 15,
                          ),
                          SizedBox(
                            width: 180,
                            child: defaultTextField(
                              costController,
                              context,
                              'القيمة المسددة',
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          defaultButton(
                              text: 'إضافة دفعة',
                              function: () {
                                Navigator.pop(context);
                              })
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const SizedBox(
                      height: 40,
                      child: Text(
                        'سجل المدفوعات',
                        style: TextStyle(color: cyan600),
                      ),
                    ),
                    SizedBox(
                      height: 200,
                      child: SingleChildScrollView(child: PaymentsLogTable()),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
