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
    ProductController productController = Get.put(ProductController());
    String url = beer.image_url!;
    String title = beer.name!;
    String description = beer.description!;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          print(beer.id);
          print("Valor antes de sharedpreferences: ${beer.isFavourite}");
          print(beer.isFavourite);
          SharedPreferences prefs = await SharedPreferences.getInstance();

          // beer.isFavourite = (prefs.getBool("cerveza${beer.id}"));
          print("¿Mi cerveza es favorita? " + "${beer.isFavourite}");
          await prefs.setBool(
              'cerveza${beer.id}', productController.isFavourite.value);

          // await prefs.setString("key", json.encode(beer));

          beer.toString();
          print(beer.toJson());
        },
      ),
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
                    Container(
                      height: 40,
                      width: 40,
                      color: AppColors.orange,
                      child: GestureDetector(
                        onTap: () => Get.back(),
                        child: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Spacer(),
                    Container(
                      height: 40,
                      width: 40,
                      color: AppColors.orange,
                      child: GestureDetector(
                        onTap: () {
                          print(beer.isFavourite);
                          beer.isFavourite =
                              productController.isFavourite.value;
                          print(beer.isFavourite);
                        },
                        child: Icon(
                          Icons.star,
                          color: Colors.white,
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
