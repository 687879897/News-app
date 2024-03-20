import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:news_app/data/apimanger.dart';
import 'package:news_app/model/source.dart'; // Assuming this is where your 'Source' class is defined
import 'package:news_app/model/sourcesresponse.dart';

class Tablist extends StatelessWidget {
  const Tablist({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SourcesResponse>(
      future: apimanger.Loaider(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return errorView(snapshot.error.toString());
        } else if (snapshot.hasData) {
          return tabList(snapshot.data!.sources!.cast<Source>());
        } else {
          return loader();
        }
      },
    );
  }

  Widget tabList(List<Source> sources) {
    return Text("Successful API call");
  }

  Widget errorView(String error) {
    return Column(
      children: [
        Text(error),
        ElevatedButton(
          onPressed: () {},
          child: Text("Refresh"),
        ),
      ],
    );
  }

  Widget loader() {
    return Center(child: CircularProgressIndicator());
  }
}
