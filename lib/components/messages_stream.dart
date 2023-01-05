import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'message_bubble.dart';

final db = FirebaseFirestore.instance;

class MessagesStream extends StatelessWidget {
  final currentUserEmail;

  MessagesStream(this.currentUserEmail);
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: db.collection('messages').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return CircularProgressIndicator(
            backgroundColor: Colors.lightBlueAccent,
          );
        }
        var messages = snapshot.data.docs.reversed;
        List<MessageBubble> listOfMessages = [];
        for (var message in messages) {
          listOfMessages.add(MessageBubble(
            sender: message['sender'],
            message: message['body'],
            isMe: currentUserEmail == message['sender'] ? true : false,
          ));
        }
        return Expanded(
          child: ListView(
            reverse: true,
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            children: listOfMessages,
          ),
        );
      },
    );
  }
}
