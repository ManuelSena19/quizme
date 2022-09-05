import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:quizme_app_demo/utilities/drawer_widget.dart';
import 'package:quizme_app_demo/utilities/profile_widget.dart';
import 'package:quizme_app_demo/utilities/text_field_widget.dart';
import 'constants/user.dart';
import 'constants/user_preferences.dart';
import 'package:path/path.dart';
import 'dart:io';

class EditProfileView extends StatefulWidget {
  const EditProfileView({Key? key}) : super(key: key);

  @override
  State<EditProfileView> createState() => _EditProfileViewState();
}

class _EditProfileViewState extends State<EditProfileView> {
  late User user;

  @override
  void initState(){
    super.initState();
    user = UserPreferences.getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
      ),
      drawer: const DrawerWidget(),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        physics: const BouncingScrollPhysics(),
        children: <Widget>[
          const Padding(padding: EdgeInsets.all(10)),
          ProfileWidget(
            isEdit: true,
            imagePath: user.imagePath,
            onClicked: () async {
              final image = await ImagePicker().pickImage(
                  source: ImageSource.gallery);
              if (image == null) return;
              final directory = await getApplicationDocumentsDirectory();
              final name = basename(image.path);
              final imageFile = File('${directory.path}/$name');
              final newImage = await File(image.path).copy(imageFile.path);
              setState(() => user = user.copy(imagePath: newImage.path));
            },
          ),
          const Padding(padding: EdgeInsets.all(10)),
          TextFieldWidget(
            label: 'Username',
            text: user.name,
            onChanged: (name) {
              user = user.copy(name: name);
            },
            maxLines: 1,
          ),
          const Padding(padding: EdgeInsets.all(10)),
          TextFieldWidget(
              label: 'Email',
              text: user.email,
              onChanged: (email) => user = user.copy(email: email),
              maxLines: 1
          ),
          const Padding(padding: EdgeInsets.all(10)),
          TextFieldWidget(
              label: 'About',
              text: user.about,
              maxLines: 8,
              onChanged: (about) => user = user.copy(about: about),
          ),
          const Padding(padding: EdgeInsets.all(10)),
          GestureDetector(
            onTap: (){
              UserPreferences.setUser(user);
              Navigator.of(context).pop();
            },
            child: Container(
              width: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.blue,
              ),
              child: const Padding(
                padding: EdgeInsets.all(8),
                child: Text(
                  "SAVE",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
