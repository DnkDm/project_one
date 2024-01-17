import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import '../model/post.dart';

class BlogService extends ChangeNotifier {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  Future<void> sendMessage(String message) async {
    final String currentUserId = _firebaseAuth.currentUser!.uid;
    final String currentUserEmail = _firebaseAuth.currentUser!.email.toString();
    final Timestamp timestamp = Timestamp.now();

    Post newPost = Post(
        posterId: currentUserId,
        posterEmail: currentUserEmail,
        massage: message,
        timestamp: timestamp);

    await _fireStore
        .collection('blog_post')
        .add(newPost.toMap());
  }

  Stream<QuerySnapshot> getPost(String userId) {
    return _fireStore
        .collection('blog_post')
        .orderBy('timestamp', descending: false)
        .snapshots();
  }
}
