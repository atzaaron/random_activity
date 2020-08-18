import 'package:flutter/cupertino.dart';
import 'package:random_activity/main.dart';
import 'package:flutter/material.dart';



class ActivityPage extends StatelessWidget {
  final ACTIVITY activity;
  final String title;

  ActivityPage(this.activity) : title = activity.toString().replaceAll("ACTIVITY.", "");

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        backgroundColor: Color(0xFF182041),
        appBar: AppBar(
          backgroundColor: Color(0xFF182041),
        ),
        body: displayActivity(context)
      ),
      onWillPop: () async {
        Navigator.pop(context, true);
        return false;
      },
    );
  }

  Container displayActivity(BuildContext context) {
    return Container(
          padding: EdgeInsets.all(20.0),
          child: Card(
            elevation: 10.0,
            color: Color(0xFF1c2754),
            child: Container(
              padding: EdgeInsets.all(30.0),
              height: 300,
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Image.asset('assets/images/' + this.title.toLowerCase() + '.png', width: 75, height: 75),
                  SizedBox(height: 10),
                  Text(
                    this.title,
                    style: TextStyle(fontSize: 30.0, color: Colors.grey[300])
                  ),
                  SizedBox(height: 75),
                  RaisedButton(
                    onPressed: () => Navigator.pop(context, true),
                    child: Text('Done !'),
                    color: Colors.grey[300],
                    textColor: Colors.blue,
                  )
                ],
              )
            )
          )
    );
  }
}

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