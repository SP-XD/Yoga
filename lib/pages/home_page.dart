import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:rootllyai/controllers/user_controller.dart';
import 'package:rootllyai/responsive/responsive_layout.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  UserController userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    var progress = (userController.user.value.sessionsCompletedToday /
            userController.user.value.sessionsTargetToday *
            100)
        .toInt();

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
  Widget SessionCard() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
  //* sessionbgColor is temporary parameter, and will be removed later
  Widget SessionCard(int sessionId, bool isCompleted, String time,
      Color sessionBgColor, String sessionImgPath) {
    return TimelineTile(
      nodePosition: 0,
      node: TimelineNode(
        indicator: isCompleted
            ? DotIndicator(
                color: Colors.blue[700],
                size: 25,
                child: const Icon(
                  Icons.check,
                  size: 15,
                  color: Colors.white,
                ))
            : const OutlinedDotIndicator(
                size: 25,
                color: Colors.grey,
              ),
        startConnector: sessionId == 1
            ? null
            : DashedLineConnector(
                thickness: 2,
                dash: 5,
                gap: 5,
                color: isCompleted ? Colors.blue[700] : Colors.grey,
              ),
        //Todo: hardcoded last index
        endConnector: sessionId == 12
            ? null
            : DashedLineConnector(
                thickness: 2,
                dash: 6,
                gap: 5,
                color: isCompleted ? Colors.blue[700] : Colors.grey),
      ),
      contents: Padding(
        padding: EdgeInsets.only(left: 20, top: 10, bottom: 10),
        child: Container(
          height: 150,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade400, width: 2),
              borderRadius: const BorderRadius.all(Radius.circular(12))),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Session ${sessionId}',
                      style:
                          TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
                  isCompleted
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextButton(
                              onPressed: () {},
                              style: ButtonStyle(
                                minimumSize: MaterialStateProperty.all<Size>(
                                    const Size(20, 10)),
                                padding: MaterialStateProperty.all<
                                        EdgeInsetsGeometry>(
                                    const EdgeInsets.fromLTRB(15, 3, 15, 3)),
                                shape:
                                    MaterialStateProperty.all<OutlinedBorder>(
                                        const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20)))),
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.blue.shade700),
                              ),
                              child: const Text(
                                'Completed',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Text('Performed At'),
                            Text(
                              '${time}',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          ],
                        )
                      : Row(
                          children: [
                            Icon(
                              Icons.play_circle_fill_rounded,
                              size: 32,
                              color: Colors.blue.shade700,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            TextButton(
                              onPressed: () {},
                              style: ButtonStyle(
                                minimumSize: MaterialStateProperty.all<Size>(
                                    const Size(20, 10)),
                                padding: MaterialStateProperty.all<
                                        EdgeInsetsGeometry>(
                                    const EdgeInsets.fromLTRB(15, 3, 15, 3)),
                                shape:
                                    MaterialStateProperty.all<OutlinedBorder>(
                                        const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20)))),
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.grey.shade300),
                              ),
                              child: const Text(
                                'Start',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                ],
              ),
              const Spacer(),
              Container(
                alignment: Alignment.center,
                width: 130,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    color: sessionBgColor),
                child: Image.asset(
                  sessionImgPath,
                  width: 80,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget progressBanner() {
    var progress = (userController.user.value.sessionsCompletedToday /
            userController.user.value.sessionsTargetToday *
            100)
        .toInt();

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Good Morning\n${userController.user.value.name}',
            style: const TextStyle(
                height: 1.3, fontSize: 40, fontWeight: FontWeight.bold)),
        const SizedBox(
          height: 20,
        ),
        Container(
          width: Get.width,
          height: 130,
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 14),
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade400, width: 2),
              borderRadius: const BorderRadius.all(Radius.circular(12))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text("Today's Progress",
                          style: TextStyle(
                              color: Colors.grey.shade700,
                              fontSize: 28,
                              fontWeight: FontWeight.w500)),
                      const Spacer(),
                      Text(
                        "${progress}%",
                        style: TextStyle(
                            color: Colors.blue[700],
                            fontSize: 28,
                            fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  LinearPercentIndicator(
                    padding: const EdgeInsets.all(0),
                    barRadius: const Radius.circular(5),
                    lineHeight: 10,
                    percent: progress / 100,
                    backgroundColor: Colors.grey.shade300,
                    progressColor: Colors.blue[700],
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image.asset(
                    'assets/icons/checked.png',
                    scale: 1.6,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Completed'),
                      Text(
                          '${userController.user.value.sessionsCompletedToday} Sessions',
                          style: TextStyle(fontWeight: FontWeight.w600)),
                    ],
                  ),
                  const Spacer(),
                  Image.asset('assets/icons/next-button.png', scale: 1.6),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Pending'),
                      Text(
                          '${userController.user.value.sessionsTargetToday - userController.user.value.sessionsCompletedToday} Sessions',
                          style: TextStyle(fontWeight: FontWeight.w600)),
                    ],
                  )
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
