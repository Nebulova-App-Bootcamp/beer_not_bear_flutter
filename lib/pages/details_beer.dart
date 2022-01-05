import 'package:beer_not_bear_flutter/models/beer.dart';
import 'package:beer_not_bear_flutter/theme/color_theme.dart';
import 'package:beer_not_bear_flutter/theme/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailsBeer extends StatelessWidget {
  final Beer beer;
  DetailsBeer({Key? key, required this.beer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                padding: EdgeInsets.only(top: 40, left: 40),
                child: Container(
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
