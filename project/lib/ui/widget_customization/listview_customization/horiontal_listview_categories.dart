import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/models/category_model.dart';
import 'package:project/ui/widget_customization/card_customization/category_item.dart';

class HorizontalListviewCategories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: <Widget>[
        CategoryItem(
            category: CategoryModel(
                logoPath: 'assets/cats/logo_iphone.jpg', name: 'Apple')),
        CategoryItem(
            category: CategoryModel(
                logoPath: 'assets/cats/logo_samsung.jpg', name: 'Samsung')),
        CategoryItem(
            category: CategoryModel(
                logoPath: 'assets/cats/logo_asus.png', name: 'ASUS')),
        CategoryItem(
            category: CategoryModel(
                logoPath: 'assets/cats/logo_huawei.jpg', name: 'Huawei')),
        CategoryItem(
            category: CategoryModel(
                logoPath: 'assets/cats/logo_realme.png', name: 'Realme')),
        CategoryItem(
            category: CategoryModel(
                logoPath: 'assets/cats/logo_oppo.png', name: 'Oppo')),
        CategoryItem(
            category: CategoryModel(
                logoPath: 'assets/cats/logo_vivo.jpg', name: 'Vivo')),
        InkWell(
            onTap: () {},
            child: Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(15)),
                width: 120.0,
                child: Card(
                  elevation: 10,
                  child: Center(
                    child: Text('Other', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.deepPurpleAccent),),
                  ),
                )))
      ],
    );
  }
}
