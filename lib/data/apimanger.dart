import 'dart:convert';

import 'package:http/http.dart';

import '../model/Sourcesresponse.dart';

abstract class apimanger{

 static Future<List<Sources>> Loaider()async{
   try{
     Uri url=Uri.parse("https://newsapi.org/v2/top-headlines/sources?apiKey=d47498976b9640c38d3656b1aafe3944");
     Response response=await get(url);
     Map mapbody=jsonDecode(response.body);

     if(response.statusCode>=200&&response.statusCode<300){
       Sourcesresponse sourceResponse=Sourcesresponse.fromJson(mapbody);
       return sourceResponse.sources!;
     }
     else{
       throw "somthing wentwrong please enter latear";
     }

   }
   catch(e){
     rethrow;
   }
    }
}