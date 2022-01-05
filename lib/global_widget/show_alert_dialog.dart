import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showAlertDialog(context, String title, String content) {
  // Get.defaultDialog(
  //     title: title,
  //     middleText: content,
  //     backgroundColor: Colors.black.withOpacity(0.5),
  //     titleStyle: TextStyle(color: Colors.white),
  //     middleTextStyle: TextStyle(color: Colors.white),
  //     textConfirm: "OK",
  //     confirmTextColor: Colors.white,
  //     buttonColor: Colors.black,
  //     onConfirm: () {
  //       Get.back();
  //     });
  showDialog(
      context: context,
      builder: (_) => AlertDialog(
            title: Text(
              title,
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.black.withOpacity(0.5),
            content: Container(
              child: Text(content, style: TextStyle(color: Colors.white)),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(_);
                },
                child: Text('OK', style: TextStyle(color: Colors.white)),
              ),
            ],
          ));
}
