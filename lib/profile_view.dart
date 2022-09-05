import 'package:flutter/material.dart';
import 'package:quizme_app_demo/utilities/drawer_widget.dart';
import 'package:quizme_app_demo/utilities/profile_widget.dart';
import 'constants/user.dart';
import 'constants/user_preferences.dart';
import 'edit_profile_view.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final user = UserPreferences.myUser;

  Widget buildName(User user) => Column(
    children: [
      Text(
        user.name,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
      ),
      const Padding(padding: EdgeInsets.all(5)),
      Text(
        user.email,
      ),
    ],
  );

  Widget buildAbout(User user) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 48),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget> [
        const Text(
          'About:',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const Padding(padding: EdgeInsets.all(10)),
        Text(
          user.about,
          style: const TextStyle(fontSize: 20, height: 1.4),
        ),
      ],
    ),
  );

  @override
  Widget build(BuildContext context) {
    final user = UserPreferences.getUser();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
      ),
      drawer: const DrawerWidget(),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: <Widget>[
          const Padding(padding: EdgeInsets.all(10)),
          ProfileWidget(
            isEdit: false,
            imagePath: user.imagePath,
            onClicked: () async {
              await Navigator.of(context).push(MaterialPageRoute(builder: (context) => const EditProfileView()));
              setState(() {
              });
            },
          ),
          const Padding(padding: EdgeInsets.all(20)),
          buildName(user),
          const Padding(padding: EdgeInsets.all(30)),
          buildAbout(user),
        ],
      ),
    );
  }
}
