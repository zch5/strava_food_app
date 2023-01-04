import 'dart:io';
import '../../storage_paths.dart';
import '../../views/utilities.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import '../../database_paths.dart';

class CreatePostPageViewModel with ChangeNotifier {
  final FirebaseStorage storage = FirebaseStorage.instance;
  final Map<String, String> images = {};
  final List<String> imageStorage = List.empty(growable: true);

  createPost(String title, String description) {
    final List<String> imageIDs = images.keys.toList();
    final String postID = Utilities.generateRandomString();

    final db = FirebaseFirestore.instance;
    db.collection(POSTS).doc(postID).set({
      'createdTime': FieldValue.serverTimestamp(),
      'title': title,
      'description': description,
      'poster': FirebaseAuth.instance.currentUser!.uid,
      'images': imageIDs,
    });
    db.collection(USERS).doc(FirebaseAuth.instance.currentUser!.uid).update({
      'posts' : FieldValue.arrayUnion([postID]),
    });
  }

  Future<void> addImage(String filePath, String fileName) async {
    File file = File(filePath);
    String path = '$USER_CONTENT/${FirebaseAuth.instance.currentUser!.uid}/$fileName';

    await storage.ref(path).putFile(file);
    String downloadURL = await storage.ref(path).getDownloadURL();
    images[path] = downloadURL;
    imageStorage.add(downloadURL);
    notifyListeners();
  }
}