import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tlbisibida_doc/constants/constants.dart';
import 'package:tlbisibida_doc/presentation/profile/cubit/profile_cubit.dart';
import 'package:tlbisibida_doc/services/navigation/routes.dart';
import 'package:tlbisibida_doc/presentation/profile/profile_edit_screen.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ProfileCubit>();

    List userInfo = [
      {
        'title': 'الاسم:',
        'info': cubit.profile!.firstName! + cubit.profile!.lastName!,
        'icon': Icons.person,
      },
      {
        'title': 'البريد:',
        'info': cubit.profile!.email!,
        'icon': CupertinoIcons.mail_solid,
      },
      {
        'title': 'الهاتف:',
        'info': cubit.profile!.phone,
        'icon': CupertinoIcons.phone_circle_fill,
      },
      {
        'title': 'العنوان:',
        'info': cubit.profile!.address,
        'icon': CupertinoIcons.placemark_fill,
      },
    ];
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigator.of(context).push(MaterialPageRoute(
          //   builder: (context) => ProfileEditScreen(),
          // ));
          Navigator.pushNamed(context, profileEditRoute);
        },
        mini: true,
        backgroundColor: cyan400,
        foregroundColor: white,
        shape: RoundedRectangleBorder(
            side: BorderSide(color: cyan600, width: 1.5),
            borderRadius: BorderRadius.circular(10)),
        child: Icon(
          Icons.edit,
          size: 20,
        ),
      ),
      body: BlocConsumer<ProfileCubit, String>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 30.0, vertical: 40.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 100,
                  backgroundImage: NetworkImage(''),
                  // 'https://media.istockphoto.com/id/1371009338/photo/portrait-of-confident-a-young-dentist-working-in-his-consulting-room.jpg?s=612x612&w=0&k=20&c=I212vN7lPpAOwGKRoEY9kYWunJaMj9vH2g-8YBGc2MI='),
                  onBackgroundImageError: (exception, stackTrace) =>
                      Image.asset(
                    'assets/images/fallback/user_default.jpg',
                  ),
                ),
                SizedBox(height: 20),
                ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (context, index) =>
                        itemBuilder(userInfo[index]),
                    separatorBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 60.0),
                          child: Container(
                            height: 1,
                            color: cyan300,
                            width: 150,
                          ),
                        ),
                    itemCount: userInfo.length),
              ],
            ),
          );
        },
      ),
    );
  }

  itemBuilder(model) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SizedBox(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Icon(
                  model['icon'],
                  color: cyan500,
                ),
              ),
              Text(model['title'] + ' ',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: cyan500,
                  )),
              Text(
                model['info'].toString(),
                style: TextStyle(
                    overflow: TextOverflow.ellipsis,
                    fontSize: 18,
                    color: cyan600),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
