
import 'package:flutter/material.dart';
class CategoryDM{
  String id;

  String imagePath;
  bool isLeftSided;


  CategoryDM({required this.id,

    required this.imagePath,
    required this.isLeftSided,
    });

  static List<CategoryDM> categories = [
    CategoryDM(id: "sports",
        imagePath: "assets/sports.png", isLeftSided: true,
        ),
    CategoryDM(id: "technology",
        imagePath: "assets/politics.png", isLeftSided: false,
        ),
    CategoryDM(id: "health",
        imagePath: "assets/health.png", isLeftSided: true,
       ),
    CategoryDM(id: "business",
        imagePath: "assets/business.png", isLeftSided: false,
        ),
    CategoryDM(id: "entertainment",
        imagePath: "assets/enviroment.png", isLeftSided: true,
        ),
    CategoryDM(id: "science",
        imagePath: "assets/science.png", isLeftSided: false,
        )
  ];
}