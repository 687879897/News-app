import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:news_app/ui/screens/homescreen/Homescreen.dart';
import 'package:news_app/ui/screens/search/search.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: const FirebaseOptions(
      apiKey: "AIzaSyAnWw1kkmqj5zBnUpBVMXLiXMiWBN_6UyU",
      appId: "news-app-c0b58",
      messagingSenderId: "news-app-c0b58",
      projectId: "news-app-c0b58"));
  await FirebaseFirestore.instance.disableNetwork();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        // Searchscreen.routeName:(_)=>Searchscreen(sourceid: apimanger.Sourseid,),
        Home.routeName:(_)=>const Home()
      },
      initialRoute: Home.routeName,


    );
  }
}
