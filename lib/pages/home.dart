// import 'package:appbeer/controller/beer_api_controller.dart';
// import 'package:get/get_state_manager/get_state_manager.dart';

import 'package:beer_not_bear_flutter/controller/api_controller.dart';
import 'package:beer_not_bear_flutter/pages/api_test.dart';
import 'package:beer_not_bear_flutter/pages/details_beer.dart';
import 'package:beer_not_bear_flutter/pages/profile.dart';
import 'package:beer_not_bear_flutter/theme/color_theme.dart';
import 'package:beer_not_bear_flutter/theme/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        shadowColor: Colors.transparent,
        title: const Text("¡Estas son nuestras cervezas!"),
        titleTextStyle: TextStyle(color: Colors.black),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  color: AppColors.orange,
                ),
                accountName: Text(
                  "Jose Manuel Barba",
                  style: textTheme.bodyText1,
                ),
                accountEmail: Text("jose09511@gmail.com"),
                currentAccountPicture: CircleAvatar(
                  child: ClipRRect(
                    child: Image.asset("assets/image/accountPicture.png"),
                    borderRadius: BorderRadius.circular(50),
                  ),
                )),
            ListTile(
              trailing: Icon(Icons.favorite),
              title: Text(
                "Destacado",
                style: TextStyle(color: Colors.black),
              ),
              onTap: () {
                JsonController jsonController = Get.find<JsonController>();
                Get.back();
                Get.to(() => DetailsBeer(
                      beer: jsonController.beer[0],
                    ));
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
