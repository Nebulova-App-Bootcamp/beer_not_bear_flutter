// import 'package:appbeer/controller/beer_api_controller.dart';
// import 'package:get/get_state_manager/get_state_manager.dart';

import 'package:beer_not_bear_flutter/controller/api_controller.dart';
import 'package:beer_not_bear_flutter/controller/auth_controller.dart';
import 'package:beer_not_bear_flutter/controller/product_controller.dart';
import 'package:beer_not_bear_flutter/pages/api_test.dart';
import 'package:beer_not_bear_flutter/pages/details_beer.dart';
import 'package:beer_not_bear_flutter/pages/favourite_page.dart';
import 'package:beer_not_bear_flutter/pages/profile.dart';
import 'package:beer_not_bear_flutter/theme/color_theme.dart';
import 'package:beer_not_bear_flutter/theme/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.find();

    ProductController productController = Get.put(ProductController());
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        shadowColor: Colors.transparent,
        title: const Text("¡Estas son nuestras cervezas!"),
        titleTextStyle: TextStyle(color: Colors.black),
        centerTitle: true,
      ),
      drawer: Obx(
        () => Drawer(
          child: Column(
            children: [
              if (authController.firestoreUser.value != null)
                UserAccountsDrawerHeader(
                  decoration: BoxDecoration(
                    color: AppColors.orange,
                  ),
                  accountName:
                      (authController.firestoreUser.value!.name != null)
                          ? Text(
                              authController.firestoreUser.value!.name!,
                              style: textTheme.bodyText1,
                            )
                          : Container(),
                  accountEmail:
                      (authController.firestoreUser.value!.email != null)
                          ? Text(authController.firestoreUser.value!.email!)
                          : Container(),
                  currentAccountPicture:
                      (authController.firestoreUser.value!.photoUrl != null)
                          ? CircleAvatar(
                              child: ClipRRect(
                                child: Container(
                                  color: Colors.green,
                                  height: double.infinity,
                                  child: Image.network(
                                    authController
                                        .firestoreUser.value!.photoUrl!,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                borderRadius: BorderRadius.circular(50),
                              ),
                            )
                          : Container(),
                ),
              ListTile(
                trailing: Icon(Icons.favorite),
                title: Text(
                  "Destacado",
                  style: TextStyle(color: Colors.black),
                ),
                onTap: () async {
                  Get.back();

                  productController.getFavourites();

                  Get.to(() => FavouritePage());
                },
              ),
              ListTile(
                trailing: Icon(Icons.accessibility_new_sharp),
                title: Text(
                  "Perfil",
                  style: TextStyle(color: Colors.black),
                ),
                onTap: () {
                  Get.back();
                  Get.to(ProfilePage());
                },
              )
            ],
          ),
        ),
      ),
      body: APITest(),
    );

    // GetBuilder<BeerAPIController>(
    //   init: BeerAPIController(),
    //   builder: (beerAPIController) => Scaffold(
    //       body: Obx(() => Column(
    //             children: [
    //               Center(
    //                 child: Text(beerAPIController.beers[1].yeast),
    //               )
    //             ],
    //           ))),
    // );
  }
}
