import 'package:flutter/material.dart';

import '../../../../model/catogryesdm.dart';


class CategoryWidget extends StatelessWidget {
  final CategoryDM categoryDM;

  const CategoryWidget({super.key, required this.categoryDM});

  @override
  Widget build(BuildContext context) {
    return Container(

      child: Image.asset(categoryDM.imagePath, height: MediaQuery.of(context).size.height * .14,),
    );
  }
}