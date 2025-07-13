import 'package:flip_card/flip_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';

import 'package:tlbisibida_doc/constants/constants.dart';
import 'package:tlbisibida_doc/services/navigation/routes.dart';
import 'package:tlbisibida_doc/presentation/patients/components/bottom_action_buttons_patients.dart';
import 'package:tlbisibida_doc/presentation/patients/components/dialogs/add_patient_dialog.dart';
import 'package:tlbisibida_doc/presentation/patients/components/dialogs/patient_info_button.dart';
import 'package:intl/intl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tlbisibida_doc/presentation/patients/cubits/patients_cubit.dart';
import 'package:tlbisibida_doc/presentation/patients/cubits/patient_states.dart';
import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:tlbisibida_doc/domain/models/appoinments & patients/all_patients.dart';
import 'package:tlbisibida_doc/utils/date_utils.dart' as custom_date_utils;

enum SortOption {
  nameAsc,
  nameDesc,
  createdAsc,
  createdDesc,
  balanceAsc,
  balanceDesc,
}

class PatientsListScreen extends StatelessWidget {
  const PatientsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PatientsCubit, PatientsState>(
      listener: (context, state) {
        if (state is PatientsError ||
            state is PatientDetailsError ||
            state is PatientTreatmentsError ||
            state is PatientPaymentsError ||
            state is PatientsPaymentsFromToError) {
          final message = (state as dynamic).message;
          AnimatedSnackBar.material(
            message,
            type: AnimatedSnackBarType.error,
            mobileSnackBarPosition: MobileSnackBarPosition.bottom,
            duration: Duration(seconds: 3),
            animationCurve: Easing.standard,
          ).show(context);
        }
      },
      builder: (context, state) {
        if (state is PatientsInitial) {
          // Load initial data
          context.read<PatientsCubit>().getAllPatients();
          return const Center(child: CircularProgressIndicator());
        }

        if (state is PatientsLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is PatientsLoaded) {
          return _PatientsListContent(
              patients: state.patients, pagination: state.pagination);
        }

        if (state is PatientsError) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.error_outline, size: 64, color: redmain),
                SizedBox(height: 16),
                Text(
                  state.message,
                  style: TextStyle(color: redmain, fontSize: 16),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: cyan400),
                  onPressed: () =>
                      context.read<PatientsCubit>().getAllPatients(),
                  child: Text('إعادة المحاولة'),
                ),
              ],
            ),
          );
        }

        return const Center(child: Text('لا يوجد بيانات'));
      },
    );
  }
}

class _PatientsListContent extends StatelessWidget {
  final List<PatientData> patients;
  final PaginatedPatients pagination;

  const _PatientsListContent({
    required this.patients,
    required this.pagination,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cyan50,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // Search and Sort Row
            _SearchAndSortRow(),
            const SizedBox(height: 15),
            // GridView wrapped in Expanded
            Expanded(
              child: SizedBox(
                width: 600,
                child:
                    _PatientsGrid(patients: patients, pagination: pagination),
              ),
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return addPatientDialog(context);
            },
          );
        },
        mini: true,
        backgroundColor: cyan400,
        foregroundColor: white,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: cyan600, width: 1.5),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(
          Icons.add,
          size: 28,
        ),
      ),
    );
  }
}

class _SearchAndSortRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(
                top: 10.0, bottom: 15, left: 20.0, right: 10),
            child: TextField(
              controller: TextEditingController(),
              decoration: InputDecoration(
                label: Text(
                  'ابحث عن مريض...',
                  style: TextStyle(color: cyan500),
                ),
                prefixIcon: Icon(Icons.search, color: cyan400),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: cyan300, width: .5),
                  borderRadius: standardBorderRadius,
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Theme.of(context).primaryColor, width: 2.0),
                  borderRadius: standardBorderRadius,
                ),
              ),
              onChanged: (value) {
                context.read<PatientsCubit>().searchPatients(value);
              },
            ),
          ),
        ),
        IconButton(
          icon: Icon(
            CupertinoIcons.sort_down,
            color: cyan400,
          ),
          onPressed: () => _showSortDialog(context),
          tooltip: 'ترتيب',
          iconSize: 28,
        ),
      ],
    );
  }

  void _showSortDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            'ترتيب المرضى',
            style: TextStyle(color: cyan500),
            textAlign: TextAlign.center,
          ),
          content: SizedBox(
            width: double.maxFinite,
            child: ListView(
              shrinkWrap: true,
              children: [
                _buildSortOptionTile(context, 'الاسم من أ إلى ي', 'name_asc'),
                _buildSortOptionTile(context, 'الاسم من ي إلى أ', 'name_desc'),
                const Divider(),
                _buildSortOptionTile(
                    context, 'تاريخ الإضافة (الأقدم أولاً)', 'created_asc'),
                _buildSortOptionTile(
                    context, 'تاريخ الإضافة (الأحدث أولاً)', 'created_desc'),
                const Divider(),
                _buildSortOptionTile(
                    context, 'الرصيد (الأقل أولاً)', 'balance_asc'),
                _buildSortOptionTile(
                    context, 'الرصيد (الأكثر أولاً)', 'balance_desc'),
              ],
            ),
          ),
        );
      },
    );
  }

  ListTile _buildSortOptionTile(
      BuildContext context, String title, String sortBy) {
    return ListTile(
      title: Text(
        title,
        textAlign: TextAlign.center,
      ),
      onTap: () {
        context.read<PatientsCubit>().sortPatients(sortBy);
        Navigator.of(context).pop();
      },
    );
  }
}

