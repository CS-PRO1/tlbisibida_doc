import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tlbisibida_doc/services/BloC/States/teeth_state.dart';
import 'package:tlbisibida_doc/services/BloC/Cubits/teeth_cubit.dart';

class TeethSelectionScreen extends StatelessWidget {
  final String asset;

  const TeethSelectionScreen({Key? key, required this.asset}) : super(key: key);

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
            return SingleChildScrollView(
              child: Column(
                children: [
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
        content: const Text('Choose the treatment'),
        actions: <CupertinoDialogAction>[
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () {
              Navigator.pop(context);
              cubit.setToothTreatment(tooth, 'Crown');
              _showAlertDialog2(context, tooth, cubit);
            },
            child: const Text('Crown'),
          ),
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () {
              Navigator.pop(context);
              cubit.setToothTreatment(tooth, 'Pontic');
              _showAlertDialog2(context, tooth, cubit);
            },
            child: const Text('Pontic'),
          ),
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () {
              Navigator.pop(context);
              cubit.setToothTreatment(tooth, 'Implant');
              _showAlertDialog2(context, tooth, cubit);
            },
            child: const Text('Implant'),
          ),
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () {
              Navigator.pop(context);
              cubit.setToothTreatment(tooth, 'Veneer');
              _showAlertDialog2(context, tooth, cubit);
            },
            child: const Text('Veneer'),
          ),
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () {
              Navigator.pop(context);
              cubit.setToothTreatment(tooth, 'Inlay');
              _showAlertDialog2(context, tooth, cubit);
            },
            child: const Text('Inlay'),
          ),
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () {
              Navigator.pop(context);
              cubit.setToothTreatment(tooth, 'Denture');
              _showAlertDialog2(context, tooth, cubit);
            },
            child: const Text('Denture'),
          ),
        ],
      ),
    );
  }

  void _showAlertDialog2(BuildContext context, Tooth tooth, TeethCubit cubit) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        content: const Text('Choose the material:'),
        actions: <CupertinoDialogAction>[
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () {
              Navigator.pop(context);
              cubit.setToothMaterial(tooth, 'Zircon');
              cubit.toggleToothSelection(tooth);
            },
            child: const Text('Zircon'),
          ),
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () {
              Navigator.pop(context);
              cubit.setToothMaterial(tooth, 'Metal');
              cubit.toggleToothSelection(tooth);
            },
            child: const Text('Metal'),
          ),
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () {
              Navigator.pop(context);
              cubit.setToothMaterial(tooth, 'Wax');
              cubit.toggleToothSelection(tooth);
            },
            child: const Text('Wax'),
          ),
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () {
              Navigator.pop(context);
              cubit.setToothMaterial(tooth, 'Acrylic PMMA');
              cubit.toggleToothSelection(tooth);
            },
            child: const Text('Acrylic PMMA'),
          ),
        ],
      ),
    );
  }

  void _showClearDialog(BuildContext context, Tooth tooth, TeethCubit cubit) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        content: const Text('Clear the selected tooth?'),
        actions: <CupertinoDialogAction>[
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () {
              Navigator.pop(context);
              cubit.clearTooth(tooth);
            },
            child:
                const Text('Clear Tooth', style: TextStyle(color: Colors.red)),
          )
        ],
      ),
    );
  }
}
