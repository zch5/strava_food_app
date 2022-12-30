
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:strava_food_app/views/authentication_pages/verify_email_page_view.dart';

import 'authentication_page_view.dart';

class StartView extends StatelessWidget {
  StartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return VerifyEmailPageView();
          } else {
            return AuthenticationPageView();
          }
        },
      ),
    );
  }
}