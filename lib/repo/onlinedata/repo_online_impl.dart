import 'dart:convert';

import 'package:http/http.dart';
import 'package:news_app/repo/onlinedata/repoonline.dart';

import '../../model/articalresponce.dart';
import '../../model/sourcesresponse.dart';

 class RepoonlineImpl extends Repoonline{
  static const String baseUrl = "https://newsapi.org";
  static const String apiKey = "d47498976b9640c38d3656b1aafe3944";
  static const String sourcesEndPoint = "/v2/top-headlines/sources";
  static const String articlesEndPoint = "/v2/everything";
  static  String Sourseid = "";


  Future<SourcesResponse> Loaider(String sourceid)async{
   try{
     Uri url=Uri.parse("$baseUrl$sourcesEndPoint?apiKey=$apiKey&category=$sourceid");
     Response response=await get(url);
     Map mapbody=jsonDecode(response.body);
     SourcesResponse sourceResponse=SourcesResponse.fromJson(mapbody);

     if(response.statusCode>=200&&response.statusCode<300){
       return sourceResponse;
     }
     else{
       throw sourceResponse.message?? "somthing wentwrong please enter latear";
     }
   }
   catch(e){
     rethrow ;
   }

}
  Future<ArticlesResponse> loadingartical(String sourceid)async{
   try{
     Uri url=Uri.parse("$baseUrl$articlesEndPoint?apiKey=$apiKey&sources=$sourceid");
     Response response=await get(url);
     Map mapbody=jsonDecode(response.body);
     ArticlesResponse articlesResponse=ArticlesResponse.fromJson(mapbody);
     Sourseid=sourceid;

     if(response.statusCode>=200&&response.statusCode<300){
       return articlesResponse;
     }
     else{
       throw articlesResponse.message?? "somthing wentwrong please enter latear";
     }
   }
   catch(e){
     rethrow ;
   }

 }

}