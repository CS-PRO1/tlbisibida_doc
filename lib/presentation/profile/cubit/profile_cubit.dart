import 'dart:typed_data';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tlbisibida_doc/domain/models/profile/dentist.dart';
import 'package:tlbisibida_doc/domain/repo/auth/doc_repo_profile.dart';

class ProfileCubit extends Cubit<String> {
  final DocRepoProfile repo;

  ProfileCubit(this.repo) : super('');

  //get profile
  ProfileResponse? profile;

  Future<void> getdocprofile() async {
    emit('get profile');
    try {
      await repo.getDocProfile();
    } on Exception catch (e) {
      emit('error');
      print(e.toString());
    }
    profile = (repo.dbDentistProfile!.toDomain());
    profile != null ? emit('got profile') : emit('error');
    print(state);
  }

  //get img
  //List<Uint8List> imgList = [];
  Uint8List? profilePicture;
  Future<void> getImage() async {
    try {
      profilePicture = await repo.getProfilePic();
    } on Exception catch (e) {
      emit('error');
      print(e.toString());
    }
    profilePicture != null ? emit('image_loaded') : emit('error');
  }

  // //update  sec

  // Future<void> updatesec(int id, String firstName, String lastName,
  //     String phone, String email, String attendenceTime, String address) async {
  //   emit('updating');
  //   try {
  //     auth = await repo.updateSecretary(
  //         id, firstName, lastName, phone, email, attendenceTime, address);
  //   } on Exception catch (e) {
  //     emit('error');
  //     print(e.toString());
  //   }
  //   auth ? emit('updated') : emit('error');
  //   print(state);
  // }
  // //add  sec

  // Future<void> addsec(String firstName, String lastName, String phone,
  //     String email, String attendenceTime, String address) async {
  //   emit('adding');
  //   try {
  //     auth = await repo.postAddSecretary(
  //         firstName, lastName, phone, email, attendenceTime, address);
  //   } on Exception catch (e) {
  //     emit('error');
  //     print(e.toString());
  //   }
  //   auth ? emit('added') : emit('error');
  //   print(state);
  // }
  // //delete  sec

  // Future<void> delsec(int id) async {
  //   emit('deleting');
  //   try {
  //     auth = await repo.delSecretary(id);
  //   } on Exception catch (e) {
  //     emit('error');
  //     print(e.toString());
  //   }
  //   auth ? emit('deleted') : emit('error');
  //   print(state);
  // }
}
