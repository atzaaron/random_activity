import 'package:flutter/cupertino.dart';
import 'package:random_activity/main.dart';
import 'package:flutter/material.dart';



class ActivityPageController extends StatelessWidget {

  ActivityPageController(this.activity) {
    print(this.activity);
  }
  final ACTIVITY activity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
    );
  }
}

// class _ActivityPage extends State<ActivityPageController> {
//   String title;
//   bool isDayActivity;
//   ACTIVITY activity;
//   int series;
//   int repetitions;
//   Duration duration;
//   DIFFICULTY difficulty; //the difficulty have to be wrote in json file and retrieve via function in this class

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(

//     );
//   }
// }

class Activity {
  String title;
  bool isDayActivity;
  ACTIVITY activity;
  int series;
  int repetitions;
  Duration duration;
  DIFFICULTY difficulty; //the difficulty have to be wrote in json file and retrieve via function in this class

  Activity(ACTIVITY activity) {
    this.activity = activity;
    print(activity);
  }

  Activity launchActivity() {
      
  }
}