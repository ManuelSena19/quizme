import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:quizme_app_demo/constants/routes.dart';
import 'package:quizme_app_demo/services/storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:quizme_app_demo/utilities/show_error_dialog.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);
  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final SecureStorage secureStorage = SecureStorage();
  final _firestore = FirebaseFirestore.instance;
  late final TextEditingController usernameController;
  late final TextEditingController passwordController;
  late final TextEditingController emailController;
  String? gender;
  bool _isObscure = true;
  final formKey = GlobalKey<FormState>();
  void validator(emailController) =>
      emailController != null && !EmailValidator.validate(emailController)
          ? 'Enter a valid email'
          : null;

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    usernameController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    usernameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("QuizMe"), backgroundColor: Colors.lightBlue),
      body: Padding(
          padding: const EdgeInsets.all(10),
          child: FutureBuilder(
              future: Firebase.initializeApp(
                options: DefaultFirebaseOptions.currentPlatform,
              ),
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.done:
                    //  final user = FirebaseAuth.instance.currentUser;
                    return ListView(
                      children: <Widget>[
                        Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(10),
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
                              'Register',
                              style: TextStyle(fontSize: 20),
                            )),
                        Container(
                          padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                          child: TextField(
                            autocorrect: false,
                            keyboardType: TextInputType.text,
                            controller: usernameController,
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(50))),
                                labelText: 'Username',
                                prefixIcon: Icon(Icons.person)),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                          child: TextField(
                            obscureText: _isObscure,
                            enableSuggestions: false,
                            autocorrect: false,
                            controller: passwordController,
                            decoration: InputDecoration(
                                border: const OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(50))),
                                labelText: 'Password',
                                prefixIcon: const Icon(Icons.lock),
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      _isObscure = !_isObscure;
                                    });
                                  },
                                  icon: Icon(_isObscure
                                      ? Icons.visibility
                                      : Icons.visibility_off),
                                )),
                          ),
                        ),
                        Form(
                          key: formKey,
                          child: Container(
                            padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                            child: TextField(
                              autofillHints: const [AutofillHints.email],
                              autocorrect: false,
                              keyboardType: TextInputType.emailAddress,
                              controller: emailController,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(50))),
                                labelText: 'E-mail',
                                prefixIcon: Icon(Icons.email),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
                          child: RadioListTile(
                              title: const Text("Male"),
                              value: "male",
                              groupValue: gender,
                              onChanged: (value) {
                                setState(() {
                                  gender = value.toString();
                                });
                              }),
                        ),
                        Container(
                          padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
                          child: RadioListTile(
                            title: const Text("Female"),
                            value: "female",
                            groupValue: gender,
                            onChanged: (value) {
                              setState(
                                () {
                                  gender = value.toString();
                                },
                              );
                            },
                          ),
                        ),
                        Container(
                          height: 60,
                          padding: const EdgeInsets.fromLTRB(100, 10, 100, 10),
                          child: GestureDetector(
                            onTap: () async {
                              try {
                                String username = usernameController.text;
                                String email = emailController.text;
                                String password = passwordController.text;
                                String sex = gender!;
                                final form = formKey.currentState!;
                                if (form.validate()){}
                                await FirebaseAuth.instance.createUserWithEmailAndPassword(
                                    email: email, password: password);
                                _firestore.collection('users').add({
                                  'username': username,
                                  'email': email,
                                  'sex': sex
                                });
                                Navigator.of(context).pushNamed(logicRoute);

                              } on FirebaseAuthException catch (e) {
                                if (e.code == 'weak-password') {
                                  await showErrorDialog(context,
                                      'Weak password : Password should be above 6 characters');
                                } else if (e.code == 'invalid-email') {
                                  await showErrorDialog(
                                      context, 'Invalid password');
                                } else if (e.code == 'email-already-in-use') {
                                  await showErrorDialog(context,
                                      'Email belongs to other user: Register with a different email');
                                } else {
                                  await showErrorDialog(
                                      context, 'Error: e.code');
                                }
                              }
                              on NullThrownError catch(e){
                                await showErrorDialog(context, e.toString());
                              }
                              catch (e) {
                                await showErrorDialog(context, e.toString());
                              }
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
                                  "Get Started",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  default:
                    return const Text("Loading....");
                }
              })),
    );
  }
}
