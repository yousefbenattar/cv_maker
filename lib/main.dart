import 'package:cv_maker/provider/controller.dart';
//import 'package:cv_maker/splash.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//import 'fill_page.dart';
import 'home.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers:[ChangeNotifierProvider(create:(context)=> Controller())],
      child:const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Flutter Pdf Demo",
        home: Home(),
      ),
    );
  }
}
