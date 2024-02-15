// import 'package:clinic_project/Doctor.dart';
import 'package:fonal_clinic_project/Views/Page_Doctors.dart';
import 'package:fonal_clinic_project/Views/Create_Docotor.dart';
import 'package:fonal_clinic_project/Views/categoryCard.dart';
import 'package:fonal_clinic_project/login.dart';
import 'package:fonal_clinic_project/signup.dart';
import 'package:fonal_clinic_project/home.dart';
import 'package:fonal_clinic_project/wlcomeBack.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: WlcomeBack(),
   // return MaterialApp(home:  HomePage (),
    debugShowCheckedModeBanner: false,
     routes: <String, WidgetBuilder>{
      '/login': (context) => LogIn(), 
      '/Create_Docotor': (context) => Create_Doctor(),
      '/home': (context) => HomePage(),
      '/signup': (context) => SignUP(),
     
      '/Page_Doctors': (context) => Page_Doctors(),
      // '/categoryCard': (context) =>  CategoryCard(),
 

    });
  }
}
