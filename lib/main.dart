import 'dart:io';

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:moviez/base_config.dart';
import 'package:moviez/screens/home/home_screen.dart';
 
 

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Moviez',
        
        theme: ThemeData(
          // ignore: prefer_const_constructors
          textTheme: TextTheme(

            headline5: const TextStyle(fontWeight: FontWeight.bold, color: primary_color)
          )
          ,
          primarySwatch: Colors.grey,
        ),
        home: const HomePage()
        //
        //
        //
        //  SplashScreen(
        //   seconds: 3,
        //   navigateAfterSeconds: HomePage,
        //   title: new Text(
        //   'SplashScreen Example',
        //   style: new TextStyle(
        //       fontWeight: FontWeight.bold,
        //       fontSize: 20.0,
        //       color: Colors.white),
        // ),
        // backgroundColor: Colors.lightBlue[200],




        // )

        );
  }
}

 