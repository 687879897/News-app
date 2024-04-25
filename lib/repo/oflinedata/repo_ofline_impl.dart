

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:news_app/constans/firebaseconstans.dart';
import 'package:news_app/repo/oflinedata/repoofline.dart';

import '../../model/articalresponce.dart';
import '../../model/sourcesresponse.dart';

class RepooflineImpl extends Repoofline {
  static const String baseUrl = "https://newsapi.org";
  static const String apiKey = "d47498976b9640c38d3656b1aafe3944";
  static const String sourcesEndPoint = "/v2/top-headlines/sources";
  static const String articlesEndPoint = "/v2/everything";
  static String Sourseid = "";

  Future<SourcesResponse?> Loaider(String sourceid) async {
    CollectionReference collectionReference =
        FirebaseFirestore.instance.collection(Constans.tabcolllectionname);
    DocumentSnapshot documentSnapshot =
        await collectionReference.doc(sourceid).get();
    Map json = documentSnapshot.data() as Map;
    return SourcesResponse.fromJson(json);
  }

  Future<ArticlesResponse?> loadingartical(String sourceid) async {
    CollectionReference collectionReference =
    FirebaseFirestore.instance.collection(Constans.tabcolllectionname);
    DocumentSnapshot documentSnapshot =
    await collectionReference.doc(sourceid).get();
    Map json = documentSnapshot.data() as Map;
    return ArticlesResponse.fromJson(json);
  }

  Future<void> savttaps(String sourceid, SourcesResponse sourcesResponse) async {
    CollectionReference collectionReference =
        FirebaseFirestore.instance.collection(Constans.tabcolllectionname);
    await collectionReference.doc(sourceid).set(sourcesResponse.toJson());
  }

  Future<void> savtarticals(String sourceid, ArticlesResponse articlesResponse) async {
    CollectionReference collectionReference =
    FirebaseFirestore.instance.collection(Constans.articalcolllectionname);
    await collectionReference.doc(sourceid).set(articlesResponse.toJson());
  }
}
