import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:tlbisibida_doc/constants/constants.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [cyan600, cyan100, cyan500],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.only(top: 220),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image(
                  image: AssetImage(
                    'assets/icons/logo_v2.png',
                  ),
                  width: 150,
                  height: 150,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  '1.0.0',
                  style: TextStyle(color: cyan500),
                ),
                SizedBox(
                  height: 100,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: Icon(
                        CupertinoIcons.phone_circle_fill,
                        color: cyan100,
                      ),
                      onPressed: () {},
                    ),
                    Text(
                      'اتصل بنا',
                      style: TextStyle(color: white),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.facebook,
                        color: cyan100,
                      ),
                      onPressed: () {},
                    ),
                    Text(
                      'تابعنا على فيسبوك',
                      style: TextStyle(color: white),
                    ),
                  ],
                ),
              ],
            ),
          ),
          //height: 200,
        ),
      ),
    );
  }
}
