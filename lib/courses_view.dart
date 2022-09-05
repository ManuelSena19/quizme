import 'package:flutter/material.dart';
import 'package:quizme_app_demo/utilities/drawer_widget.dart';
import 'constants/routes.dart';

class CoursesView extends StatefulWidget {
  const CoursesView({Key? key}) : super(key: key);

  @override
  State<CoursesView> createState() => _CoursesViewState();
}

class _CoursesViewState extends State<CoursesView> {
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
            Row(
              children: const [
                Text(
                  'Programming Courses',
                  style: TextStyle(fontSize: 20),
                ),
                Padding(padding: EdgeInsets.fromLTRB(0, 0, 50, 0)),
                Icon(Icons.arrow_right),
                Icon(Icons.arrow_right),
                Icon(Icons.arrow_right),
              ],
            ),
            Container(height: 10),
            SizedBox(
              height: 300,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  SizedBox(
                    width: 200,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed(mobileAppsRoute);
                      },
                      child: Stack(
                        children: <Widget>[
                          const Padding(padding: EdgeInsets.all(10)),
                          const Image(
                            height: 300,
                            image: AssetImage('images/apps.png'),
                            fit: BoxFit.cover,
                          ),
                          Positioned(
                            bottom: 10,
                            child: Container(
                              width: 300,
                              padding: const EdgeInsets.fromLTRB(10, 0, 120, 0),
                              color: Colors.lightBlueAccent,
                              child: TextButton(
                                child: const Text(
                                  'Mobile Apps',
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.black),
                                ),
                                onPressed: () {
                                  Navigator.of(context).pushNamed(mobileAppsRoute);
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Padding(padding: EdgeInsets.fromLTRB(0, 0, 10, 0)),
                  SizedBox(
                    width: 200,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed(vbRoute);
                      },
                      child: Stack(
                        children: [
                          const Image(
                            height: 300,
                            image: AssetImage('images/vbp.png'),
                            fit: BoxFit.fill,
                          ),
                          Positioned(
                            bottom: 10,
                            child: Container(
                              width: 300,
                              padding: const EdgeInsets.fromLTRB(10, 0, 120, 0),
                              color: Colors.lightBlueAccent,
                              child: TextButton(
                                child: const Text(
                                  'Visual Basic',
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.black),
                                ),
                                onPressed: () {
                                  Navigator.of(context).pushNamed(vbRoute);
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Padding(padding: EdgeInsets.fromLTRB(0, 0, 10, 0)),
                  SizedBox(
                    width: 200,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed(databaseRoute);
                      },
                      child: Stack(
                        children: <Widget>[
                          const Padding(padding: EdgeInsets.all(10)),
                          const Image(
                            height: 300,
                            image: AssetImage('images/database.png'),
                            fit: BoxFit.cover,
                          ),
                          Positioned(
                            bottom: 10,
                            child: Container(
                              width: 300,
                              padding: const EdgeInsets.fromLTRB(10, 0, 120, 0),
                              color: Colors.lightBlueAccent,
                              child: TextButton(
                                child: const Text(
                                  'Database',
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.black),
                                ),
                                onPressed: () {
                                  Navigator.of(context).pushNamed(databaseRoute);
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Padding(padding: EdgeInsets.fromLTRB(0, 0, 10, 0)),
                  SizedBox(
                    width: 200,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed(assemblyRoute);
                      },
                      child: Stack(
                        children: <Widget>[
                          const Padding(padding: EdgeInsets.all(10)),
                          const Image(
                            height: 300,
                            image: AssetImage('images/assembly.png'),
                            fit: BoxFit.cover,
                          ),
                          Positioned(
                            bottom: 10,
                            child: Container(
                              width: 300,
                              padding: const EdgeInsets.fromLTRB(10, 0, 120, 0),
                              color: Colors.lightBlueAccent,
                              child: TextButton(
                                child: const Text(
                                  'Assembly Language',
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.black),
                                ),
                                onPressed: () {
                                  Navigator.of(context).pushNamed(assemblyRoute);
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Padding(padding: EdgeInsets.fromLTRB(0, 0, 10, 0)),

                ],
              ),
            ),
            const Padding(padding: EdgeInsets.fromLTRB(0, 50, 0, 0)),
            const Divider(
              height: 10,
              thickness: 3,
              indent: 5,
              endIndent: 5,
            ),
            Row(
              children: const [
                Text(
                  'Other Courses',
                  style: TextStyle(fontSize: 20),
                ),
                Padding(padding: EdgeInsets.fromLTRB(0, 0, 150, 0)),
                Icon(Icons.arrow_right),
                Icon(Icons.arrow_right),
                Icon(Icons.arrow_right),
              ],
            ),
            Container(height: 10),
            SizedBox(
              height: 300,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  SizedBox(
                    width: 200,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed(algebraRoute);
                      },
                      child: Stack(
                        children: <Widget>[
                          const Padding(padding: EdgeInsets.all(10)),
                          const Image(
                            height: 300,
                            image: AssetImage('images/math.png'),
                            fit: BoxFit.cover,
                          ),
                          Positioned(
                            bottom: 10,
                            child: Container(
                              width: 300,
                              padding: const EdgeInsets.fromLTRB(10, 0, 120, 0),
                              color: Colors.lightBlueAccent,
                              child: TextButton(
                                child: const Text(
                                  'Linear Algebra',
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.black),
                                ),
                                onPressed: () {
                                  Navigator.of(context).pushNamed(algebraRoute);
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Padding(padding: EdgeInsets.fromLTRB(0, 0, 10, 0)),
                  SizedBox(
                    width: 200,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed(systemAnalysisRoute);
                      },
                      child: Stack(
                        children: <Widget>[
                          const Padding(padding: EdgeInsets.all(10)),
                          const Image(
                            height: 300,
                            image: AssetImage('images/analysis.png'),
                            fit: BoxFit.cover,
                          ),
                          Positioned(
                            bottom: 10,
                            child: Container(
                              width: 300,
                              padding: const EdgeInsets.fromLTRB(10, 0, 120, 0),
                              color: Colors.lightBlueAccent,
                              child: TextButton(
                                child: const Text(
                                  'System Analysis',
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.black),
                                ),
                                onPressed: () {
                                  Navigator.of(context).pushNamed(systemAnalysisRoute);
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Padding(padding: EdgeInsets.fromLTRB(0, 0, 10, 0)),
                  SizedBox(
                    width: 200,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed(electronicsRoute);
                      },
                      child: Stack(
                        children: <Widget>[
                          const Padding(padding: EdgeInsets.all(10)),
                          const Image(
                            height: 300,
                            image: AssetImage('images/electronics.png'),
                            fit: BoxFit.cover,
                          ),
                          Positioned(
                            bottom: 10,
                            child: Container(
                              width: 300,
                              padding: const EdgeInsets.fromLTRB(10, 0, 120, 0),
                              color: Colors.lightBlueAccent,
                              child: TextButton(
                                child: const Text(
                                  'Digital Electronics',
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.black),
                                ),
                                onPressed: () {
                                  Navigator.of(context).pushNamed(electronicsRoute);
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Padding(padding: EdgeInsets.fromLTRB(0, 0, 10, 0)),
                  SizedBox(
                    width: 200,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed(literatureRoute);
                      },
                      child: Stack(
                        children: <Widget>[
                          const Padding(padding: EdgeInsets.all(10)),
                          const Image(
                            height: 300,
                            image: AssetImage('images/literature.png'),
                            fit: BoxFit.cover,
                          ),
                          Positioned(
                            bottom: 10,
                            child: Container(
                              width: 300,
                              padding: const EdgeInsets.fromLTRB(10, 0, 120, 0),
                              color: Colors.lightBlueAccent,
                              child: TextButton(
                                child: const Text(
                                  'Literature',
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.black),
                                ),
                                onPressed: () {
                                  Navigator.of(context).pushNamed(literatureRoute);
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
