class User {
  final String name;
  int totalSessions;
  int totalTime;
  List sessionsDetails;

  User(
      {required this.name,
      required this.totalSessions,
      required this.totalTime,
      required this.sessionsDetails});
}
