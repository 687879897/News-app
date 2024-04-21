import 'package:flutter/cupertino.dart';
import 'package:news_app/data/apimanger.dart';
import 'package:news_app/ui/screens/homescreen/news/news-state.dart';

import '../../../../../model/articalresponce.dart';

class TabDetailsViewModel extends ChangeNotifier{
  state value=state.loading;
  @override
  late String sourceid;
   List<Article>artical=[];
  String error="";
  Future<void> loadtablist(sourceid)async{
    value=state.loading;
    notifyListeners();
    try {
      ArticlesResponse articlesResponse = await apimanger.loadingartical(sourceid);
      value=state.sucsses;
      artical = articlesResponse.articles!;
      notifyListeners();
    }catch(e){
      value=state.error;
      error=e.toString();
      notifyListeners();
    }

  }
}
