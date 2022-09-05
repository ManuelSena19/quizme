import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quizme_app_demo/homepage.dart';
import 'package:quizme_app_demo/login_view.dart';
import 'package:quizme_app_demo/verify_email_view.dart';

class LogicView extends StatelessWidget {
  const LogicView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot){
          if (snapshot.hasData){
            return const VerifyEmailView();
          }
          else {
            return const LoginView();
          }
        },
      )
    );
  }
}
