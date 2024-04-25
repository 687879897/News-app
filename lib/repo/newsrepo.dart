

import '../model/articalresponce.dart';
import '../model/sourcesresponse.dart';

abstract class NewsRepo{




  Future<SourcesResponse> Loaider(String sourceid);



  Future<ArticlesResponse> loadingartical(String sourceid);
}