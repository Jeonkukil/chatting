import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _authentication = FirebaseAuth.instance;
  User? loggedUser;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() {
    try {
      final user = _authentication.currentUser;
      if (user != null) {
        loggedUser = user;
        print(loggedUser!.email);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kiwi chat App'),
        actions: [
          IconButton(
              icon: Icon(
                Icons.exit_to_app_sharp,
                color: Colors.red,
              ),
              onPressed: () {
                _authentication.signOut();

              })
        ],
      ),
      // Stream은 Flutter 기본 재공 위젯
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('chats/LAydzAvuR7QRlqfBrGZe/message')
            .snapshots(),
        builder: (BuildContext context,
            AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          // 받은 데이터를 전달받는 코드
          final docs = snapshot.data!.docs;
          return ListView.builder(
            itemCount: docs.length,
            itemBuilder: (context, index) {
              return Container(
                padding: EdgeInsets.all(8.0),
                child: Text(docs[index]['text'],
                style: TextStyle(
                  fontSize: 20.0
                ),),
              );
            },
          );
        },
        //  새로운 value값이 데이터를 순차적으로 나열해주는 리스트뷰 빌더를 리턴해줘야 한다.
      ),
    );
  }
}
