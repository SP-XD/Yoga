import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

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

  factory User.fromJson(Map<String, dynamic> json) => User(
        name: json["name"],
        sessionsCompletedToday: json["sessionsCompletedToday"],
        sessionsTargetToday: json["sessionsTargetToday"],
        totalSessionsCompleted: json["totalSessionsCompleted"],
        totalTimeCompleted: json["totalTimeCompleted"],
        sessionsDetails: json["sessionsDetails"],
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
