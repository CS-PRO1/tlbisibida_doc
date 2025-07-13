import 'dart:typed_data';
import 'package:tlbisibida_doc/domain/models/profile/dentist.dart';

abstract class ProfileState {
  const ProfileState();
}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileLoaded extends ProfileState {
  final ProfileResponse profile;
  const ProfileLoaded(this.profile);
}

class ProfileError extends ProfileState {
  final String message;
  final String? errorCode;
  final StackTrace? stackTrace;
  const ProfileError(this.message, {this.errorCode, this.stackTrace});
}

class ProfileImageLoading extends ProfileState {}

class ProfileImageLoaded extends ProfileState {
  final Uint8List image;
  const ProfileImageLoaded(this.image);
}

class ProfileImageError extends ProfileState {
  final String message;
  final String? errorCode;
  final StackTrace? stackTrace;
  const ProfileImageError(this.message, {this.errorCode, this.stackTrace});
}
