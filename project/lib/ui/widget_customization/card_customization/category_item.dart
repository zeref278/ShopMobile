import 'package:flutter/material.dart';
import 'package:project/models/category_model.dart';
import 'package:project/ui/categories/categories_screen.dart';

class CategoryItem extends StatelessWidget {
  final CategoryModel category;

  CategoryItem({
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return CategoriesScreen(category: category);
            },
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15)
          ),
            width: 120.0,
            child: Card(
              elevation: 10,
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: ClipRRect(
                  child: Image(
                    image: AssetImage(
                        category.logoPath),
                  ),
                ),
              ),
            )));
  }
}
