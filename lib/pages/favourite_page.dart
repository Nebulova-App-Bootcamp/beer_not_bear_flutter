import 'package:beer_not_bear_flutter/controller/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavouritePage extends StatelessWidget {
  const FavouritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProductController productController = Get.put(ProductController());
    return Scaffold(
      body: Obx(
        () => ListView.builder(
          itemCount: productController.favouritesBeers.length,
          itemBuilder: (context, index) {
            return Text(productController.favouritesBeers[index].id.toString());
          },
        ),
      ),
    );
  }
}
