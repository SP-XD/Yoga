import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';

class RehabPage extends StatefulWidget {
  const RehabPage({Key? key}) : super(key: key);

  @override
  State<RehabPage> createState() => _RehabPageState();
}

class _RehabPageState extends State<RehabPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
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
                        style: TextStyle(color: Colors.black, fontSize: 15)),
                    Row(
                      children: [
                        Image.asset(
                          'assets/icons/dumbbell.png',
                          scale: 2.8,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        //Todo: implement user modal total sessions
                        Text("16",
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
                    Text('Total Sessions',
                        style: TextStyle(color: Colors.black, fontSize: 15)),
                    Row(
                      children: [
                        Image.asset(
                          'assets/icons/hourglass.png',
                          scale: 2.8,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        //Todo: implement user modal total sessions
                        Text("16",
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold))
                      ],
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
