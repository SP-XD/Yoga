import 'package:get/state_manager.dart';
import 'package:get/get.dart';
import 'package:rootllyai/models/user.dart';

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

  void updateSessions(var date, var time, int sessionId) {
    user.update((user) {
      user?.sessionsDetails[date][time] = sessionId;
    });
  }
}
