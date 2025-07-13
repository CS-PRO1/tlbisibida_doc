import 'dart:typed_data';
import 'package:tlbisibida_doc/domain/models/medical cases/case_details.dart';
import 'package:tlbisibida_doc/domain/models/medical cases/caselist_from_lab.dart';
import 'package:tlbisibida_doc/domain/models/medical cases/comments.dart';

abstract class CasesState {
  const CasesState();
}

class CasesInitial extends CasesState {}

class CasesLoading extends CasesState {}

class CasesError extends CasesState {
  final String message;
  final String? errorCode;
  final StackTrace? stackTrace;
  const CasesError(this.message, {this.errorCode, this.stackTrace});
}

// Case List
class CaseListLoaded extends CasesState {
  final List<MedicalCaseItem> caseList;
  const CaseListLoaded(this.caseList);
}

// Case Details
class CaseDetailsLoaded extends CasesState {
  final MedicalCase medicalCase;
  const CaseDetailsLoaded(this.medicalCase);
}

// Comments
class CommentsLoaded extends CasesState {
  final List<Comment> comments;
  const CommentsLoaded(this.comments);
}

// Confirm Delivery
class ConfirmingDelivery extends CasesState {}

class DeliveryConfirmed extends CasesState {}

// Images
class ImagesLoaded extends CasesState {
  final List<Uint8List> images;
  const ImagesLoaded(this.images);
}
