import 'package:flutter/material.dart';
import 'package:tlbisibida_doc/components/tusk_icons.dart';
import 'package:tlbisibida_doc/constants/constants.dart';

class RoleScreen extends StatelessWidget {
  const RoleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        color: cyan200,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                height: 220,
                decoration: BoxDecoration(
                    color: cyan100,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: cyan600, width: .5)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            TuskIcons.secretary,
                            size: 120,
                            color: cyan600,
                          )),
                      Container(
                        color: cyan500,
                        height: .5,
                        width: 100,
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Text(
                        'طبيب أسنان',
                        style: TextStyle(
                            color: cyan600, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 220,
                decoration: BoxDecoration(
                    color: cyan100,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: cyan600, width: .5)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            TuskIcons.secretary,
                            size: 120,
                            color: cyan600,
                          )),
                      Container(
                        color: cyan500,
                        height: .5,
                        width: 100,
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Text(
                        'سكرتير',
                        style: TextStyle(
                            color: cyan600, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
