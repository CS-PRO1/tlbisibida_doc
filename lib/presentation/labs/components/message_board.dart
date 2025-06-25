import 'package:chat_bubbles/message_bars/message_bar.dart';
import 'package:flutter/material.dart';
import 'package:tlbisibida_doc/constants/constants.dart';
import 'package:tlbisibida_doc/presentation/labs/components/message_bubbles.dart';

Widget messageBoard(BuildContext context) {
  return Column(
    children: [
      SizedBox(
        height: 50,
        width: double.infinity,
        child: DrawerHeader(
          decoration: BoxDecoration(
            color: cyan300,
          ),
          margin: EdgeInsets.all(0),
          padding: EdgeInsets.all(10),
          child: Text(
            "التعليقات",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      // Add an empty space between the title and messages
      SizedBox(
        height: 20, // You can adjust the height based on the space you want
      ),
      Expanded(
        child: ListView.builder(
          padding: EdgeInsets.zero, // Ensure no extra padding
          itemCount: messages.length,
          itemBuilder: (context, index) => chatBubbleBuilder(context, index),
        ),
      ),
      Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context)
              .viewInsets
              .bottom, // Accounts for keyboard height
        ),
        child: MessageBar(
          messageBarHintText: 'اكتب تعليقك هنا',
          sendButtonColor: cyan400,
          onSend: (p0) {},
        ),
      ),
      SizedBox(
        height: 50,
      ),
    ],
  );
}
