import 'package:random_activity/main.dart';

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