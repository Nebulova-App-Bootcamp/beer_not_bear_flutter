import 'dart:convert';

import 'package:beer_not_bear_flutter/controller/product_controller.dart';
import 'package:beer_not_bear_flutter/models/beer.dart';
import 'package:beer_not_bear_flutter/theme/color_theme.dart';
import 'package:beer_not_bear_flutter/theme/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DetailsBeer extends StatelessWidget {
  final Beer beer;
  DetailsBeer({Key? key, required this.beer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProductController productController = Get.find();
    String url = beer.image_url!;
    String title = beer.name!;
    String description = beer.description!;

    return Scaffold(
      body: ListView(
        shrinkWrap: true,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 40, left: 40, right: 40),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () => Get.back(),
                      child: Container(
                        height: 40,
                        width: 40,
                        color: AppColors.orange,
                        child: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Spacer(),
                    Obx(
                      () => GestureDetector(
                        onTap: () async {
                          SharedPreferences prefs =
                              await SharedPreferences.getInstance();

                          productController.getFavourites();
                          productController.isFavourite.value =
                              !productController.isFavourite.value;
                          beer.isFavourite =
                              productController.isFavourite.value;
                          if (productController.isFavourite.value == true) {
                            productController.favouritesBeersString
                                .add(jsonEncode(beer));
                            Set<String> otherList =
                                productController.favouritesBeersString.toSet();

                            productController.favouritesBeersString.value =
                                otherList.toList();

                            await prefs.setStringList("favouritesBeers",
                                productController.favouritesBeersString);

                            print(
                                productController.favouritesBeersString.length);
                          }

                          if (productController.isFavourite.value == false) {
                            print(productController.favouritesBeersString);
                            beer.isFavourite = true;
                            String _remove = jsonEncode(beer);

                            print(_remove);
                            productController.favouritesBeersString
                                .remove(_remove);
                            print(productController.favouritesBeersString);

                            await prefs.setStringList("favouritesBeers",
                                productController.favouritesBeersString);
                            print(
                                productController.favouritesBeersString.length);
                            beer.isFavourite = false;
                          }

                          await prefs.setBool('cerveza${beer.id}',
                              productController.isFavourite.value);
                          // beer.isFavourite = (prefs.getBool("cerveza${beer.id}"));
                          print("¿Mi cerveza es favorita? " +
                              "${beer.isFavourite}");
                        },
                        child: Container(
                          height: 40,
                          width: 40,
                          color: AppColors.orange,
                          child: Icon(
                            Icons.star,
                            color: (productController.isFavourite.value == true)
                                ? Colors.yellow
                                : Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(left: 30, right: 30, top: 40),
            child: SizedBox(
              height: 180,
              child: Image.network(url, fit: BoxFit.fitHeight),
            ),
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.only(left: 30, right: 30, top: 40),
              child: Text(
                title,
                style: textTheme.headline1,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 30, right: 30, top: 40),
            child: Text(
              description,
              style: textTheme.bodyText1,
            ),
          ),
        ],
      ),
    );
  }
}
