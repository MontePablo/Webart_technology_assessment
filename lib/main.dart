import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:webart_technology_assessment/pages/home_page.dart';
import 'package:webart_technology_assessment/pages/login_page.dart';
import 'package:webart_technology_assessment/utils/routes.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: GoogleFonts.lato().fontFamily,
        textTheme: GoogleFonts.latoTextTheme(),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        "/": (context) => LoginPage(),
        MyRoutes.homeRoute: (context) => HomePage(),
        MyRoutes.loginRoute: (context) => LoginPage(),
      },
    );
  }
}
