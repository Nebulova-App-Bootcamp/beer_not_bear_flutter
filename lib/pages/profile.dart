import 'package:beer_not_bear_flutter/pages/login_register.dart';
import 'package:beer_not_bear_flutter/theme/color_theme.dart';
import 'package:beer_not_bear_flutter/theme/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 80, left: 40),
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
        Padding(
          padding: const EdgeInsets.only(top: 70.0, left: 80, right: 80),
          child: ClipRRect(
            child: Image.asset("assets/image/accountPicture.png"),
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 40.0),
            child: Text(
              "Jose Manuel Barba",
              style: textTheme.headline6,
            ),
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Text(
              "jose09511@gmail.com",
              style: textTheme.headline5,
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(left: 30, right: 30, top: 40),
          alignment: Alignment.bottomCenter,
          child: SizedBox(
            height: 50,
            width: double.infinity,
            child: TextButton(
              style: ButtonStyle(
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  backgroundColor:
                      MaterialStateProperty.all(const Color(0xFFFFB449))),
              child: const Text(
                "CERRAR SESION",
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              onPressed: () {
                Get.to(LoginRegister());
              },
            ),
          ),
        )
      ],
    ));
  }
}
