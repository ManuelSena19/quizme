import 'package:flutter/material.dart';

class DrawerView extends StatelessWidget {
  const DrawerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      drawer: Drawer(
        child: ListView(
          padding: const EdgeInsets.all(10),
          children: const [
            Image(image: AssetImage('user.jpg'), height: 20, width: 20),

          ],
        ),
      ),
    );
  }
}
