import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController confirmEmailController = TextEditingController();
  String? gender;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("QuizMe")),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
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
              padding: const EdgeInsets.fromLTRB(500, 10, 500, 10),
              child: TextField(
                autocorrect: false,
                keyboardType: TextInputType.text,
                controller: usernameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50))),
                  labelText: 'Username',
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
                      borderRadius: BorderRadius.all(Radius.circular(50))),
                  labelText: 'Password',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(500, 10, 500, 10),
              child: TextField(
                autocorrect: false,
                keyboardType: TextInputType.emailAddress,
                controller: emailController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50))),
                  labelText: 'E-mail',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(500, 10, 500, 10),
              child: TextField(
                autocorrect: false,
                keyboardType: TextInputType.text,
                controller: confirmEmailController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50))),
                  labelText: 'Confirm E-mail',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(505, 5, 700, 10),
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
              padding: const EdgeInsets.fromLTRB(505, 5, 700, 10),
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
              padding: const EdgeInsets.fromLTRB(500, 10, 500, 10),
              child: GestureDetector(
                onTap: () async {
                  String username = usernameController.text;
                  String email = emailController.text;
                  String password = passwordController.text;
                  String sex = gender!;
                  print('$username , $email , $sex');
                  FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
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
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}