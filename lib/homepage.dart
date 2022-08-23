import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
              Colors.orangeAccent,
              Colors.pinkAccent,
              Colors.lightBlueAccent
            ])),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            leading: IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                //Side tray view
              },
            ),
            actions: [
              IconButton(
                  onPressed: (){
                    //notification view
                  },
                  icon: const Icon(Icons.notifications)
              )
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: <Widget>[Container()],
            ),
          ),
        ));
  }
}
