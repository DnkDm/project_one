import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:project_one/service/blog_service.dart';

@RoutePage()
class PersonPage extends StatefulWidget {
  const PersonPage({super.key});

  @override
  State<PersonPage> createState() => _PersonPageState();
}

class _PersonPageState extends State<PersonPage> {
  final TextEditingController _postController = TextEditingController();
  final BlogService _chatService = BlogService();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  KeyboardVisibilityController _keyboardVisibilityController =
      KeyboardVisibilityController();
  bool keyBoard = false;

  @override
  void initState() {
    super.initState();
    _keyboardVisibilityController.onChange.listen((bool isVisible) {
      setState(() {
        keyBoard = isVisible;
        // Можете выполнить дополнительные действия при изменении видимости клавиатуры
      });
    });
  }

  void sendMessage() async {
    if (_postController.text.isNotEmpty) {
      await _chatService.sendMessage(_postController.text);
      _postController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
        setState(() {
          //keyBoard = false;
        });
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          surfaceTintColor: Colors.transparent,
          elevation: 0,
          leading: null,
          title: Text("Блог примет"),
          backgroundColor: Colors.blue,
        ),
        body: AnimatedPadding(
          duration:const Duration(milliseconds: 100),
          padding: EdgeInsets.only(
              bottom:
                  keyBoard ? 0 : (MediaQuery.of(context).size.height * 0.11)),
          child: Column(
            children: [
              Expanded(
                child: _buildPostList(),
              ),
              _buildPostInput()
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPostList() {
    return StreamBuilder(
        stream: _chatService.getPost(_firebaseAuth.currentUser!.uid),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Error${snapshot.error}');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text('Loading...');
          }

          return ListView(
            children: snapshot.data!.docs
                .map((document) => _buildPostItem(document))
                .toList(),
          );
        });
  }

  Widget _buildPostItem(DocumentSnapshot document) {
    Map<String, dynamic> data = document.data() as Map<String, dynamic>;

    var aligment = (data['posterId'] == _firebaseAuth.currentUser!.uid)
        ? Alignment.centerRight
        : Alignment.centerLeft;

    bool colorPers = (data['posterId'] == _firebaseAuth.currentUser!.uid)
        ? true
        : false;

    return Container(
      margin: EdgeInsets.fromLTRB(16, 4 ,16, 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: colorPers? Colors.white : Colors.white.withOpacity(0.1),
      ),
      padding: EdgeInsets.all(8),
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
              text: "${data['posterEmail']} ",
              style: TextStyle(color: Colors.grey),
              children: <TextSpan>[
                TextSpan(text: data['massage'], style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildPostInput() {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 8.0),
      child: Row(
        children: [
          Expanded(
              child: TextField(
            controller: _postController,
          )),
          IconButton(
              onPressed: sendMessage, icon: Icon(Icons.send_rounded, size: 40))
        ],
      ),
    );
  }
}
