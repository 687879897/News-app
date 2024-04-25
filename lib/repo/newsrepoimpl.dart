import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:news_app/repo/newsrepo.dart';

import '../model/articalresponce.dart';
import '../model/sourcesresponse.dart';
import 'oflinedata/repoofline.dart';
import 'onlinedata/repoonline.dart';

class NewsRepoImpl extends NewsRepo{
  Repoonline repoonline;
  Repoofline repoofline;
  InternetConnectionChecker internetConnectionChecker;

  NewsRepoImpl(this.repoofline,this.repoonline,this.internetConnectionChecker) ;



  Future<SourcesResponse> Loaider(String sourceid)async{
    if(await internetConnectionChecker.hasConnection){
      SourcesResponse response=await repoonline.Loaider(sourceid);
      repoofline.savttaps(sourceid,response);
      return response;
    }
    else{
      SourcesResponse? response=await repoofline.Loaider(sourceid);
      return response!;
    }

  }


  Future<ArticlesResponse> loadingartical(String sourceid)async{
    if(await internetConnectionChecker.hasConnection){
      ArticlesResponse response=await repoonline.loadingartical(sourceid);
      repoofline.savtarticals(sourceid,response);
      return response;
    }
    else{
      ArticlesResponse? response=await repoofline.loadingartical(sourceid);
      return response!;
    }

  }
}