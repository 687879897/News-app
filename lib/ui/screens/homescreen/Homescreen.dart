import 'package:flutter/material.dart';
import 'package:news_app/model/catogryesdm.dart';
import 'package:news_app/ui/screens/homescreen/news/tab-list.dart';

import 'catgories/catogrie_tab.dart';

class Home extends StatefulWidget {
  static const String routeName = "Home";

  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  CategoryDM? category;
  String titel = "News App";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff39A552),
          title: Text(
            titel,
            style: const TextStyle(
                color: Colors.white, fontSize: 22, fontWeight: FontWeight.w600),
          ),
          centerTitle: true,
        ),
        body: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/splash.png'),
                  fit: BoxFit.cover),
            ),
            child: category == null
                ? CategoriesTab(
                    onCategoryClick: onCatogryclick,
                  )
                : Tablist(sourceid: category!.id)));
  }

  void onCatogryclick(CategoryDM categoryDM) {
    setState(() {
      category = categoryDM;
      titel = categoryDM.id;
    });
  }
}
