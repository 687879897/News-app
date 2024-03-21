import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/data/apimanger.dart';
import 'package:news_app/model/articalresponce.dart';
import 'package:news_app/ui/commenwidget/errorviwe.dart';

import '../../../commenwidget/apploader.dart';

class TabDateils extends StatelessWidget {
  const TabDateils({super.key, required this.sourceid});

  final String sourceid;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: apimanger.loadingartical(sourceid),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return errprviwe(error: snapshot.error.toString());
          } else if (snapshot.hasData) {
            return aricalslist(snapshot.data!.articles!, context);
          } else {
            return const apploader();
          }
        });
  }

  Widget aricalslist(List<Article?> articles, BuildContext context) {
    return ListView.builder(
        itemCount: articles.length,
        itemBuilder: (context, index) {
          return arricalwidget(articles[index]!, context);
        });
  }

  Widget arricalwidget(Article article, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          margin: EdgeInsets.only(left: 13,right: 13),
          child: CachedNetworkImage(
            fit: BoxFit.fill,
            height: MediaQuery.of(context).size.height * .25,
            imageUrl: article.urlToImage!,
            placeholder: (_, __) =>
                const Center(child: CircularProgressIndicator()),
            errorWidget: (_, __, ___) => const Center(child: Icon(Icons.error)),
          ),
        ),
        Container(
          margin: const EdgeInsets.all(5),
          child: Text(
            article.source?.name ?? "",
            textAlign: TextAlign.start,
            style: const TextStyle(color: Color(0xff79828B), fontSize: 11),
          ),
        ),
        Container(
          margin: const EdgeInsets.all(5),
          child: Text(
            article.title ?? "",
            textAlign: TextAlign.start,
            style: const TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.w500),
          ),
        ),
        Container(
            margin: const EdgeInsets.all(5),
            child: Text(
              article.publishedAt ?? "",
              textAlign: TextAlign.end,
              style: const TextStyle(color: Color(0xff79828B)),
            )),
      ],
    );
  }
}
