import 'dart:async';
import 'dart:math';
import 'package:quiver/async.dart';
import 'package:flutter/material.dart';
import 'package:random_activity/activity.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Random Activity App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: HomePageController(title: 'Random Activity App'),
    );
  }
}

class HomePageController extends StatefulWidget {
  HomePageController({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePageController> {
  Duration timeRemaining;
  bool endedTimer = false;
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  ACTIVITY currentActivity;

  _HomePage() {
    startTimer();
  }

  void startTimer() {
    CountdownTimer countDownTimer = new CountdownTimer(
      new Duration(seconds: 2),
      new Duration(seconds: 1),
    );
    StreamSubscription<CountdownTimer> sub = countDownTimer.listen(null);

    this.currentActivity = null;
    this.endedTimer = false;
    sub.onData((duration) {
      this.setState(() {
        this.timeRemaining = countDownTimer.remaining;
        if (this.timeRemaining.inSeconds < 1) {
          this.endedTimer = true;
        }
      });
    });

    sub.onDone(() {
      print("Done");
      sub.cancel();
    });
  }

  Text displayTimeRemaining() {
    if (timeRemaining == null) {
      return Text(
        'Starting timer . . .',
        style: TextStyle(fontSize: 40.0, color: Colors.white),
      );
    }
    return Text(
      '${timeRemaining.inMinutes.remainder(60).toString().padLeft(2, '0')}:${(timeRemaining.inSeconds.remainder(60) % 60).toString().padLeft(2, '0')}',
      style: TextStyle(fontSize: 80.0, color: Colors.grey[300]),
    );
  }

  void startRandomActivity() async {
    int currentHour = DateTime.now().hour;
    
    bool result;
    // Activity currentActivity;

    if (this.currentActivity == null) {
      //morning sport
      if (currentHour > 9 && currentHour < 18) {
        this.currentActivity = ACTIVITY.values[Random().nextInt(ACTIVITY.values.length)];
      } else {
        this.currentActivity = ACTIVITY.values[Random().nextInt(ACTIVITY.values.length) % 3];
      }
    }
    result = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ActivityPage(this.currentActivity)
        )
    );
    if (result == true) {
      this.startTimer();
    }
  }

  void launchInfoBar() {
    SnackBar info = SnackBar(
        content: Text('You must wait the end of the timer to launch the activity !')
    );

    this._scaffoldKey.currentState.showSnackBar(info);
  }

  RaisedButton handleActivityButton() {
    return RaisedButton(
      onPressed: endedTimer ? startRandomActivity : launchInfoBar,
      child: Text('Launch Activity'),
      color: endedTimer ? Colors.grey[300] : Colors.grey[500],
      textColor: endedTimer ? Colors.blue : Colors.grey[700],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: this._scaffoldKey,
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Color(0xFF00001b),
        actions: <Widget>[
          IconButton(
              onPressed: () {
                print("To do : parameters");
              },
              icon: Icon(Icons.settings),
              color: Colors.white
          ),
        ],
      ),
      body: Container(
          color: Color(0xFF182041),
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              Card(
                elevation: 10.0,
                color: Color(0xFF1c2754),
                child: Container(
                  height: 200.0,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: 30),
                      displayTimeRemaining(),
                      SizedBox(height: 20),
                      handleActivityButton()
                    ],
                  ),
                ),
              ),
            ],
          )
      ),
    );
  }
}

enum ACTIVITY {
  PUSHUPS,
  ABS,
  PLANK,
  BIKE, //this activity and these below are impossible to get after 6PM (% 3)
  RUN,
}

enum DIFFICULTY { ONE, TWO, THREE, FOUR, FIVE, SIX, SEVEN, EIGHT, NINE, TEN }
