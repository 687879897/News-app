import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/model/articalresponce.dart';
import 'package:news_app/ui/commenwidget/errorviwe.dart';
import 'package:news_app/ui/screens/homescreen/news/news-state.dart';
import 'package:news_app/ui/screens/homescreen/news/tab-details/tab-details-veiwmodel.dart';
import 'package:provider/provider.dart';

import '../../../../commenwidget/apploader.dart';

class TabDateils extends StatefulWidget {
   TabDateils({super.key, required this.sourceid});
  final String sourceid;

  @override
  State<TabDateils> createState() => _TabDateilsState();
}

class _TabDateilsState extends State<TabDateils> {
  TabDetailsViewModel viewModel=TabDetailsViewModel();
  @override
  void initState() {
    // TODO: implement initState
    viewModel.loadtablist(widget.sourceid);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => viewModel,
      child: Builder(
        builder: (context) {
          viewModel=Provider.of(context,listen: true);
          if (viewModel.value == state.loading) {
            return apploader();
          } else if (viewModel.value == state.sucsses) {
            return aricalslist(viewModel.artical,context);
          } else {
            return errprviwe(error: viewModel.error,refresh: (){viewModel.loadtablist(widget.sourceid);});
          }
        },
      ),
    );
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
          margin: const EdgeInsets.only(left: 13,right: 13),
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
