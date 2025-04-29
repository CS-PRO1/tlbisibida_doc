import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tlbisibida_doc/components/default_button.dart';
import 'package:tlbisibida_doc/components/top_nav.dart';
import 'package:tlbisibida_doc/constants/constants.dart';

class ProfileEditScreen extends StatelessWidget {
  ProfileEditScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final formkey = GlobalKey<FormState>();
    TextEditingController nameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController addressController = TextEditingController();
    TextEditingController phoneNumberController = TextEditingController();
    List userInfo = [
      {
        'title': 'الاسم:',
        'info': 'د. تحسين التحسيني',
        'icon': Icons.person,
        'controller': nameController,
      },
      {
        'title': 'البريد:',
        'info': 'drtahseeeeeeeen@tahseenee.net',
        'icon': CupertinoIcons.mail_solid,
        'controller': emailController,
      },
      {
        'title': 'الهاتف:',
        'info': '0987631345',
        'icon': CupertinoIcons.phone_circle_fill,
        'controller': phoneNumberController,
      },
      {
        'title': 'العنوان:',
        'info': 'دمشق - الجسر الأبيض',
        'icon': CupertinoIcons.placemark_fill,
        'controller': addressController,
      },
    ];
    nameController.text = userInfo[0]['info'];
    emailController.text = userInfo[1]['info'];
    phoneNumberController.text = userInfo[2]['info'];
    addressController.text = userInfo[3]['info'];

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                            radius: 80,
                            backgroundImage: NetworkImage(
                                'https://media.istockphoto.com/id/1371009338/photo/portrait-of-confident-a-young-dentist-working-in-his-consulting-room.jpg?s=612x612&w=0&k=20&c=I212vN7lPpAOwGKRoEY9kYWunJaMj9vH2g-8YBGc2MI='),
                            onBackgroundImageError: (exception, stackTrace) =>
                                Image.asset(
                                    'images/fallback/user_default.jpg')),
                        SizedBox(height: 20),
                        Form(
                          key: formkey,
                          child: ListView.builder(
                              physics: BouncingScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (context, index) =>
                                  itemBuilder(userInfo[index]),
                              itemCount: userInfo.length),
                        ),
                        defaultButton(
                            text: 'حفظ التعديلات',
                            function: () {
                              Navigator.pop(context);
                            }),
                      ]),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }

  itemBuilder(model) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: TextFormField(
        onFieldSubmitted: (value) {
          model['controller'].text = value;
        },
        controller: model['controller'],
        decoration: InputDecoration(
            label: Text(model['title']),
            prefixIcon: Icon(model['icon']),
            helperText: model['hint'],
            suffixIcon: InkWell(
              borderRadius: BorderRadius.circular(50),
              onTap: () {
                model['controller'].text = '';
              },
              child: Icon(
                Icons.clear_rounded,
              ),
            )),
      ),
    );
  }
}
