import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:strava_food_app/database_paths.dart';

import '../../../main.dart';
import '../utilities.dart';

class SignUpPageView extends StatefulWidget {
  final Function() onClickedSignIn;

  const SignUpPageView({
    Key? key,
    required this.onClickedSignIn,
  }) : super(key: key);

  @override
  _SignUpPageViewState createState() => _SignUpPageViewState();
}

class _SignUpPageViewState extends State<SignUpPageView> {
  final formKey = GlobalKey<FormState>();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
    padding: EdgeInsets.all(16),
    child: Form(
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 60),
          FlutterLogo(size: 120,),
          SizedBox(height: 20),
          Text(
            'Hey There,\n Welcome Back',
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 40),
          TextFormField(
              controller: firstNameController,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(labelText: 'First Name'),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) => value != null && value.length < 3
                  ? 'Enter minimum 3 characters' : null
          ),
          TextFormField(
              controller: lastNameController,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(labelText: 'Last Name'),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) => value != null && value.length < 3
                  ? 'Enter minimum 3 characters' : null
          ),
          TextFormField(
            controller: emailController,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(labelText: 'Email'),
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (email) =>
            email != null && !EmailValidator.validate(email)
                ? 'Enter a valid email' : null,
          ),
          SizedBox(height: 4),
          TextFormField(
              controller: passwordController,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) => value != null && value.length < 6
                  ? 'Enter minimum 6 characters' : null
          ),
          SizedBox(height: 20,),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              minimumSize: Size.fromHeight(50),
            ),
            icon: Icon(Icons.arrow_forward, size: 32,),
            label: Text(
              'Sign Up',
              style: TextStyle(fontSize: 24),
            ),
            onPressed: signUp,
          ),
          SizedBox(height: 20),
          RichText(
              text: TextSpan(
                  text: 'Already have an account?  ',
                  style: TextStyle(color: Theme.of(context).colorScheme.tertiary),
                  children: [
                    TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = widget.onClickedSignIn,
                        text: 'Log In',
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Theme.of(context).colorScheme.secondary
                        )
                    )
                  ]
              )
          )
        ],
      ),
    )
  );

  Future signUp() async {
    final isValid = formKey.currentState!.validate();
    if (!isValid) return;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Center(child: CircularProgressIndicator(),),
    );

    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim()
      );
      String displayName = '${firstNameController.text.trim()} ${lastNameController.text.trim()}';
      await FirebaseAuth.instance.currentUser?.updateDisplayName(displayName);
      createUser();
    } on FirebaseAuthException catch (e) {
      print(e);

      Utilities.showSnackBar(e.message);
    }

    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }
  
  Future createUser() async {
    final db = FirebaseFirestore.instance;
    db.collection(USERS).doc(FirebaseAuth.instance.currentUser!.uid).set({
      'account_created_timestamp': FieldValue.serverTimestamp(),
      'display_name': FirebaseAuth.instance.currentUser!.displayName,
      'email': FirebaseAuth.instance.currentUser!.email,
    });
  }
}