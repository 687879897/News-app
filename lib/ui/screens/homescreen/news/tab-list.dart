import 'package:flutter/material.dart';
import 'package:news_app/data/apimanger.dart';
import 'package:news_app/model/sourcesresponse.dart';
import 'package:news_app/ui/screens/homescreen/news/tab-details.dart';

import '../../../commenwidget/apploader.dart';
import '../../../commenwidget/errorviwe.dart';

class Tablist extends StatefulWidget {
  final String sourceid;
  const Tablist({Key? key, required this.sourceid}) : super(key: key);

  @override
  State<Tablist> createState() => _TablistState();
}

class _TablistState extends State<Tablist> {
  int currentindex=0;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: apimanger.Loaider(widget.sourceid),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return errprviwe(error: snapshot.error.toString());
        } else if (snapshot.hasData) {
          return tabList(snapshot.data!.sources!);
        } else {
          return const apploader();
        }
      },
    );
  }

  Widget tabList(List<Source> sources) {

    return DefaultTabController(
      length: sources.length,
      child: Column(
        children: [
          TabBar(
            indicatorColor: Colors.transparent,
            isScrollable: true,
              tabs: sources.map((source){
               return TabWidget(source,currentindex==sources.indexOf(source));
              }).toList(),
            onTap: (tabindex){

              setState(() {
                currentindex=tabindex;
              });
            },
          ),
          Expanded(
            child: TabBarView(

              children: sources.map((source)=>TabDateils(sourceid: source.id!,)).toList(),
            ),
          )
        ],
      ),
    );
  }

  Widget TabWidget(Source source,bool isselected){
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16 ),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        border: Border.all(width: 2,color: const Color(0xff39A552)),
          color: isselected ? const Color(0xff39A552):Colors.white
      ),
      child:Text(source.name??"uniicon source ",style: TextStyle(color: isselected?Colors.white:const Color(0xff39A552)),),
    );
  }
}



