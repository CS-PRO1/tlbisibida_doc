// ignore_for_file: unused_local_variable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tlbisibida_doc/constants/constants.dart'; // Assuming cyan400 is defined here
import 'package:tlbisibida_doc/services/BloC/States/teeth_state.dart';
import 'package:tlbisibida_doc/services/BloC/Cubits/teeth_cubit.dart';

class TeethSelectionScreen extends StatelessWidget {
  final String asset;

  const TeethSelectionScreen({super.key, required this.asset});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TeethCubit()..loadTeeth(asset),
      child: BlocBuilder<TeethCubit, TeethState>(
        builder: (context, state) {
          if (state is TeethInitial || state is TeethLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is TeethError) {
            return Center(child: Text(state.message));
          }

          if (state is TeethLoaded) {
            final cubit = context.read<TeethCubit>();
            final data = state.data;

            // Extract unique selected treatments for the legend
            final selectedTreatments = data.teeth.values
                .where((tooth) => tooth.selected && tooth.treatment != null)
                .map((tooth) => tooth.treatment!)
                .toSet();

            // Find a tooth for each selected treatment to get its color
            final treatmentColors = {
              for (var treatment in selectedTreatments)
                treatment: data.teeth.values
                    .firstWhere((tooth) => tooth.treatment == treatment)
                    .color
            };

            return SingleChildScrollView(
              child:
                  // Use a Stack to layer the chart and the legend
                  Stack(
                children: [
                  // The Tooth Chart (positioned at the bottom of the stack)
                  FittedBox(
                    child: SizedBox.fromSize(
                      size: data.size,
                      child: Stack(
                        children: [
                          // teeth
                          for (final MapEntry(key: key, value: tooth)
                              in data.teeth.entries)
                            Positioned.fromRect(
                              rect: tooth.rect,
                              child: Stack(
                                children: [
                                  Tooltip(
                                    message: 'tooth\n${tooth.id}',
                                    textAlign: TextAlign.center,
                                    preferBelow: false,
                                    decoration: const BoxDecoration(
                                      color: Colors.black87,
                                      border: Border.symmetric(
                                          horizontal: BorderSide(
                                              color: Colors.white54)),
                                    ),
                                    child: AnimatedContainer(
                                      duration:
                                          const Duration(milliseconds: 250),
                                      clipBehavior: Clip.antiAlias,
                                      decoration: ShapeDecoration(
                                        color: tooth.selected
                                            ? tooth.color
                                            : Colors.white,
                                        shadows: tooth.selected
                                            ? [
                                                const BoxShadow(
                                                    blurRadius: 4,
                                                    offset: Offset(0, 6))
                                              ]
                                            : null,
                                        shape: ToothBorder(tooth.path),
                                      ),
                                      child: Material(
                                        type: MaterialType.transparency,
                                        child: InkWell(
                                          splashColor: tooth.selected
                                              ? Colors.white
                                              : Colors.teal.shade100,
                                          highlightColor: Colors.transparent,
                                          onTap: () {
                                            if (!tooth.selected) {
                                              _showAlertDialog(
                                                  context, tooth, cubit);
                                            } else {
                                              _showClearDialog(
                                                  context, tooth, cubit);
                                            }
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned.fill(
                                    child: Center(
                                      child: Text(
                                        '${tooth.id}',
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          // connections
                          for (final MapEntry(key: key, value: connection)
                              in data.connections.entries)
                            Positioned.fromRect(
                              rect: connection.rect,
                              child: Tooltip(
                                message:
                                    'connection between tooth ${connection.tooth1Id} and tooth ${connection.tooth2Id}',
                                textAlign: TextAlign.center,
                                preferBelow: false,
                                decoration: const BoxDecoration(
                                  color: Colors.black87,
                                  border: Border.symmetric(
                                      horizontal:
                                          BorderSide(color: Colors.white54)),
                                ),
                                child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 250),
                                  clipBehavior: Clip.antiAlias,
                                  decoration: ShapeDecoration(
                                    color: connection.selected
                                        ? Colors.teal.shade400
                                        : Colors.white,
                                    shadows: connection.selected
                                        ? [
                                            const BoxShadow(
                                                blurRadius: 4,
                                                offset: Offset(0, 6))
                                          ]
                                        : null,
                                    shape: ToothBorder(connection.path!),
                                  ),
                                  child: Material(
                                    type: MaterialType.transparency,
                                    child: InkWell(
                                      splashColor: connection.selected
                                          ? Colors.white
                                          : Colors.teal.shade100,
                                      highlightColor: Colors.transparent,
                                      onTap: () {
                                        cubit.toggleConnectionSelection(
                                            connection);
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                  // Legend (positioned on top of the chart, centered)
                  if (selectedTreatments.isNotEmpty)
                    Positioned(
                      top: 0, // Positioned to span the full height and width
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Center(
                        // Center the legend content
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min, // Use minimum space
                          children: [
                            // Removed the "Legend:" title
                            ...treatmentColors.entries.map(
                              (entry) => Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 4.0),
                                child: Row(
                                  mainAxisSize:
                                      MainAxisSize.min, // Use minimum space
                                  children: [
                                    Container(
                                      width: 16, // Smaller color box
                                      height: 16,
                                      color: entry.value,
                                      margin: const EdgeInsets.only(right: 8),
                                    ),
                                    Text(entry.key,
                                        style: TextStyle(
                                            fontSize: 14)), // Smaller text
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }

  void _showAlertDialog(BuildContext context, Tooth tooth, TeethCubit cubit) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        content: Text(
          'اختر العلاج:',
          style: TextStyle(
              fontWeight: FontWeight.bold, color: cyan400, fontSize: 18),
        ),
        actions: <CupertinoDialogAction>[
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () {
              Navigator.pop(context);
              cubit.setToothTreatment(tooth, 'تاج');
              _showAlertDialog2(context, tooth, cubit);
            },
            child: const Text('تاج'),
          ),
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () {
              Navigator.pop(context);
              cubit.setToothTreatment(tooth, 'دمية');
              _showAlertDialog2(context, tooth, cubit);
            },
            child: const Text('دمية'),
          ),
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () {
              Navigator.pop(context);
              cubit.setToothTreatment(tooth, 'زرعة');
              _showAlertDialog2(context, tooth, cubit);
            },
            child: const Text('زرعة'),
          ),
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () {
              Navigator.pop(context);
              cubit.setToothTreatment(tooth, 'فينير');
              _showAlertDialog2(context, tooth, cubit);
            },
            child: const Text('فينير'),
          ),
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () {
              Navigator.pop(context);
              cubit.setToothTreatment(tooth, 'حشوة');
              _showAlertDialog2(context, tooth, cubit);
            },
            child: const Text('حشوة'),
          ),
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () {
              Navigator.pop(context);
              cubit.setToothTreatment(tooth, 'بدلة');
              _showAlertDialog2(context, tooth, cubit);
            },
            child: const Text('بدلة'),
          ),
        ],
      ),
    );
  }

  void _showAlertDialog2(BuildContext context, Tooth tooth, TeethCubit cubit) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        content: Text(
          'اختر المادة العلاجية:',
          style: TextStyle(
              fontWeight: FontWeight.bold, color: cyan400, fontSize: 18),
        ),
        actions: <CupertinoDialogAction>[
          if (tooth.treatment != 'بدلة')
            CupertinoDialogAction(
              isDefaultAction: true,
              onPressed: () {
                Navigator.pop(context);
                cubit.setToothMaterial(tooth, 'زيركون');
                cubit.toggleToothSelection(
                    tooth); // Select after material is set
              },
              child: const Text('زيركون'),
            ),
          if (tooth.treatment != 'بدلة' &&
              tooth.treatment != 'حشوة' &&
              tooth.treatment != 'فينير')
            CupertinoDialogAction(
              isDefaultAction: true,
              onPressed: () {
                Navigator.pop(context);
                cubit.setToothMaterial(tooth, 'خزف على معدن');
                cubit.toggleToothSelection(
                    tooth); // Select after material is set
              },
              child: const Text('خزف على معدن'),
            ),
          if (tooth.treatment != 'بدلة' &&
              tooth.treatment != 'حشوة' &&
              tooth.treatment != 'فينير')
            CupertinoDialogAction(
              isDefaultAction: true,
              onPressed: () {
                Navigator.pop(context);
                cubit.setToothMaterial(tooth, 'شمع');
                cubit.toggleToothSelection(
                    tooth); // Select after material is set
              },
              child: const Text('شمع'),
            ),
          if (tooth.treatment != 'بدلة' &&
              tooth.treatment != 'حشوة' &&
              tooth.treatment != 'فينير')
            CupertinoDialogAction(
              isDefaultAction: true,
              onPressed: () {
                Navigator.pop(context);
                cubit.setToothMaterial(tooth, 'أكريل مؤقت');
                cubit.toggleToothSelection(
                    tooth); // Select after material is set
              },
              child: const Text('أكريل مؤقت'),
            ),
          if (tooth.treatment == 'حشوة' || tooth.treatment == 'فينير')
            CupertinoDialogAction(
              isDefaultAction: true,
              onPressed: () {
                Navigator.pop(context);
                cubit.setToothMaterial(tooth, 'EMax');
                cubit.toggleToothSelection(
                    tooth); // Select after material is set
              },
              child: const Text('EMax'),
            ),
          if (tooth.treatment == 'بدلة')
            CupertinoDialogAction(
              isDefaultAction: true,
              onPressed: () {
                Navigator.pop(context);
                cubit.setToothMaterial(tooth, 'أكريل');
                cubit.toggleToothSelection(
                    tooth); // Select after material is set
              },
              child: const Text('أكريل'),
            ),
          if (tooth.treatment == 'بدلة')
            CupertinoDialogAction(
              isDefaultAction: true,
              onPressed: () {
                Navigator.pop(context);
                cubit.setToothMaterial(tooth, 'أكريل مبطن');
                cubit.toggleToothSelection(
                    tooth); // Select after material is set
              },
              child: const Text('أكريل مبطن'),
            ),
          if (tooth.treatment == 'بدلة')
            CupertinoDialogAction(
              isDefaultAction: true,
              onPressed: () {
                Navigator.pop(context);
                cubit.setToothMaterial(tooth, 'فليكس');
                cubit.toggleToothSelection(
                    tooth); // Select after material is set
              },
              child: const Text('فليكس'),
            ),
        ],
      ),
    );
  }

  void _showClearDialog(BuildContext context, Tooth tooth, TeethCubit cubit) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        content: const Text(
          'إلغاء اختيار السن؟',
          style: TextStyle(fontSize: 18),
        ),
        actions: <CupertinoDialogAction>[
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () {
              Navigator.pop(context);
              cubit.clearTooth(tooth);
            },
            child: const Text('نعم', style: TextStyle(color: Colors.red)),
          )
        ],
      ),
    );
  }
}
