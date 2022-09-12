import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rootllyai/controllers/user_controller.dart';
import 'package:rootllyai/firebase_options.dart';
import 'package:rootllyai/main_layout.dart';
import 'package:rootllyai/models/user.dart';
import 'package:rootllyai/pages/home_page.dart';
import 'package:rootllyai/pages/rehab_page.dart';
import 'package:rootllyai/resources/firebase_methods.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //firebase initializtion
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MyApp());
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(systemNavigationBarColor: Colors.grey.shade200));
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final UserController userController = Get.put(UserController());
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //hardcoded temp firebase initialization for first time
    FirebaseMethods().setRecords(1, userController.user.value);
    return GetMaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          textTheme: GoogleFonts.poppinsTextTheme(),
        ),
        getPages: [
          GetPage(name: '/', page: () => MyApp()),
          GetPage(name: '/home', page: () => HomePage()),
          GetPage(name: '/rehab', page: () => RehabPage())
        ],
        debugShowCheckedModeBanner: false,
        home: FutureBuilder(
            future: FirebaseDatabase.instance.ref().child('users/1').once(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                var event = snapshot.data as DatabaseEvent;
                debugPrint(
                    'snapshot data future builder : ${event.snapshot.value}');
                userController.updateUser(User.fromSnapshot(event.snapshot));
                debugPrint(
                    'user data after first initialization : ${userController.user.value}');
                return const MainLayout();
              }

              return const Center(
                child: CircularProgressIndicator(),
              );
            }));
  }
}
