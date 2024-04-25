
import '../../model/articalresponce.dart';
import '../../model/sourcesresponse.dart';

abstract class Repoofline {
  static const String baseUrl = "https://newsapi.org";
  static const String apiKey = "d47498976b9640c38d3656b1aafe3944";
  static const String sourcesEndPoint = "/v2/top-headlines/sources";
  static const String articlesEndPoint = "/v2/everything";
  static String Sourseid = "";

  Future<SourcesResponse?> Loaider(String sourceid) ;

  Future<ArticlesResponse?> loadingartical(String sourceid) ;

  Future<void> savttaps(String sourceid, SourcesResponse sourcesResponse) ;

  Future<void> savtarticals(String sourceid, ArticlesResponse articlesResponse) ;
}
