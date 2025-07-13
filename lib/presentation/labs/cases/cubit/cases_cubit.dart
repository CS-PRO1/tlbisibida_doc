import 'dart:typed_data';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tlbisibida_doc/domain/models/medical cases/case_details.dart';
import 'package:tlbisibida_doc/domain/models/medical cases/caselist_from_lab.dart';
import 'package:tlbisibida_doc/domain/models/medical cases/comments.dart';
import 'package:tlbisibida_doc/domain/repo/cases/doc_repo_cases.dart';
import 'package:tlbisibida_doc/presentation/labs/cases/cubit/cases_states.dart';

class CasesCubit extends Cubit<CasesState> {
  final DocRepoCases repo;

  CasesCubit(this.repo) : super(CasesInitial());

  List<MedicalCaseItem> caselist = [];
  List<Comment> comments = [];

  Future<void> getcaselist(int id) async {
    emit(CasesLoading());
    caselist.clear();
    try {
      await repo.getcaseList(id);
      for (var caseitem in repo.dbMedicalCasesListResponse!.medicalCases!) {
        caselist.add(caseitem.toDomain());
      }
      emit(CaseListLoaded(caselist));
    } catch (e, stack) {
      emit(CasesError('حدث خطأ أثناء تحميل قائمة الحالات.', stackTrace: stack));
    }
  }

  MedicalCase? medicalCase;
  List<Uint8List> imgList = [];
  Future<void> getCaseDetails(int id) async {
    emit(CasesLoading());
    imgList.clear();
    try {
      await repo.getCaseDetails(id);
      medicalCase = (repo.dbMedicalCaseResponse!.medicalCase!.toDomain());
      if (medicalCase != null) {
        emit(CaseDetailsLoaded(medicalCase!));
        for (var file in medicalCase!.medicalCaseFiles) {
          await getCaseImages(file.id!);
        }
      } else {
        emit(CasesError('لم يتم العثور على تفاصيل الحالة.'));
      }
      if (imgList.isNotEmpty) {
        emit(ImagesLoaded(imgList));
      }
    } catch (e, stack) {
      emit(CasesError('حدث خطأ أثناء تحميل تفاصيل الحالة.', stackTrace: stack));
    }
  }

  Future<void> getcomment(int id) async {
    emit(CasesLoading());
    comments.clear();
    try {
      await repo.getComments(id);
      for (var comment in repo.dbCommentsResponse!.comments!) {
        comments.add(comment.toDomain());
      }
      emit(CommentsLoaded(comments));
    } catch (e, stack) {
      emit(CasesError('حدث خطأ أثناء تحميل التعليقات.', stackTrace: stack));
    }
  }

  Future<void> confirmdelivery(int id) async {
    emit(ConfirmingDelivery());
    try {
      final success = await repo.confirmDelivery(id);
      if (success) {
        emit(DeliveryConfirmed());
      } else {
        emit(CasesError('فشل تأكيد التسليم.'));
      }
    } catch (e, stack) {
      emit(CasesError('حدث خطأ أثناء تأكيد التسليم.', stackTrace: stack));
    }
  }

  Future<void> getCaseImages(int id) async {
    try {
      var image = await repo.getCasesimage(id);
      if (image != null) {
        imgList.add(image);
      }
    } catch (e, stack) {
      emit(CasesError('حدث خطأ أثناء تحميل الصور.', stackTrace: stack));
    }
  }
}
