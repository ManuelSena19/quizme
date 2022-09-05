import 'package:flutter/material.dart';
import 'package:quizme_app_demo/utilities/drawer_widget.dart';
import 'constants/routes.dart';

class AboutView extends StatefulWidget {
  const AboutView({Key? key}) : super(key: key);

  @override
  State<AboutView> createState() => _AboutViewState();
}

class _AboutViewState extends State<AboutView> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
      ),
      drawer: const DrawerWidget(),
      body: Column(
        children: [
          const Padding(padding: EdgeInsets.fromLTRB(0, 200, 0, 0)),
          const Text(
            'Quizme App',
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.lightBlue),
          ),
          const Text(
            'App Version: 1.0.0',
            style: TextStyle(fontSize: 20),
          ),
          const Padding(padding: EdgeInsets.fromLTRB(0, 20, 0, 0)),
          const ClipOval(
            child: Image(
              image: AssetImage(
                'images/qm.png',
              ),
              fit: BoxFit.cover,
              width: 128,
              height: 128,
            ),
          ),
          Row(
            children: const [
              Padding(padding: EdgeInsets.fromLTRB(170, 50, 0, 0)),
              Icon(Icons.copyright),
              Padding(padding: EdgeInsets.fromLTRB(10, 0, 0, 0)),
              Text('2022'),
            ],
          ),
        ],
      ),
    );
  }
}
