import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:quizme_app_demo/register_view.dart';
import 'firebase_options.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late final TextEditingController emailController = TextEditingController();
  late final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('QuizMe')),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: FutureBuilder(
            future: Firebase.initializeApp(
              options: DefaultFirebaseOptions.currentPlatform,
            ),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.done:
                  return ListView(
                    children: <Widget>[
                      Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.fromLTRB(10, 100, 10, 10),
                        child: const Text(
                          'QuizMe',
                          style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.w500,
                              fontSize: 30),
                        ),
                      ),
                      Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(10),
                          child: const Text(
                            'Sign in',
                            style: TextStyle(fontSize: 20),
                          )),
                      Container(
                        padding: const EdgeInsets.fromLTRB(500, 10, 500, 10),
                        child: TextField(
                          autocorrect: false,
                          keyboardType: TextInputType.emailAddress,
                          controller: emailController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius:
                                BorderRadius.all(Radius.circular(50))),
                            labelText: 'E-mail',
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.fromLTRB(500, 10, 500, 10),
                        child: TextField(
                          obscureText: true,
                          enableSuggestions: false,
                          autocorrect: false,
                          controller: passwordController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius:
                                BorderRadius.all(Radius.circular(50))),
                            labelText: 'Password',
                          ),
                        ),
                      ),
                      Container(
                        height: 60,
                        padding: const EdgeInsets.fromLTRB(500, 10, 500, 10),
                        child: GestureDetector(
                          onTap: () {
                            String email = emailController.text;
                            String password = passwordController.text;
                            print('$email , $password');
                          },
                          child: Container(
                            width: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.blue,
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                "LOG IN",
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const Text('Does not have account?'),
                          TextButton(
                            child: const Text(
                              'Sign up',
                              style: TextStyle(fontSize: 20),
                            ),
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) {
                                  return const RegisterView();
                                },
                              ));
                            },
                          )
                        ],
                      ),
                    ],
                  );
                default:
                  return const Text("Loading....");
              }
            },
          ),
        ));
  }
}