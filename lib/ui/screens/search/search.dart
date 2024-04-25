// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:internet_connection_checker/internet_connection_checker.dart';
// import 'package:news_app/model/articalresponce.dart';
// import 'package:news_app/ui/commenwidget/errorviwe.dart';
// import 'package:news_app/ui/screens/homescreen/news/tab-list/tab-list-veiwmodel.dart';
//
// import '../../../repo/newsrepo.dart';
// import '../../../repo/oflinedata/repoofline.dart';
// import '../../../repo/onlinedata/repoonline.dart';
// import '../../commenwidget/apploader.dart';
//
// class Searchscreen extends StatefulWidget {
//   final String sourceid;
//   static const String routeName = "searchscreen";
//
//   const Searchscreen({super.key, required this.sourceid});
//
//   @override
//   State<Searchscreen> createState() => _SearchscreenState();
// }
//
// class _SearchscreenState extends State<Searchscreen> {
//   TabListViewModel viewModel=TabListViewModel();
//   String titel = "";
//   TextEditingController titelcontroller = TextEditingController();
//   NewsRepo newsRepo=NewsRepo(Repoofline(), Repoonline(), InternetConnectionChecker());
//
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         appBar: AppBar(
//           toolbarHeight: 90,
//           shape: const RoundedRectangleBorder(
//               borderRadius: BorderRadius.only(
//                   bottomLeft: Radius.circular(30),
//                   bottomRight: Radius.circular(30))),
//           backgroundColor: const Color(0xff39A552),
//           title: Container(
//             width: 350,
//             height: 50,
//             margin: const EdgeInsets.all(10),
//             child: TextField(
//               controller: titelcontroller,
//               onChanged: (value) {
//                 setState(() {
//                   titel = value;
//                 });
//               },
//               decoration: InputDecoration(
//                   filled: true,
//                   fillColor: Colors.white,
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(25.0),
//                   ),
//                   hintText: "Search Article",
//                   hintStyle: const TextStyle(
//                     color: Colors.black,
//                   ),
//                   suffixIcon: IconButton(
//                     onPressed: () {},
//                     icon: const Icon(Icons.search),
//                     color: const Color(0xff39A552),
//                   ),
//                   prefixIcon: IconButton(
//                     onPressed: () {
//                       setState(() {
//                         titel = "";
//                         titelcontroller.clear();
//                       });
//                     },
//                     icon: const Icon(Icons.clear),
//                     color: const Color(0xff39A552),
//                   )),
//             ),
//           ),
//         ),
//         body: Container(
//           width: double.infinity,
//           height: double.infinity,
//           decoration: const BoxDecoration(
//             image: DecorationImage(
//                 image: AssetImage('assets/splash.png'),
//                 fit: BoxFit.cover),
//           ),
//           child: FutureBuilder(
//               future: newsRepo.loadingartical(widget.sourceid),
//               builder: (context, snapshot) {
//                 if (snapshot.hasError) {
//                   return errprviwe(error: snapshot.error.toString(),refresh: (){viewModel.loadtablist(widget.sourceid);});
//                 } else if (snapshot.hasData) {
//                   return aricalslist(snapshot.data!.articles!, context);
//                 } else {
//                   return const apploader();
//                 }
//               }),
//         ),
//       ),
//     );
//   }
//
//   Widget aricalslist(List<Article?> articles, BuildContext context) {
//     List<Article?> filteredArticles = articles.where((article) {
//       // Filter condition: check if the article title contains the entered text
//       return article!.title!.toLowerCase().contains(titel.toLowerCase());
//     }).toList();
//
//     return ListView.builder(
//       itemCount: filteredArticles.length,
//       itemBuilder: (context, index) {
//         return arricalwidget(filteredArticles[index]!, context);
//       },
//     );
//   }
//
//   Widget arricalwidget(Article article, BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.stretch,
//       children: [
//         Container(
//           margin: const EdgeInsets.only(left: 13, right: 13),
//           child: CachedNetworkImage(
//             fit: BoxFit.fill,
//             height: MediaQuery.of(context).size.height * .25,
//             imageUrl: article.urlToImage!,
//             placeholder: (_, __) =>
//                 const Center(child: CircularProgressIndicator()),
//             errorWidget: (_, __, ___) => const Center(child: Icon(Icons.error)),
//           ),
//         ),
//         Container(
//           margin: const EdgeInsets.all(5),
//           child: Text(
//             article.source?.name ?? "",
//             textAlign: TextAlign.start,
//             style: const TextStyle(color: Color(0xff79828B), fontSize: 11),
//           ),
//         ),
//         Container(
//           margin: const EdgeInsets.all(5),
//           child: Text(
//             article.title ?? "",
//             textAlign: TextAlign.start,
//             style: const TextStyle(
//                 color: Colors.black, fontSize: 14, fontWeight: FontWeight.w500),
//           ),
//         ),
//         Container(
//             margin: const EdgeInsets.all(5),
//             child: Text(
//               article.publishedAt ?? "",
//               textAlign: TextAlign.end,
//               style: const TextStyle(color: Color(0xff79828B)),
//             )),
//       ],
//     );
//   }
// }