class _PatientsGrid extends StatelessWidget {
  final List<PatientData> patients;
  final PaginatedPatients pagination;

  const _PatientsGrid({
    required this.patients,
    required this.pagination,
  });

  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController = ScrollController();

    // Add scroll listener for pagination
    scrollController.addListener(() {
      if (scrollController.position.pixels >=
          scrollController.position.maxScrollExtent - 200) {
        if (pagination.nextPageUrl != null) {
          context.read<PatientsCubit>().loadMorePatients();
        }
      }
    });

    return GridView.builder(
      controller: scrollController,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: .9,
        crossAxisSpacing: 7,
        mainAxisSpacing: 7,
      ),
      itemCount: patients.length + (pagination.nextPageUrl != null ? 1 : 0),
      itemBuilder: (context, index) {
        if (index == patients.length) {
          // Show loading indicator for pagination
          return Center(
            child: CircularProgressIndicator(color: cyan400),
          );
        }

        final patient = patients[index];
        return itemcard(context, patient, onTap: () {
          // Navigate to patient details
          context.push('$patientListRoute/${patient.id}');
        })
            .animate()
            .slide(duration: const Duration(milliseconds: 300))
            .fadeIn(
                curve: Curves.easeInOut,
                duration: const Duration(milliseconds: 250))
            .flip(duration: const Duration(milliseconds: 200));
      },
    );
  }
}

Widget itemcard(BuildContext context, PatientData patient,
    {VoidCallback? onTap}) {
  return FlipCard(
    fill: Fill.fillBack,
    direction: FlipDirection.HORIZONTAL,
    side: CardSide.FRONT,
    front: Card(
      clipBehavior: Clip.antiAlias,
      color: white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(height: 5),
          Text(
            patient.fullName ?? 'غير محدد',
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: cyan400,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 5),
          Container(
            height: .5,
            width: 100,
            color: cyan600,
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                CupertinoIcons.phone_circle_fill,
                size: 14,
                color: cyan500,
              ),
              SizedBox(width: 7),
              Text(
                patient.phone ?? 'غير محدد',
                style: const TextStyle(color: cyan400, fontSize: 14),
              ),
            ],
          ),
          const SizedBox(height: 5),
          bottomActionButtonsPatients(context),
        ],
      ),
    ),
    back: Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(height: 5),
          Column(
            children: [
              Text(
                'العمر: ${custom_date_utils.DateUtils.calculateAge(patient.birthday)}',
                style: const TextStyle(color: cyan400, fontSize: 16),
              ),
              const SizedBox(height: 8),
              Text(
                'الجنس: ${patient.gender ?? 'غير محدد'}',
                style: const TextStyle(color: cyan400, fontSize: 14),
              ),
              const SizedBox(height: 8),
              Text(
                'الرصيد: ${patient.currentBalance?.toString() ?? '0'} ل.س',
                style: TextStyle(
                  color: (patient.currentBalance ?? 0) < 0 ? redmain : cyan400,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              if (patient.createdAt != null) ...[
                const SizedBox(height: 8),
                Text(
                  'تاريخ الإضافة: ${DateFormat('yyyy-MM-dd').format(patient.createdAt!)}',
                  style: const TextStyle(color: cyan400, fontSize: 14),
                ),
              ],
            ],
          ),
          const SizedBox(height: 5),
          Container(
            height: .5,
            width: 100,
            color: cyan600,
          ),
          const SizedBox(height: 5),
          patient.isSmoker == 1
              ? Icon(Icons.smoking_rooms_rounded, color: redmain)
              : Icon(Icons.smoke_free_rounded, color: cyan300),
          const SizedBox(height: 5),
          patientInfoButton(context, patient.id ?? 0),
        ],
      ),
    ),
  );
}
