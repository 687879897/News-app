import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:news_app/model/sourcesresponse.dart';
import 'package:news_app/repo/newsrepoimpl.dart';
import 'package:news_app/repo/onlinedata/repo_online_impl.dart';
import 'package:news_app/ui/screens/homescreen/news/news-state.dart';
import 'package:news_app/ui/screens/homescreen/news/tab-list/tab-list-veiwmodel.dart';
import 'package:provider/provider.dart';
import '../../../../../repo/oflinedata/repo_ofline_impl.dart';
import '../../../../commenwidget/apploader.dart';
import '../../../../commenwidget/errorviwe.dart';
import '../tab-details/tab-details.dart';

class Tablist extends StatefulWidget {
  final String sourceid;
  const Tablist({Key? key, required this.sourceid}) : super(key: key);

  @override
  State<Tablist> createState() => _TablistState();
}

class _TablistState extends State<Tablist> {
  TabListViewModel viewModel = TabListViewModel(NewsRepoImpl(RepooflineImpl(),RepoonlineImpl(),InternetConnectionChecker()));
  int currentindex = 0;
  void initState() {
    // TODO: implement initState
    viewModel.loadtablist(widget.sourceid);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TabListViewModel,Tabliststate>(
      bloc: viewModel,
      builder: (context,state) {
        if(state.state==Apistate.loading){
          return apploader();
        }
        else if(state.state==Apistate.sucsses){
          return tabList(state.source);
        }
        else{
          return errprviwe(error: state.error, refresh: (){
            viewModel.loadtablist(widget.sourceid);
          }
          );
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
            tabs: sources.map((source) {
              return TabWidget(source, currentindex == sources.indexOf(source));
            }).toList(),
            onTap: (tabindex) {
              setState(() {
                currentindex = tabindex;
              });
            },
          ),
          Expanded(
            child: TabBarView(
              children: sources.map((source) => TabDateils(sourceid: source.id!)).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget TabWidget(Source source, bool isselected) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        border: Border.all(width: 2, color: const Color(0xff39A552)),
        color: isselected ? const Color(0xff39A552) : Colors.white,
      ),
      child: Text(
        source.name ?? "uniicon source ",
        style: TextStyle(color: isselected ? Colors.white : const Color(0xff39A552)),
      ),
    );
  }
}
