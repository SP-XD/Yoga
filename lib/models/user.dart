class User {
  final String name;
  int sessionsCompletedToday;
  int sessionsTargetToday;
  int totalSessionsCompleted;
  int totalTimeCompleted;
  Map sessionsDetails;

  User(
      {required this.name,
      required this.sessionsCompletedToday,
      required this.sessionsTargetToday,
      required this.totalSessionsCompleted,
      required this.totalTimeCompleted,
      required this.sessionsDetails});
}
