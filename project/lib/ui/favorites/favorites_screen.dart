import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/providers/products_provider.dart';
import 'package:project/ui/widget_customization/card_customization/favorite_item.dart';
import 'package:provider/provider.dart';

import '../../constants.dart';

//------Just show product that was liked

class FavoritesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ProductProvider>(
      builder: (context, productsData, _) {
        return Scaffold(
            backgroundColor: defaultBackgroundColor,
              body: Padding(
                padding: const EdgeInsets.all(10),
                child: productsData.filterFavoriteProduct() == 0
                    ? Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(CupertinoIcons.heart_slash,
                               color: Colors.red, size: 40),
                            SizedBox(width: 10),
                            Text(
                              'Your favorites is empty !',
                                style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.red,
                                fontSize: 20),
                      )
                    ],
                  ),
                )
              : ListView.builder(
                  shrinkWrap: true,
                  itemCount: productsData.products.length,
                  itemBuilder: (BuildContext context, int index) {
                    return productsData.products[index].isFavorite
                        ? FavoriteItem(
                            index: index,
                            onPressedDelete: () {
                              productsData.changeFavoriteAt(index);
                            },
                          )
                        : SizedBox(width: 0, height: 0);
                  },
                ),
        ));
      },
    );
  }
}
