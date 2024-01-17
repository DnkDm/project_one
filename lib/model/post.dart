import 'package:cloud_firestore/cloud_firestore.dart';

class Post {
  final String posterId;
  final String posterEmail;
  final String massage;
  final Timestamp timestamp;

  Post({required this.posterId, required this.posterEmail, required this.massage, required this.timestamp});

  Map<String, dynamic> toMap() {
    return {
      'posterId' : posterId,
      'posterEmail' : posterEmail,
      'massage' : massage,
      'timestamp' : timestamp
    };
  }
}