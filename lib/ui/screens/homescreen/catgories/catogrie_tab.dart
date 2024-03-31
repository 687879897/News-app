import 'package:flutter/material.dart';

import '../../../../model/catogryesdm.dart';
import 'app_catogries.dart';

class CategoriesTab extends StatelessWidget {
  final Function(CategoryDM) onCategoryClick;

  const CategoriesTab({super.key, required this.onCategoryClick});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          margin: EdgeInsets.all(15),
          padding: EdgeInsets.all(15),
          child: const Text(
            "Pick your category\nof interest",
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 22),
            textAlign: TextAlign.start,
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: GridView.builder(
                itemCount: CategoryDM.categories.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15,
                    childAspectRatio: 1.1),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      onCategoryClick(CategoryDM.categories[index]);
                    },
                    child: CategoryWidget(
                      categoryDM: CategoryDM.categories[index],
                    ),
                  );
                }),
          ),
        )
      ],
    );
  }
}
