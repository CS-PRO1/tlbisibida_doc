import 'package:flutter/material.dart';
import 'package:tlbisibida_doc/constants/constants.dart';
import 'package:chat_bubbles/bubbles/bubble_special_three.dart';

Widget chatBubbleBuilder(
  BuildContext context,
  int index,
) {
  final message = messages[index];
  return BubbleSpecialThree(
    text: message['text'],
    color: message['color'],
    tail: message['tail'],
    isSender: message['isSender'],
    textStyle: TextStyle(
      color: message['isSender'] == false ? Colors.black : Colors.white,
      fontSize: 16,
    ),
  );
}

final List<Map<String, dynamic>> messages = [
  {
    'text': 'Added iMessage shape bubbles',
    'color': cyan400,
    'tail': false,
    'isSender': true,
  },
  {
    'text': 'Please try and give some feedback on it!',
    'color': cyan400,
    'tail': true,
    'isSender': true,
  },
  {
    'text': 'Sure',
    'color': cyan50,
    'tail': false,
    'isSender': false,
  },
  {
    'text': "I tried. It's awesome!!!",
    'color': cyan50,
    'tail': false,
    'isSender': false,
  },
  {
    'text': "Thanks",
    'color': cyan50,
    'tail': true,
    'isSender': false,
  },
];
