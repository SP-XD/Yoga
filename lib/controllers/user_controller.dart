import 'package:get/state_manager.dart';
import 'package:get/get.dart';
import 'package:rootllyai/models/user.dart';
import 'package:rootllyai/resources/firebase_methods.dart';

class UserController extends GetxController {
  //initial data
  var user = User(
      name: "Jane",
      sessionsCompletedToday: 0,
      //* hardcoded
      sessionsTargetToday: 12,
      totalSessionsCompleted: 0,
      totalTimeCompleted: 0,
      sessionsDetails: {}).obs;

  updateUser(User user) {
    this.user.value = user;
  }

  void updateSessions(int userId, String date, String time) {
    user.update((user) {
      //for new entries
      if (!user!.sessionsDetails.containsKey(date)) {
        user.sessionsDetails[date] = {time: user.sessionsCompletedToday};
      } else {
        user.sessionsDetails[date][time] = user.sessionsCompletedToday;
      }
      user.totalSessionsCompleted++;
      user.totalTimeCompleted++;
    });

    FirebaseMethods().updateRecords(userId, user.value);
  }
}
