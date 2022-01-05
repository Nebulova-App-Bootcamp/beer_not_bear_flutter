import 'package:beer_not_bear_flutter/pages/details_beer.dart';
import 'package:flutter/material.dart';
import 'package:beer_not_bear_flutter/controller/api_controller.dart';
import 'package:get/get.dart';

class APITest extends StatelessWidget {
  const APITest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<JsonController>(
        init: JsonController(),
        builder: (jsonController) => Scaffold(
              body: Obx(() => ListView.builder(
                    shrinkWrap: true,
                    itemCount: jsonController.beer.length,
                    itemBuilder: (context, index) {
                      return Column(children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(left: 30, right: 30),
                          child: ListTile(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            onTap: () {
                              Get.to(() => DetailsBeer(
                                  beer: jsonController.beer[index]));
                            },
                            leading: Container(
                                child: ClipRRect(
                              child: SizedBox(
                                child: Image.network(
                                  jsonController.beer[index].image_url!,
                                  fit: BoxFit.fitHeight,
                                ),
                              ),
                            )),
                            title: Text(jsonController.beer[index].name!),
                            subtitle: Text(jsonController.beer[index].tagline!),
                          ),
                        )
                      ]);
                    },
                  )),
            ));
  }
}
