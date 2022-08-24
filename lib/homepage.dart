import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {


  /*Stream<List<dynamic>> readUsers() => FirebaseFirestore.instance.
  collection('users').snapshots().map((snapshot) =>
      snapshot.docs.map((doc) => User.fromJson(doc.data())).toList());*/

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
              Colors.white,
              Colors.lightBlueAccent,
              Colors.blue
            ])),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            actions: [
              IconButton(
                  onPressed: () {
                    //notification view
                  },
                  icon: const Icon(Icons.notifications))
            ],
          ),
          drawer: Drawer(
            backgroundColor: Colors.black26,
            child: ListView(
              padding: const EdgeInsets.fromLTRB(10, 200, 10, 10),
              children: <Widget>[
                ListTile(
                  title: const Text(
                    'HOME',
                    style: TextStyle(fontSize: 30),
                  ),
                  onTap: () {},
                ),
                Container(
                  height: 30,
                ),
                ListTile(
                  title: const Text(
                    'PROFILE',
                    style: TextStyle(fontSize: 30),
                  ),
                  onTap: () {},
                ),
                Container(
                  height: 30,
                ),
                ListTile(
                  title: const Text(
                    'SETTINGS',
                    style: TextStyle(fontSize: 30),
                  ),
                  onTap: () {},
                ),
                Container(
                  height: 30,
                ),
                ListTile(
                  title: const Text(
                    'ABOUT',
                    style: TextStyle(fontSize: 30),
                  ),
                  onTap: () {},
                ),
                Container(
                  height: 30,
                ),
                ListTile(
                  title: const Text(
                    'SIGN OUT',
                    style: TextStyle(fontSize: 30),
                  ),
                  onTap: () {},
                ),
                Container(
                  height: 30,
                ),
                GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.blue,
                      ),
                      child: const Text(
                        'VISIT US',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 30),
                      ),
                    )),
                Container(
                  height: 30,
                ),
                GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.blue,
                      ),
                      child: const Text(
                        'CLOSE APP',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 30),
                      ),
                    )),
              ],
            ),
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
