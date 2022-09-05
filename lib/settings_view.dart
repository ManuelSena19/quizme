import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizme_app_demo/services/theme_provider.dart';
import 'package:quizme_app_demo/utilities/drawer_widget.dart';
import 'constants/routes.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
      ),
      drawer: const DrawerWidget(),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            Container(
                color: Colors.black26,
                padding: const EdgeInsets.fromLTRB(20, 30, 20, 30),
                child: Row(
                  children: const <Widget>[
                    Padding(padding: EdgeInsets.fromLTRB(0, 0, 30, 0)),
                    Text(
                      'Settings',
                      style: TextStyle(fontSize: 30),
                    )
                  ],
                )),
            Container(
              height: 40,
            ),
            ListTile(
              title: const Text(
                'Edit Profile',
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {
                Navigator.of(context).pushNamed(editProfileRoute);
              },
            ),
            Container(
              height: 15,
            ),
            ListTile(
              title: const Text(
                'Change Password',
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {
                Navigator.of(context).pushNamed(resetPasswordRoute);
              },
            ),
            Container(
              height: 15,
            ),
            ListTile(
              title: const Text(
                'Terms And Conditions',
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {
                Navigator.of(context).pushNamed(termsRoute);
              },
            ),
            Container(
              height: 15,
            ),
            ListTile(
              title: const Text(
                'Privacy Policy',
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {
                Navigator.of(context).pushNamed(policyRoute);
              },
            ),
            Container(
              height: 15,
            ),
            Consumer<ThemeNotifier>(
              builder: (context, notifier, child) =>
               SwitchListTile(
                  title: const Text(
                    'Enable Dark Mode',
                    style: TextStyle(fontSize: 20),
                  ),
                  value: notifier.darkTheme,
                  onChanged: (value) {
                    notifier.toggleTheme();
                  },
              ),
            ),
            Container(
              height: 15,
            ),
            ListTile(
              title: const Text(
                'Sign Out',
                style: TextStyle(fontSize: 20),
              ),
              onTap: () async{
                await FirebaseAuth.instance.signOut();
                Navigator.of(context).pushNamed(loginRoute);
              },
            ),
          ],
        ),
      ),
    );
  }
}
