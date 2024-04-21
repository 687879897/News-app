import 'package:flutter/cupertino.dart';
import 'package:news_app/data/apimanger.dart';
import 'package:news_app/model/sourcesresponse.dart';
import 'package:news_app/ui/screens/homescreen/news/news-state.dart';

class TabListViewModel extends ChangeNotifier{
  state value=state.loading;
  @override
  late String sourceid;
   List<Source>source=[];
  String error="";

  Future<void> loadtablist(sourceid)async{
    value=state.loading;
    notifyListeners();

 try {
   SourcesResponse sourcesResponse = await apimanger.Loaider(sourceid);
   value=state.sucsses;
   source = sourcesResponse.sources!;
   notifyListeners();
 }catch(e){
   value=state.error;
   error=e.toString();
   notifyListeners();
 }

  }
}
