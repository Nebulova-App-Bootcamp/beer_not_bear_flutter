import 'dart:convert';

import 'package:beer_not_bear_flutter/models/beer.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProductController extends GetxController {
  RxBool isFavourite = false.obs;

  final favouritesBeersString = <String>[].obs;

  final favouritesBeers = <Beer>[].obs;

  Future<void> getFavourites() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    final _response = prefs.getStringList("favouritesBeers");

    final List<dynamic> _mapResponse = jsonDecode(_response.toString());

    print(_mapResponse);

    final List<Beer> _listResponse =
        _mapResponse.map((e) => Beer.fromJson(e)).toList();

    print(_listResponse);

    favouritesBeers.value = _listResponse;

    print(favouritesBeers);
  }
}
