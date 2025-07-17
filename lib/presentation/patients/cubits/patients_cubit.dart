import 'dart:typed_data';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tlbisibida_doc/domain/models/appoinments & patients/show_patient_details_withimg.dart';
import 'package:tlbisibida_doc/domain/models/appoinments & patients/all_patients.dart';
import 'package:tlbisibida_doc/domain/models/dentist sessions/show_patient_treatments.dart';
import 'package:tlbisibida_doc/domain/models/dentist sessions/show_treatment_details.dart';
import 'package:tlbisibida_doc/domain/models/patients payments/patient_payments.dart';
import 'package:tlbisibida_doc/domain/models/patients payments/patients_payment_from_to.dart';
import 'package:tlbisibida_doc/domain/repo/patients/doc_repo_patients.dart';
import 'package:tlbisibida_doc/presentation/patients/cubits/patient_states.dart';

class PatientsCubit extends Cubit<PatientsState> {
  final DocRepoPatients repo;
  String? lastError;

  PatientsCubit(this.repo) : super(PatientsInitial());

  // Patient Details
  PatientDetails? patientDetails;
  Future<void> getPatientDetails(int id) async {
    emit(PatientDetailsLoading());
    lastError = null;
    patientDetails = null;
    try {
      await repo.getPatientDetails(id);
      patientDetails =
          repo.dbPatientDetailsResponse?.patientDetails?.todomain();
      if (patientDetails != null) {
        emit(PatientDetailsLoaded(patientDetails!));
      } else {
        lastError = 'No patient details found.';
        emit(PatientDetailsError(lastError!));
      }
    } catch (e, stack) {
      lastError = e.toString();
      emit(PatientDetailsError(lastError!, stackTrace: stack));
    }
  }

  // Patient Treatments
  List<PatientTreatment> patientTreatments = [];
  Future<void> getPatientTreatment(int id) async {
    emit(PatientTreatmentsLoading());
    lastError = null;
    patientTreatments.clear();
    try {
      await repo.getPatientTreatment(id);
      final treatments = repo.dbPatientTreatmentsResponse?.patientTreatments;
      if (treatments != null && treatments.isNotEmpty) {
        patientTreatments = treatments.map((e) => e.toDomain()).toList();
        emit(PatientTreatmentsLoaded(patientTreatments));
      } else {
        lastError = 'No treatments found.';
        emit(PatientTreatmentsError(lastError!));
      }
    } catch (e, stack) {
      lastError = e.toString();
      emit(PatientTreatmentsError(lastError!, stackTrace: stack));
    }
  }

  // Treatment Details
  TreatmentDetails? treatmentDetails;
  Future<void> getTreatmentDetails(int id) async {
    emit(TreatmentDetailsLoading());
    lastError = null;
    treatmentDetails = null;
    try {
      await repo.getTreatmentDetails(id);
      treatmentDetails =
          repo.dbTreatmentDetailsResponse?.treatmentDetails?.toDomain();
      if (treatmentDetails != null) {
        emit(TreatmentDetailsLoaded(treatmentDetails!));
      } else {
        lastError = 'No treatment details found.';
        emit(TreatmentDetailsError(lastError!));
      }
    } catch (e, stack) {
      lastError = e.toString();
      emit(TreatmentDetailsError(lastError!, stackTrace: stack));
    }
  }

  // Patient Payments
  List<PatientPayment> patientPayments = [];
  Future<void> getPatientPayments(int id) async {
    emit(PatientPaymentsLoading());
    lastError = null;
    patientPayments.clear();
    try {
      await repo.getPatientPayments(id);
      final payments = repo.dbPatientPaymentsResponse?.patientPayments;
      if (payments != null && payments.isNotEmpty) {
        patientPayments = payments.map((e) => e.toDomain()).toList();
        emit(PatientPaymentsLoaded(patientPayments));
      } else {
        lastError = 'No payments found.';
        emit(PatientPaymentsError(lastError!));
      }
    } catch (e, stack) {
      lastError = e.toString();
      emit(PatientPaymentsError(lastError!, stackTrace: stack));
    }
  }

  // Patients Payments From-To
  List<PatientBalance> patientsPaymentsFromTo = [];
  Future<void> getPatientPaymentsFromTo() async {
    emit(PatientsPaymentsFromToLoading());
    lastError = null;
    patientsPaymentsFromTo.clear();
    try {
      await repo.getPatientPaymentsFromTo();
      final balances = repo.dbPatientsPaymentsFromToResponse?.patientsPayments;
      if (balances != null && balances.isNotEmpty) {
        patientsPaymentsFromTo = balances.map((e) => e.toDomain()).toList();
        emit(PatientsPaymentsFromToLoaded(patientsPaymentsFromTo));
      } else {
        lastError = 'No patient balances found.';
        emit(PatientsPaymentsFromToError(lastError!));
      }
    } catch (e, stack) {
      lastError = e.toString();
      emit(PatientsPaymentsFromToError(lastError!, stackTrace: stack));
    }
  }

  // All Patients with Pagination
  List<PatientData> patients = [];
  PaginatedPatients? pagination;
  int currentPage = 1;
  bool isLoadingMore = false;

  // Search and Sort State
  String searchQuery = '';
  String currentSortBy = '';
  List<PatientData> filteredPatients = [];

