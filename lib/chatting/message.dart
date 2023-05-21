
import 'package:chatting/chatting/chat/chat_bubble.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Messages extends StatelessWidget {
  const Messages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('chat')
      // 타임스테프 정렬
      .orderBy('time', descending: true)
          //정렬 방식은 ascending 방식과 descending 방식이 있다. 여기서는 최신의 메시지가 가장 밑에 보여지길
          //원하므로 descending방식으로 한다.
          .snapshots(),
      builder: (context,
          AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        final chatDocs = snapshot.data!.docs;

        return ListView.builder(
          reverse: true,
          itemCount: chatDocs.length,
          itemBuilder: (context, index) {
            return ChatBubble(chatDocs[index]['text'],
            chatDocs[index]['userID'].toString() == user!.uid
            );
          },
        );
      },
    );
  }
}
