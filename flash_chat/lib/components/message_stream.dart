import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import './message_bubble.dart';

class MessageStream extends StatelessWidget {
  final Firestore firestore;
  final FirebaseUser loggedInUser;

  MessageStream({this.firestore, this.loggedInUser});

  @override
  Widget build(BuildContext context) {
    print('STREAM: ${loggedInUser.email}');
    return StreamBuilder<QuerySnapshot>(
      stream: firestore.collection('messages').orderBy('date', descending: true).snapshots(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        final messages = snapshot.data.documents;
        
        List<MessageBubble> messagesWidgets = [];
        for (var message in messages) {
          final String messageText = message.data['text'];
          final String messageSender = message.data['sender'];

          final currentUserEmail = loggedInUser.email;

          final messageWidget = MessageBubble(
            text: messageText,
            sender: messageSender,
            isMe: currentUserEmail == messageSender,
          );

          messagesWidgets.add(messageWidget);
        }

        return Expanded(
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
            children: messagesWidgets,
            reverse: true,
          ),
        );
      },
    );
  }
}
