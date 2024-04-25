import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:news_app/model/sourcesresponse.dart';
import 'package:news_app/repo/newsrepo.dart';
import 'package:news_app/repo/oflinedata/repoofline.dart';
import 'package:news_app/ui/screens/homescreen/news/news-state.dart';


class TabListViewModel extends Cubit<Tabliststate>{
  Apistate value=Apistate.loading;
  @override
  late String sourceid;
  NewsRepo newsRepo;
  TabListViewModel(this.newsRepo) : super(Tabliststate());


  Future<void> loadtablist(sourceid)async{
      emit(Tabliststate(state: Apistate.loading));
 try {
   SourcesResponse sourcesResponse = await newsRepo.Loaider(sourceid);
   emit(Tabliststate(state: Apistate.sucsses,source: sourcesResponse.sources!));
 }catch(e){
   emit(Tabliststate(state: Apistate.error,error: e.toString()));
 }

  }
}
class Tabliststate{
  Apistate state;
  Tabliststate({this.state=Apistate.loading,this.error='',this.source=const []});
  List<Source>source=[];
  String error="";
}
