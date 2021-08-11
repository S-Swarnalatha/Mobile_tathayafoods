import 'package:flutter/material.dart';
import 'package:somt/Contact.dart';
import 'package:somt/Getaddress.dart';
import 'package:somt/pages/farmer/subscribtion.dart';
import 'BottomBar.dart';
import 'NotificationPage.dart';
import 'ProfilePage.dart';
import 'home.dart';
import 'pages/user/login_page.dart';
import 'pages/user/scan.dart';
import 'pages/user/signup.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/LoginPage': (context) => LoginPage(),
        '/RegisterPage': (context) => SignupPage(),
        '/Homepage': (context) => Home(),
        '/NotificationPage': (context)=> NotificationPage(),
        '/BottomBar': (context)=> BottomBar(),
      
        '/ProfilePage' : (context)=> ProfilePage(),
        '/ScanPage': (context)=> Scan(),
         '/Contact': (context)=> Contact(),

      },
      title: 'SOMT',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Poppins',
        primaryColor: Colors.white,
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          elevation: 0,
          foregroundColor: Colors.white,
        ),
        accentColor: Colors.blueAccent,
        textTheme: TextTheme(
          headline1: TextStyle(fontSize: 22.0, color: Colors.blueAccent),
          headline2: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.w700,
            color: Colors.redAccent,
          ),
          bodyText1: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.w400,
            color: Colors.redAccent,
          ),
        ),
      ),
      home: Home(),
    );

  }
}
