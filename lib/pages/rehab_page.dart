import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:rootllyai/controllers/user_controller.dart';

class RehabPage extends StatefulWidget {
  const RehabPage({Key? key}) : super(key: key);

  @override
  State<RehabPage> createState() => _RehabPageState();
}

class _RehabPageState extends State<RehabPage> {
  UserController userController = Get.put(UserController());

  //* testing Data
  List sessionImgs = [
    "assets/session_imgs/yoga-pose1.png",
    "assets/session_imgs/yoga-pose2.png",
    "assets/session_imgs/yoga-pose3.png",
    "assets/session_imgs/yoga-pose4.png",
    "assets/session_imgs/yoga-pose1.png",
    "assets/session_imgs/yoga-pose2.png",
    "assets/session_imgs/yoga-pose3.png",
    "assets/session_imgs/yoga-pose4.png",
    "assets/session_imgs/yoga-pose1.png",
    "assets/session_imgs/yoga-pose2.png",
    "assets/session_imgs/yoga-pose3.png",
    "assets/session_imgs/yoga-pose4.png",
    "assets/session_imgs/yoga-pose1.png",
    "assets/session_imgs/yoga-pose2.png",
    "assets/session_imgs/yoga-pose3.png",
    "assets/session_imgs/yoga-pose4.png",
  ];
  List sessionImgsColor = [
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
    Colors.purple,
    Colors.blueAccent,
    Colors.green,
    Colors.deepOrange,
    Colors.purple,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Rehab Programme',
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
            const SizedBox(
              height: 10,
            ),
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              child: Image.asset('assets/rehab_programme_imgs/banner1.png',
                  scale: 1.5, fit: BoxFit.fill),
            ),
            const SizedBox(
              height: 20,
            ),
            sessionHistory()
          ],
        ),
      )),
    );
  }

  Container sessionHistory() {
    // * Temporay solution to nested map
    List sessionDates = userController.user.value.sessionsDetails.entries
        .map((e) => e.key)
        .toList();
    List sessionTime = userController
        .user.value.sessionsDetails[sessionDates[0]].entries
        .map((e) => e.key)
        .toList();

    print("seesionDates ${sessionDates}");
    print("seesionTime ${sessionTime}");

    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text('History',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
              const Spacer(),
              Icon(Icons.filter_alt, size: 30),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Text('Total Sessions',
                        style: TextStyle(color: Colors.black, fontSize: 12)),
                    Row(
                      children: [
                        Image.asset(
                          'assets/icons/dumbbell.png',
                          scale: 2.8,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                            "${userController.user.value.totalSessionsCompleted}",
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold))
                      ],
                    ),
                  ],
                ),
                const Text(
                  '|',
                  style: TextStyle(color: Colors.grey, fontSize: 30),
                ),
                Column(
                  children: [
                    Text('Total Time',
                        style: TextStyle(color: Colors.black, fontSize: 12)),
                    Row(
                      children: [
                        Image.asset(
                          'assets/icons/hourglass.png',
                          scale: 2.8,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Text("${userController.user.value.totalTimeCompleted}",
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold))
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          ListView.separated(
            shrinkWrap: true,
            itemCount: userController.user.value.totalSessionsCompleted,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return historySessionCards(sessionDates[0], sessionTime[index],
                  sessionImgs[index], sessionImgsColor[index]);
            },
            separatorBuilder: (context, index) {
              return const SizedBox(
                height: 15,
              );
            },
          )
        ],
      ),
    );
  }

  Container historySessionCards(
      String time, String date, String sessionCardImg, Color sessionImgColor) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: sessionImgColor,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Image.asset('${sessionCardImg}',
                  scale: 3, fit: BoxFit.contain)),
          const SizedBox(
            width: 20,
          ),
          Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      FontAwesomeIcons.clock,
                      size: 15,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      '${time}',
                      style: TextStyle(fontSize: 15),
                    )
                  ],
                ),
                const SizedBox(
                  height: 2,
                ),
                Row(
                  children: [
                    Icon(
                      FontAwesomeIcons.calendar,
                      size: 15,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      '${date}',
                      style: TextStyle(fontSize: 15),
                    )
                  ],
                ),
              ]),
          const Spacer(),
          Text('View Results', style: TextStyle(fontSize: 15)),
          const SizedBox(
            width: 10,
          )
        ],
      ),
    );
  }
}
