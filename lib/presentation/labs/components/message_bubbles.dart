import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tlbisibida_doc/constants/constants.dart';
import 'package:chat_bubbles/bubbles/bubble_special_three.dart';
import 'package:tlbisibida_doc/presentation/labs/cases/cubit/cases_cubit.dart';

Widget chatBubbleBuilder(
  BuildContext context,
  int index,
) {
  final cubit = context.read<CasesCubit>();

  final message = cubit.comments[index];
  bool isSender = message.dentistId != null;
  return BubbleSpecialThree(
    text: message.comment!,
    color: isSender == false ? cyan400 : cyan50,
    // tail: message['tail'],
    isSender: isSender,
    textStyle: TextStyle(
      color: isSender == false ? Colors.black : Colors.white,
      fontSize: 16,
    ),
  );
}
