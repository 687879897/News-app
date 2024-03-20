import 'package:news_app/model/source.dart';

class SourcesResponse {
  String? status;
  List<Source>? sources;
  String? code;
  String? message;

  SourcesResponse({
    this.status,
    this.sources, this.code, this.message});

  SourcesResponse.fromJson(dynamic json) {
    status = json["status"];
    code = json["code"];
    message = json["message"];
    if (json["sources"] != null) {
      sources = [];
      json["sources"].forEach((v) {
        sources?.add(Source.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["status"] = status;
    if (sources != null) {
      map["sources"] = sources?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

