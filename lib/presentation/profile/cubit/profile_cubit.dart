import 'dart:typed_data';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tlbisibida_doc/domain/models/profile/dentist.dart';
import 'package:tlbisibida_doc/domain/repo/auth/doc_repo_profile.dart';
import 'package:tlbisibida_doc/presentation/profile/cubit/profile_states.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final DocRepoProfile repo;

  ProfileCubit(this.repo) : super(ProfileInitial());

  ProfileResponse? profile;

  Future<void> getdocprofile() async {
    emit(ProfileLoading());
    try {
      await repo.getDocProfile();
      profile = repo.dbDentistProfile!.toDomain();
      if (profile != null) {
        emit(ProfileLoaded(profile!));
      } else {
        emit(ProfileError('لم يتم العثور على بيانات الملف الشخصي.'));
      }
    } catch (e, stack) {
      emit(ProfileError(e.toString(), stackTrace: stack));
    }
  }

  Uint8List? profilePicture;
  Future<void> getImage() async {
    emit(ProfileImageLoading());
    try {
      profilePicture = await repo.getProfilePic();
      if (profilePicture != null) {
        emit(ProfileImageLoaded(profilePicture!));
      } else {
        emit(ProfileImageError('لم يتم العثور على صورة الملف الشخصي.'));
      }
    } catch (e, stack) {
      emit(ProfileImageError(e.toString(), stackTrace: stack));
    }
  }
}
