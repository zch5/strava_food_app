import 'package:flutter/material.dart';
import 'package:strava_food_app/views/authentication_pages/sign_up_page_view.dart';

import 'login_page_view.dart';

class AuthenticationPageView extends StatefulWidget {
  @override
  _AuthenticationPageViewState createState() => _AuthenticationPageViewState();
}

class _AuthenticationPageViewState extends State<AuthenticationPageView> {
  bool isLogin = true;

  @override
  Widget build(BuildContext context) =>
      isLogin ? LoginPageView(onClickedSignUp: toggle,) : SignUpPageView(onClickedSignIn: toggle,);

  void toggle() => setState(() => isLogin = !isLogin);
}