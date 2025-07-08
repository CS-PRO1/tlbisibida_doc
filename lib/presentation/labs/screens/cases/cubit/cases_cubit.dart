import 'dart:typed_data';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tlbisibida_doc/domain/models/medical%20cases/case_details.dart';
import 'package:tlbisibida_doc/domain/models/medical%20cases/caselist_from_lab.dart';
import 'package:tlbisibida_doc/domain/models/medical%20cases/comments.dart';
import 'package:tlbisibida_doc/domain/repo/cases/doc_repo_cases.dart';

class CasesCubit extends Cubit<String> {
  final DocRepoCases repo;

  CasesCubit(this.repo) : super('');

  //get case list

  List<MedicalCaseItem> caselist = [];
  List<Comment> comments = [];

  Future<void> getcaselist(int id) async {
    emit('case_list_loading');
    try {
      await repo.getcaseList(id);
    } on Exception catch (e) {
      emit('error');
      print(e.toString());
    }

    for (var caseitem in repo.dbMedicalCasesListResponse!.medicalCases!) {
      caselist.add(caseitem.toDomain());
    }

    caselist.isNotEmpty ? emit('case_list_loaded') : emit('error');
    print(state);
  }

  //get case details
  MedicalCase? medicalCase;

  Future<void> getCaseDetails(int id) async {
    emit('case_details_loading');
    try {
      await repo.getCaseDetails(id);
    } on Exception catch (e) {
      emit('error');
      print(e.toString());
    }

    medicalCase = (repo.dbMedicalCaseResponse!.medicalCase!.toDomain());

    if (medicalCase != null) {
      emit('case_details_loaded');
      print(state);
      for (var file in medicalCase!.medicalCaseFiles) {
        getImage(file.id!);
      }
    }
    emit('images_loaded');
    print(state);
  }

  //get comments

  Future<void> getcomment(int id) async {
    emit('comments_loading');
    try {
      await repo.getComments(id);
    } on Exception catch (e) {
      emit('error');
      print(e.toString());
    }

    for (var comment in repo.dbCommentsResponse!.comments!) {
      comments.add(comment.toDomain());
    }
    comments.isNotEmpty ? emit('comments_loaded') : emit('error');
    print(state);
  }
  //get confirm delivery

  Future<void> confirmdelivery(int id) async {
    bool succsess = false;
    emit('confirming');
    try {
      succsess = await repo.confirmDelivery(id);
    } on Exception catch (e) {
      emit('error');
      print(e.toString());
    }

    succsess ? emit('confirmed') : emit('error');
    print(state);
  }

  //get img
  List<Uint8List> imgList = [];
  Future<void> getImage(int id) async {
    var image = await repo.getCasesimage(id);
    image != null ? imgList.add(image) : image;
    emit('image_added');
  }
}
