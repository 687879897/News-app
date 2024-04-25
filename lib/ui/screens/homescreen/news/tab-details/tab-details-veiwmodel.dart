import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/ui/screens/homescreen/news/news-state.dart';

import '../../../../../model/articalresponce.dart';
import '../../../../../repo/newsrepo.dart';


class TabDetailsViewModel extends Cubit<Tabliststate>{
  Apistate value=Apistate.loading;
  @override
  late String sourceid;

  NewsRepo newsRepo;
  TabDetailsViewModel(this.newsRepo) : super(Tabliststate());

  Future<void> loadtablist(sourceid)async{

    //notifyListeners();
    emit(Tabliststate(state: Apistate.loading));
    try {
      ArticlesResponse articlesResponse = await newsRepo.loadingartical(sourceid);

      //notifyListeners();
      emit(Tabliststate(state: Apistate.sucsses,artical: articlesResponse.articles!));
    }catch(e){


     // notifyListeners();
      emit(Tabliststate(state: Apistate.error,error: e.toString()));
    }

  }
}
class Tabliststate{
  Apistate state;
  Tabliststate({this.state=Apistate.loading,this.error='',this.artical=const []});
  List<Article>artical=[];
  String error="";
}
