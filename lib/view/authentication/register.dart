import 'package:flutter/material.dart';
import 'package:tlbisibida_doc/components/custom_text.dart';
import 'package:tlbisibida_doc/constants/constants.dart';

// ignore: must_be_immutable
class Register extends StatelessWidget {
  // AdminLoginController adminAuth=Get.put(AdminLoginController());
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController firstname = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController password = TextEditingController();

  Register({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 400),
          padding: const EdgeInsets.all(24),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: Image.asset(
                    "assets/icons/logo_v2.png",
                    width: 200,
                    height: 200,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Text("إنشاء حساب",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: cyan500,
                        fontSize: 30,
                        fontWeight: FontWeight.bold)),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: email,
                        decoration: InputDecoration(
                            labelText: "الاسم الاول",
                            hintText: "abc@domain.com",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20))),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: TextField(
                        controller: ,
                        decoration: InputDecoration(
                            labelText: "الاسم الاخير",
                            hintText: "abc@domain.com",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20))),
                      ),
                    ),
                  ],
                ),

                // const SizedBox(
                //   height: 15,
                // ),
                // TextField(
                //   controller: email,
                //   decoration: InputDecoration(
                //       labelText: "البريد الاكتروني",
                //       hintText: "abc@domain.com",
                //       border: OutlineInputBorder(
                //           borderRadius: BorderRadius.circular(20))),
                // ),
                const SizedBox(
                  height: 15,
                ),
                TextField(
                  controller: email,
                  decoration: InputDecoration(
                      labelText: "البريد الاكتروني",
                      hintText: "abc@domain.com",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextField(
                  controller: password,
                  obscureText: true,
                  decoration: InputDecoration(
                      labelText: "كلمة المرور",
                      hintText: "123",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextField(
                  controller: password,
                  obscureText: true,
                  decoration: InputDecoration(
                      labelText: "تأكيد كلمة المرور",
                      hintText: "123",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Checkbox(value: true, onChanged: (value) {}),
                          const CustomText(
                            text: "تذكّرني",
                          ),
                        ],
                      ),
                      const CustomText(
                          text: "نسيت كلمة المرور؟", color: cyan400)
                    ],
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                InkWell(
                  // onTap: adminAuth.isLoading.value
                  //     ? null
                  //     : ()async {
                  //         adminAuth.admin_login(email.text, password.text);
                  //          Get.offNamed("Employees");

                  //       },
                  child: Container(
                    decoration: BoxDecoration(
                        color: cyan400,
                        borderRadius: BorderRadius.circular(20)),
                    alignment: Alignment.center,
                    width: double.maxFinite,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child:
                        //  adminAuth.isLoading.value
                        //     ? CircularProgressIndicator(
                        //         valueColor:
                        //             AlwaysStoppedAnimation<Color>(Colors.white))
                        //     :
                        const CustomText(
                      text: "إنشاء حساب",
                      color: Colors.white,
                    ),
                  ),
                ),
                // const SizedBox(
                //   height: 15,
                // ),
                // RichText(
                //     text: const TextSpan(children: [
                //   TextSpan(text: "Do not have admin credentials? "),
                //   TextSpan(
                //       text: "Request Credentials! ",
                //       style: TextStyle(color: cyan400))
                // ]))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
