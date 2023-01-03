import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import '../../database_paths.dart';

class CreatePostPageViewModel with ChangeNotifier {
  final FirebaseStorage storage = FirebaseStorage.instance;
  final List<String> images = List.empty(growable: true);

  createPost(String title, String description) {
    final db = FirebaseFirestore.instance;
    db.collection(POSTS).add({
      'createdTime': FieldValue.serverTimestamp(),
      'title': title,
      'description': description,
      'poster': FirebaseAuth.instance.currentUser!.uid,
    });
  }

  Future<void> addImage(String filePath, String fileName) async {
    File file = File(filePath);

    try {
      await storage.ref('test/$fileName').putFile(file);
      String downloadURL = await storage.ref('test/$fileName').getDownloadURL();
      images.add(downloadURL);
    } catch (e) {
      print(e);
    }
    notifyListeners();
  }

  Future<ListResult> listFiles() async {
    ListResult results = await storage.ref('test').listAll();
    return results;
  }
}