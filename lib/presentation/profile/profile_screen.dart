import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:tlbisibida_doc/constants/constants.dart';
import 'package:tlbisibida_doc/domain/models/profile/dentist.dart';
import 'package:tlbisibida_doc/presentation/profile/cubit/profile_cubit.dart';
import 'package:tlbisibida_doc/presentation/profile/cubit/profile_states.dart';
import 'package:tlbisibida_doc/services/navigation/routes.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
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
      body: BlocConsumer<ProfileCubit, ProfileState>(
        listener: (context, state) {
          if (state is ProfileError) {
            AnimatedSnackBar.material(
              state.message.isNotEmpty
                  ? state.message
                  : 'حدث خطأ ما، يرجى المحاولة لاحقاً',
              type: AnimatedSnackBarType.error,
              mobileSnackBarPosition: MobileSnackBarPosition.bottom,
              duration: Duration(seconds: 3),
              animationCurve: Easing.standard,
            ).show(context);
          }
        },
        builder: (context, state) {
          if (state is ProfileLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ProfileError) {
            return Center(child: Text('حدث خطأ أثناء تحميل الملف الشخصي'));
          } else if (state is ProfileLoaded) {
            final profile = state.profile.profile!;
            final cubit = context.read<ProfileCubit>();
            List userInfo = [
              {
                'title': 'الاسم:',
                'info': profile.profileDetails!.firstName! +
                    profile.profileDetails!.lastName!,
                'icon': Icons.person,
              },
              {
                'title': 'البريد:',
                'info': profile.profileDetails!.email!,
                'icon': CupertinoIcons.mail_solid,
              },
              {
                'title': 'الهاتف:',
                'info': profile.profileDetails!.phone,
                'icon': CupertinoIcons.phone_circle_fill,
              },
              {
                'title': 'العنوان:',
                'info': profile.profileDetails!.address,
                'icon': CupertinoIcons.placemark_fill,
              },
            ];
            return Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 30.0, vertical: 40.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 100,
                    backgroundImage: cubit.profilePicture != null
                        ? MemoryImage(cubit.profilePicture!)
                        : null,
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
                            padding:
                                const EdgeInsets.symmetric(horizontal: 60.0),
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
          } else {
            // Initial or other states
            return const Center(child: Text('لا توجد بيانات للعرض'));
          }
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
