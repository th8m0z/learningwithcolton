import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:proximity_plugin/proximity_plugin.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: BottomNavigation(title: 'Flutter Demo Home Page'),
    );
  }
}

class BottomNavigation extends StatefulWidget {
  BottomNavigation({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  // String _proximity;
  // List<StreamSubscription<dynamic>> _streamSubscriptions =
  //     <StreamSubscription<dynamic>>[];
  // @override
  // initState() {
  //   super.initState();
  //   initPlatformState();
  // }

  // initPlatformState() async {
  //   _streamSubscriptions.add(proximityEvents.listen((ProximityEvent event) {
  //     setState(() {
  //       _proximity = event.x;
  //     });
  //   }));
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Stack(
          overflow: Overflow.clip,
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                  height: 350,
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: ListView.builder(
                      itemBuilder: (context, index) => Container(
                            height: 100,
                            child: AchievementTile(
                                position: index + 1,
                                score: 3122,
                                name: 'Thomas Menzel',
                                color: index == 0
                                    ? Color(0xFFF7C10E)
                                    : Colors.transparent),
                          )),
                  color: Colors.white),
            ),
            Container(
              height: 380,
              child: ClipPath(
                clipper: WaveClipperOne(),
                child: Container(
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Icon(Icons.star,
                              size: 400,
                              color:
                                  Theme.of(context).cardColor.withOpacity(0.1)),
                        ),
                        Align(
                          alignment: Alignment(0, -0.65),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Icon(
                                Icons.arrow_back,
                                size: 30,
                                color: Theme.of(context).cardColor,
                              ),
                              Text(
                                'Leaderboard',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w800,
                                    fontSize: 25),
                              ),
                              Icon(
                                Icons.share,
                                size: 30,
                                color: Theme.of(context).cardColor,
                              ),
                            ],
                          ),
                        ),
                        Align(
                          alignment: Alignment(0.8, 0.5),
                          child: Container(
                            width: 80,
                            height: 200,
                            child: AchievementCol(
                              color: Colors.white.withOpacity(0.2),
                              firstName: 'Colton',
                              lastName: 'Ehrman',
                              position: 3,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment(-0.8, 0.5),
                          child: Container(
                            width: 80,
                            height: 200,
                            child: AchievementCol(
                              color: Colors.white.withOpacity(0.2),
                              firstName: 'Evgeny',
                              lastName: 'Shilov',
                              position: 2,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment(0, 1.7),
                          child: Container(
                            height: 300,
                            child: AchievementCol(
                              color: Colors.white.withOpacity(0.2),
                              firstName: 'Thomas',
                              lastName: 'Menzel',
                              position: 1,
                            ),
                          ),
                        )
                      ],
                    ),
                    color: Colors.indigo[900]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AchievementTile extends StatelessWidget {
  final Color color;
  final String name;
  final int score;
  final int position;
  const AchievementTile(
      {Key key, this.color, this.position, this.name, this.score})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          position == 1
              ? Icon(
                  Icons.shutter_speed,
                  color: Colors.white,
                )
              : Text(
                  position.toString(),
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: Colors.black),
                ),
          Container(
            height: 13,
            decoration: BoxDecoration(
              color: Colors.black,
              shape: BoxShape.circle,
            ),
          ),
          Text(
            '$name',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w700,
              color: position == 1 ? Colors.white : Colors.black,
            ),
          ),
          SizedBox(width: 20),
          Text(
            score.toString(),
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w700,
              color: position == 1 ? Colors.white : Colors.black,
            ),
          ),
          Icon(Icons.star, color: position == 1 ? Colors.white : Colors.black),
        ],
      ),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(15),
      ),
    );
  }
}

class AchievementCol extends StatelessWidget {
  final Color color;
  final String firstName;
  final String lastName;
  final int position;
  const AchievementCol(
      {Key key, this.color, this.firstName, this.lastName, this.position})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Expanded(
            flex: 4,
            child: Container(
              child: Center(
                child: position == 1
                    ? Icon(
                        Icons.shutter_speed,
                        size: 70,
                        color: Color(0xFFF7C10E),
                      )
                    : Text(
                        position.toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 15,
                          color: Colors.white,
                        ),
                      ),
              ),
              decoration: BoxDecoration(shape: BoxShape.circle, color: color),
            ),
          ),
          Flexible(child: Container(), flex: 1),
          Expanded(
            flex: 4,
            child: Column(
              children: <Widget>[
                Text(
                  firstName.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 15),
                ),
                Text(
                  lastName.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 15),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
