import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:rootllyai/controllers/user_controller.dart';
import 'package:rootllyai/models/user.dart';

class FirebaseMethods {
  final FirebaseDatabase _database = FirebaseDatabase.instance;
  UserController userController = Get.put(UserController());

  fetchRecords(int userId) async {
    var records = FirebaseDatabase.instance.ref();

    DatabaseReference snapshotRef = records.child("users/$userId");

    snapshotRef.onValue.listen((DatabaseEvent event) {
      if (event.snapshot.exists) {
        print('firebase snapshot : ${event.snapshot.value}');
        //updating user
        // userController
        // .updateUser(userFromJson(event.snapshot.value.toString()));
        print(
            'user data to json: ${userController.user.value.sessionsDetails}');
      } else {
        print('No data available');
      }
    });
  }

  void updateRecords(int userId, User user) async {
    DatabaseReference ref = FirebaseDatabase.instance.ref("users/$userId");

    await ref.update({
      "name": user.name,
      "sessionsCompletedToday": user.sessionsCompletedToday,
      "sessionsTargetToday": user.sessionsTargetToday,
      "totalSessionsCompleted": user.totalSessionsCompleted,
      "totalTimeCompleted": user.totalTimeCompleted,
      "sessionsDetails": user.sessionsDetails,
    });
  }

  void setRecords(int userId, User user) async{
    DatabaseReference ref = FirebaseDatabase.instance.ref("users/$userId");

    await ref.set({
      "name": user.name,
      "sessionsCompletedToday": user.sessionsCompletedToday,
      "sessionsTargetToday": user.sessionsTargetToday,
      "totalSessionsCompleted": user.totalSessionsCompleted,
      "totalTimeCompleted": user.totalTimeCompleted,
      "sessionsDetails": user.sessionsDetails,
    });
  }
}
