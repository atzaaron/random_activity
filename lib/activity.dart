import 'package:flutter/cupertino.dart';
import 'package:random_activity/main.dart';
import 'package:flutter/material.dart';



class ActivityPage extends StatelessWidget {
  final ACTIVITY activity;

  ActivityPage(this.activity) {
    print(this.activity);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        backgroundColor: Color(0xFF182041),
        appBar: AppBar(
          backgroundColor: Color(0xFF182041),
        ),
        body: displayActivity()
      ),
      onWillPop: () async {
        Navigator.pop(context, false);
        return false;
      },
    );
  }

  Container displayActivity() {
    return Container(
          child: Column(
            children: <Widget>[
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[Image.asset('assets/images/abs.png', width: 75, height: 75,)],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[Text(
                  'ABS TIME !',
                  style: TextStyle(fontSize: 30.0, color: Colors.grey[300])
                )],
              )
            ],
          )
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

// class Activity {
//   String title;
//   bool isDayActivity;
//   ACTIVITY activity;
//   int series;
//   int repetitions;
//   Duration duration;
//   DIFFICULTY difficulty; //the difficulty have to be wrote in json file and retrieve via function in this class

//   Activity(ACTIVITY activity) {
//     this.activity = activity;
//     print(activity);
//   }

//   Activity launchActivity() {
      
//   }
// }