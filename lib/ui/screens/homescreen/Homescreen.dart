
import 'package:flutter/material.dart';
import 'package:news_app/model/catogryesdm.dart';
import 'package:news_app/ui/screens/homescreen/news/tab-list.dart';
import 'package:news_app/ui/screens/homescreen/setting/setting_tab.dart';

import 'catgories/catogrie_tab.dart';

class Home extends StatefulWidget {
  static const String routeName = "Home";

  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
 late Widget body;
  String titel = "News App";
  @override
  void initState() {
    // TODO: implement initState
    body=CategoriesTab(onCategoryClick:onCatogryclick ,);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async{
        if(body is CategoriesTab)
          return true;
        else{
          setState(() {
            body =CategoriesTab(onCategoryClick: onCatogryclick);
          });
          return false;
        }

      },
      child: SafeArea(
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: const Color(0xff39A552),
              title: Text(
                titel,
                style: const TextStyle(
                    color: Colors.white, fontSize: 22, fontWeight: FontWeight.w600),
              ),
              centerTitle: true,
            ),
            drawer: buildDrawer(),
            body: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/splash.png'),
                      fit: BoxFit.cover),
                ),
                child: body
            )
        ),
      ),
    );
  }

  buildDrawer() => Drawer(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
         DrawerHeader(
            decoration: const BoxDecoration(color: Color(0xff39A552)),
            child: Center(
                child: Text(
                  titel,
                  style: const TextStyle(color: Colors.white, fontSize: 24),
                ))),
        buildDrawerRow(Icons.list, "Categories", (){
          setState(() {
            body =CategoriesTab(onCategoryClick: onCatogryclick);


          });
          Navigator.pop(context);
        }),
        buildDrawerRow(Icons.settings, "Settings", (){
         
          setState(() {
            body=Settingtab();
          });
          Navigator.pop(context);
        }),
      ],
    ),
  );

  buildDrawerRow(IconData iconData, String title, Function onClick) => InkWell(
    onTap: (){
      onClick();
    },
    child: Row(
      children: [
        const SizedBox(
          width: 16,
        ),
        Icon(
          iconData,
          color: Colors.black,
          size: 35,
        ),
        const SizedBox(
          width: 16,
        ),
        Text(
          title,
          style: const TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        )
      ],
    ),
  );

  void onCatogryclick(CategoryDM categoryDM) {
    setState(() {
      body=Tablist(sourceid: categoryDM.id);
      titel = categoryDM.id;
    });
  }
}
