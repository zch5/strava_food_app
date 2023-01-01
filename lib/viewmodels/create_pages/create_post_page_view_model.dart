import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../database_paths.dart';

class CreatePostPageViewModel with ChangeNotifier {
  createPost(String title, String description) {
    final db = FirebaseFirestore.instance;
    db.collection(POSTS).add({
      'createdTime': FieldValue.serverTimestamp(),
      'title': title,
      'description': description,
      'poster': FirebaseAuth.instance.currentUser!.uid,
    });
  }
}