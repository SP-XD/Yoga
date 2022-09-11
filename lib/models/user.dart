import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    required this.name,
    required this.sessionsCompletedToday,
    required this.sessionsTargetToday,
    required this.totalSessionsCompleted,
    required this.totalTimeCompleted,
    required this.sessionsDetails,
  });

  String name;
  int sessionsCompletedToday;
  int sessionsTargetToday;
  int totalSessionsCompleted;
  int totalTimeCompleted;
  Map sessionsDetails;

  factory User.fromSnapshot(DataSnapshot snapshot) => User(
        name: snapshot.child("name").value as String,
        sessionsCompletedToday:
            snapshot.child("sessionsCompletedToday").value as int,
        sessionsTargetToday: snapshot.child("sessionsTargetToday").value as int,
        totalSessionsCompleted:
            snapshot.child("totalSessionsCompleted").value as int,
        totalTimeCompleted: snapshot.child("totalTimeCompleted").value as int,
        sessionsDetails: snapshot.child("sessionsDetails").value as Map,
        // sessionDetails: sessionDetails.fromJson(json["sessionDetails"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "sessionsCompletedToday": sessionsCompletedToday,
        "sessionsTargetToday": sessionsTargetToday,
        "totalSessionsCompleted": totalSessionsCompleted,
        "totalTimeCompleted": totalTimeCompleted,
        "sessionDetails": sessionsDetails,
      };
}