  Future<void> getAllPatients({String? fullName, String? sortBy}) async {
    emit(PatientsLoading());
    currentPage = 1;
    patients.clear();
    filteredPatients.clear();
    searchQuery = fullName ?? '';
    currentSortBy = sortBy ?? '';

    try {
      await repo.getAllPatients(
          fullName: fullName, sortBy: sortBy, page: currentPage);
      final response = repo.dbAllPatientsResponse;
      if (response?.status == true && response?.patients != null) {
        patients =
            response!.patients!.data?.map((e) => e.toDomain()).toList() ?? [];
        pagination = response.patients!.toDomain();
        _applySearchAndSort();
        emit(PatientsLoaded(filteredPatients, pagination!));
      } else {
        emit(PatientsError('لا يوجد مرضى.'));
      }
    } catch (e, stack) {
      emit(PatientsError('حدث خطأ أثناء جلب المرضى', stackTrace: stack));
    }
  }

  // Load more patients for pagination
  Future<void> loadMorePatients({String? fullName, String? sortBy}) async {
    if (pagination?.nextPageUrl == null || isLoadingMore) return;

    isLoadingMore = true;
    currentPage++;

    try {
      await repo.getAllPatients(
          fullName: fullName, sortBy: sortBy, page: currentPage);
      final response = repo.dbAllPatientsResponse;
      if (response?.status == true && response?.patients != null) {
        final newPatients =
            response!.patients!.data?.map((e) => e.toDomain()).toList() ?? [];
        patients.addAll(newPatients);
        pagination = response.patients!.toDomain();
        _applySearchAndSort();
        emit(PatientsLoaded(filteredPatients, pagination!));
      }
    } catch (e, stack) {
      currentPage--; // Revert page on error
      emit(PatientsError('حدث خطأ أثناء تحميل المزيد من المرضى',
          stackTrace: stack));
    } finally {
      isLoadingMore = false;
    }
  }

  // Search functionality
  void searchPatients(String query) {
    searchQuery = query;
    _applySearchAndSort();
    emit(PatientsLoaded(filteredPatients, pagination!));
  }

  // Sort functionality
  void sortPatients(String sortBy) {
    currentSortBy = sortBy;
    _applySearchAndSort();
    emit(PatientsLoaded(filteredPatients, pagination!));
  }

  // Apply search and sort to the current patients list
  void _applySearchAndSort() {
    // Apply search
    filteredPatients = patients.where((patient) {
      final name = patient.fullName?.toLowerCase() ?? '';
      final phone = patient.phone?.toLowerCase() ?? '';
      final query = searchQuery.toLowerCase();
      return name.contains(query) || phone.contains(query);
    }).toList();

    // Apply sort
    switch (currentSortBy) {
      case 'name_asc':
        filteredPatients
            .sort((a, b) => (a.fullName ?? '').compareTo(b.fullName ?? ''));
        break;
      case 'name_desc':
        filteredPatients
            .sort((a, b) => (b.fullName ?? '').compareTo(a.fullName ?? ''));
        break;
      case 'created_asc':
        filteredPatients.sort((a, b) => (a.createdAt ?? DateTime.now())
            .compareTo(b.createdAt ?? DateTime.now()));
        break;
      case 'created_desc':
        filteredPatients.sort((a, b) => (b.createdAt ?? DateTime.now())
            .compareTo(a.createdAt ?? DateTime.now()));
        break;
      case 'balance_asc':
        filteredPatients.sort(
            (a, b) => (a.currentBalance ?? 0).compareTo(b.currentBalance ?? 0));
        break;
      case 'balance_desc':
        filteredPatients.sort(
            (a, b) => (b.currentBalance ?? 0).compareTo(a.currentBalance ?? 0));
        break;
      default:
        // No sorting
        break;
    }
  }

  List<Uint8List> imgList = [];
  Future<void> getPatientSessionImages(int id) async {
    var image = await repo.getPatientSessionPix(id);
    if (image != null) imgList.add(image);
    emit(ImagesLoaded(imgList));
  }

  // Future<void> fetchPatientTreatments(int patientId) async {
  //   emit(PatientTreatmentsLoading());
  //   try {
  //     await repo.getPatientTreatment(patientId);
  //     final treatments = repo.dbPatientTreatmentsResponse?.patientTreatments;
  //     if (treatments != null && treatments.isNotEmpty) {
  //       emit(PatientTreatmentsLoaded(
  //           treatments.map((e) => e.toDomain()).toList()));
  //     } else {
  //       emit(PatientTreatmentsError('لا يوجد علاجات لهذا المريض.'));
  //     }
  //   } catch (e, stack) {
  //     emit(PatientTreatmentsError('حدث خطأ أثناء جلب العلاجات.',
  //         stackTrace: stack));
  //   }
  // }

  // Future<void> fetchTreatmentDetails(int treatmentId) async {
  //   emit(TreatmentDetailsLoading());
  //   try {
  //     await repo.getTreatmentDetails(treatmentId);
  //     final details = repo.dbTreatmentDetailsResponse?.treatmentDetails;
  //     if (details != null) {
  //       emit(TreatmentDetailsLoaded(details.toDomain()));
  //     } else {
  //       emit(TreatmentDetailsError('لم يتم العثور على تفاصيل العلاج.'));
  //     }
  //   } catch (e, stack) {
  //     emit(TreatmentDetailsError('حدث خطأ أثناء جلب تفاصيل العلاج.',
  //         stackTrace: stack));
  //   }
  // }
}
