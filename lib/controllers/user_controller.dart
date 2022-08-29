import 'package:get/state_manager.dart';
import 'package:get/get.dart';
import 'package:rootllyai/models/user.dart';

class UserController extends GetxController {
  static var tempSessionsDetails = {
    "20-11-2020": {"10:20 am": 1, "11:21 am": 2},
    "21-11-2020": {"10:20 am": 1, "11:21 am": 2},
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
