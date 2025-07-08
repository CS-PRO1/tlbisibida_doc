// lib/domain/models/medical_cases/medical_case_domain.dart

// ignore_for_file: depend_on_referenced_packages

import 'package:equatable/equatable.dart';

/// Represents the comprehensive details of a medical case in the domain layer.
/// This model is agnostic to how data is fetched or stored.
class MedicalCaseResponse extends Equatable {
  final int id;
  final int patientId;
  final String patientFullName;
  final String patientGender;
  final String dentistFullName;
  final String age; // Keeping as string as per your DTO and JSON
  final String expectedDeliveryDate;
  final String? shade;
  final String? notes;
  final int status; // Business status, e.g., 0 for pending, 1 for completed
  final int cost;
  final List<String>
      teethCrowns; // List of individual tooth numbers with crowns
  final List<MedicalCaseFileDomain>
      files; // Associated files for the medical case

  const MedicalCaseResponse({
    required this.id,
    required this.patientId,
    required this.patientFullName,
    required this.patientGender,
    required this.dentistFullName,
    required this.age,
    required this.expectedDeliveryDate,
    this.shade,
    this.notes,
    required this.status,
    required this.cost,
    required this.teethCrowns,
    required this.files,
  });

  @override
  List<Object?> get props => [
        id,
        patientId,
        patientFullName,
        patientGender,
        dentistFullName,
        age,
        expectedDeliveryDate,
        shade,
        notes,
        status,
        cost,
        teethCrowns,
        files,
      ];
}

/// Represents a file associated with a medical case in the domain layer.
class MedicalCaseFileDomain extends Equatable {
  final int id;
  final String name;
  final bool isCaseImage; // True if this file is a primary image for the case

  const MedicalCaseFileDomain({
    required this.id,
    required this.name,
    required this.isCaseImage,
  });

  @override
  List<Object?> get props => [id, name, isCaseImage];
}
