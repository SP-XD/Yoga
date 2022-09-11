import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:rootllyai/controllers/user_controller.dart';
import 'package:rootllyai/responsive/responsive_layout.dart';
import 'package:timelines/timelines.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  UserController userController = Get.put(UserController());

  // * for unit testing
  var sessionBgColorArray = [
    Colors.blueAccent,
    Colors.green,
    Colors.deepOrange,
    Colors.purple,
    Colors.blueAccent,
    Colors.green,
    Colors.deepOrange,
    Colors.purple,
    Colors.blueAccent,
    Colors.green,
    Colors.deepOrange,
    Colors.purple,
  ];
  var sessionImgsArray = [
    'assets/session_imgs/yoga-pose1.png',
    'assets/session_imgs/yoga-pose2.png',
    'assets/session_imgs/yoga-pose3.png',
    'assets/session_imgs/yoga-pose4.png',
    'assets/session_imgs/yoga-pose1.png',
    'assets/session_imgs/yoga-pose2.png',
    'assets/session_imgs/yoga-pose3.png',
    'assets/session_imgs/yoga-pose4.png',
    'assets/session_imgs/yoga-pose1.png',
    'assets/session_imgs/yoga-pose2.png',
    'assets/session_imgs/yoga-pose3.png',
    'assets/session_imgs/yoga-pose4.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Obx(() => progressBanner()),
                const SizedBox(
                  height: 10,
                ),
                ListView.builder(
                    //* hardcoded
                    itemCount: 12,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Obx(() => SessionCard(
                          index + 1,
                          index <
                              userController.user.value.sessionsCompletedToday,
                          '11:10 am',
                          sessionBgColorArray[index],
                          sessionImgsArray[index]));
                    })
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 15),
        child: TextButton(
          onPressed: () {
            DateTime now = DateTime.now();
            DateFormat dateTodayFormat = DateFormat('dd-MM-yyyy');
            DateFormat timeNowFormat = DateFormat.jm();
            // * Temporary code to demonstrate working
            if (userController.user.value.sessionsCompletedToday < 12) {
              userController.user.value.sessionsCompletedToday++;
              print(
                  "date time now : ${dateTodayFormat.format(now)}, ${timeNowFormat.format(now)}");
              //* Todo: hardcoded userId
              userController.updateSessions(
                  1, dateTodayFormat.format(now), timeNowFormat.format(now));
            }
          },
          style: ButtonStyle(
            shadowColor: MaterialStateProperty.all<Color>(Colors.black),
            fixedSize:
                MaterialStateProperty.all<Size>(Size(Get.width * 0.85, 62)),
            padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                const EdgeInsets.fromLTRB(0, 0, 0, 0)),
            backgroundColor:
                MaterialStateProperty.all<Color?>(Colors.blue.shade700),
            shape: MaterialStateProperty.all<OutlinedBorder>(
                const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(50)))),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.play_arrow_rounded, size: 40, color: Colors.white),
              const Text('Start Session',
                  style: TextStyle(fontSize: 25, color: Colors.white))
            ],
          ),
        ),
      ),
    );
  }

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
        child: AnimatedOpacity(
          opacity: isCompleted ? 0.5 : 1.0,
          duration: const Duration(milliseconds: 500),
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
                    const SizedBox(
                      height: 20,
                    ),
                    Text('Session ${sessionId}',
                        style: TextStyle(
                            height: 0.1,
                            fontSize: 28,
                            fontWeight: FontWeight.bold)),
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
                              Text(
                                'Performed At',
                                style: TextStyle(
                                  height: 1,
                                ),
                              ),
                              Text(
                                '${time}',
                                style: TextStyle(
                                    height: 1.4, fontWeight: FontWeight.bold),
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
