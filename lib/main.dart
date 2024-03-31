import 'package:flutter/material.dart';
import 'package:news_app/data/apimanger.dart';
import 'package:news_app/ui/screens/homescreen/Homescreen.dart';
import 'package:news_app/ui/screens/search/search.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        Searchscreen.routeName:(_)=>Searchscreen(sourceid: apimanger.Sourseid,),
        Home.routeName:(_)=>const Home()
      },
      initialRoute: Home.routeName,


    );
  }
}
