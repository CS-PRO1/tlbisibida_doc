import 'package:flutter/material.dart';
import 'package:tlbisibida_doc/components/custom_text.dart';
import 'package:tlbisibida_doc/constants/constants.dart';
import 'package:tlbisibida_doc/services/navigation/locator.dart';
import 'package:tlbisibida_doc/services/navigation/navigation_service.dart';
import 'package:tlbisibida_doc/services/navigation/routes.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  bool is_den = true;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  'assets/teeth_pattern.png',
                ),

                // fit: BoxFit.,
                repeat: ImageRepeat.repeat),
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  cyan50,
                  cyan50,
                  cyan50,
                  cyan100,
                  const Color.fromARGB(171, 143, 229, 220),
                  cyan100,
                  cyan50,
                  const Color.fromARGB(255, 227, 243, 241),
                  const Color.fromARGB(255, 235, 246, 245),
                ])),
        constraints: const BoxConstraints(maxWidth: 400),
        padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 30),
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
              Text("تسجيل الدخول",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: cyan500,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    shadows: [
                      Shadow(
                          color: const Color.fromARGB(112, 125, 117, 117),
                          blurRadius: 2,
                          offset: Offset(-1, 2))
                    ],
                  )),
              const SizedBox(
                height: 10,
              ),
              // Row(
              //   children: [
              //     CustomText(
              //       text: "Welcome back to the admin panel.",
              //       color: Colors.grey[300],
              //     ),
              //   ],
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
                    SizedBox(
                      width: 10,
                    ),
                    const Text(
                      "نسيت كلمة المرور؟",
                      style: TextStyle(
                        color: cyan400,
                        shadows: [
                          Shadow(
                              color: const Color.fromARGB(112, 125, 117, 117),
                              blurRadius: 2,
                              offset: Offset(-1, 2))
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, rootRoute);
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: cyan400, borderRadius: BorderRadius.circular(20)),
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
                    text: "تسجيل الدخول",
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              // RichText(
              //     text: const TextSpan(children: [
              //   TextSpan(
              //       text: "لا تملك حسابا ؟",
              //       style: TextStyle(color: cyan500)),
              //   TextSpan(text: "إنشاء حساب", style: TextStyle(color: cyan300))
              // ]))
              SizedBox(
                // width: 255,
                child: is_den
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            'لا تملك حساباً؟',
                            style: TextStyle(
                              color: cyan600,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, registerRoute);
                            },
                            child: Text(
                              'إنشاء حساب جديد',
                              style: TextStyle(
                                shadows: [
                                  Shadow(
                                      color: const Color.fromARGB(
                                          112, 125, 117, 117),
                                      blurRadius: 2,
                                      offset: Offset(-1, 2))
                                ],
                                fontSize: 16,
                                color: cyan400,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          )
                        ],
                      )
                    : SizedBox(
                        height: 10,
                      ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
