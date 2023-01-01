import 'package:cloud_firestore/cloud_firestore.dart';

class AppUser {
  Timestamp accountCreatedTimestamp;
  String displayName;
  String email;

  AppUser({required this.accountCreatedTimestamp, required this.displayName, required this.email});

  factory AppUser.fromJson(Map<String, dynamic> json) {
    return AppUser(
      accountCreatedTimestamp: json['account_created_timestamp'],
      displayName: json['display_name'],
      email: json['email'],
    );
  }
}