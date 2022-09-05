import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../constants/routes.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  _sendMail() async {
    var url = Uri.parse("mailto:quizmeapp0@gmail.com");
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: const EdgeInsets.fromLTRB(10, 100, 10, 10),
        children: <Widget>[
          Row(
            children: const [
              Padding(padding: EdgeInsets.fromLTRB(100, 0, 0, 0)),
              CircleAvatar(
                radius: 40,
                backgroundImage: AssetImage('images/qm.png'),
              )
            ],
          ),
          const Padding(padding: EdgeInsets.fromLTRB(0, 20, 0, 0)),
          const Divider(
            height: 10,
            thickness: 3,
            indent: 5,
            endIndent: 5,
          ),
          ListTile(
            title: const Text(
              'Home',
              style: TextStyle(fontSize: 15),
            ),
            onTap: () {
              Navigator.of(context).pushNamed(homepageRoute);
            },
            leading: const Icon(Icons.home),
          ),
          Container(
            height: 10,
          ),
          ListTile(
            title: const Text(
              'Profile',
              style: TextStyle(fontSize: 15),
            ),
            onTap: () {
              Navigator.of(context).pushNamed(profileRoute);
            },
            leading: const Icon(Icons.person),
          ),
          Container(
            height: 10,
          ),
          ListTile(
            title: const Text(
              'Courses',
              style: TextStyle(fontSize: 15),
            ),
            onTap: () {
              Navigator.of(context).pushNamed(coursesRoute);
            },
            leading: const Icon(Icons.book),
          ),
          Container(
            height: 10,
          ),
          ListTile(
            title: const Text(
              'Settings',
              style: TextStyle(fontSize: 15),
            ),
            onTap: () {
              Navigator.of(context).pushNamed(settingsRoute);
            },
            leading: const Icon(Icons.settings),
          ),
          const Divider(
            height: 10,
            thickness: 3,
            indent: 5,
            endIndent: 5,
          ),
          ListTile(
            title: const Text(
              'Help',
              style: TextStyle(fontSize: 15),
            ),
            onTap: _sendMail,
            leading: const Icon(Icons.help),
          ),
          Container(
            height: 10,
          ),
          ListTile(
            title: const Text(
              'About',
              style: TextStyle(fontSize: 15),
            ),
            onTap: () {
              Navigator.of(context).pushNamed(aboutRoute);
            },
            leading: const Icon(Icons.info),
          ),
          Container(
            height: 10,
          ),
          ListTile(
            title: const Text(
              'Contact Us',
              style: TextStyle(fontSize: 15),
            ),
            onTap: _sendMail,
            leading: const Icon(Icons.contact_mail),
          ),
          Container(height: 10),
          ListTile(
            title: const Text(
              'Sign Out',
              style: TextStyle(fontSize: 15),
            ),
            onTap: () async {
              await FirebaseAuth.instance.signOut();
              Navigator.of(context).pushNamed(loginRoute);
            },
            leading: const Icon(Icons.logout),
          ),
        ],
      ),
    );
  }
}
