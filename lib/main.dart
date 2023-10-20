import 'package:compass_app/Modules/Home/home.dart';
import 'package:compass_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'Modules/Bookmarks/bookmarks.dart';
import 'Modules/Profile/profile.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Compass Media',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Inter',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        scaffoldBackgroundColor: HexColor('#0F1D37'),
        textTheme: Theme.of(context).textTheme.apply(
              fontFamily: 'Inter',

              //  Set default Text() color;  Use:  apply()
              bodyColor: Colors.white,
              displayColor: Colors.white,
            ),
        appBarTheme: AppBarTheme(
            elevation: 0,
            backgroundColor: HexColor('#0F1D37'),
            iconTheme: const IconThemeData(
              color: Colors.black,
            ),
            toolbarHeight: 88),
      ),
      home: const BookmarksScreen(),
    );
  }
}
