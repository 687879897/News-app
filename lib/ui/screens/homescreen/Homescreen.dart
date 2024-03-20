import 'package:flutter/material.dart';
import 'package:news_app/ui/screens/homescreen/news/tab-list.dart';

class Home extends StatelessWidget {
  static const String routeName="Home";
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Homescreen"),
        centerTitle: true,

      ),
      body: Tablist(),
    );
  }
}
