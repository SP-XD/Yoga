import 'package:get/state_manager.dart';
import 'package:get/get.dart';
import 'package:rootllyai/models/user.dart';

class UserController extends GetxController {
  // testing data
  static var tempSessionsDetails = {
    "20-11-2020": {
      "10:20 am": 1,
      "11:21 am": 2,
      "11:22 am": 2,
      "11:23 am": 2,
      "11:24 am": 2,
      "11:25 am": 2,
      "11:26 am": 2,
      "11:27 am": 2,
      "11:28 am": 2,
      "11:29 am": 2,
      "11:30 am": 2,
      "11:40 am": 2,
      "11:41 am": 2,
      "11:42 am": 2,
      "11:43 am": 2,
      "11:44 am": 2,
      "11:45 am": 2,
      "11:46 am": 2,
      "11:48 am": 2,
      "11:59 am": 2,
      "12:11 am": 2,
      "12:21 am": 2,
      "11:31 am": 2,
    },
  };
  var user = User(
          name: "Jane",
          sessionsCompletedToday: 2,
          sessionsTargetToday: 4,
          totalSessionsCompleted: 16,
          totalTimeCompleted: 16,
          sessionsDetails: tempSessionsDetails)
      .obs;

  void updateSessions(var date, var time, int sessionId) {
    user.update((user) {
      user?.sessionsDetails[date][time] = sessionId;
    });
  }
}
