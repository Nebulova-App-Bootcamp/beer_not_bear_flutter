import 'package:beer_not_bear_flutter/controller/auth_controller.dart';
import 'package:beer_not_bear_flutter/pages/edit_profile.dart';

import 'package:beer_not_bear_flutter/theme/color_theme.dart';
import 'package:beer_not_bear_flutter/theme/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.find();
    return Scaffold(
      body: Obx(
        () => Column(
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
            if (authController.firestoreUser.value!.photoUrl != null)
              Padding(
                padding: const EdgeInsets.only(top: 70.0, left: 80, right: 80),
                child: ClipRRect(
                  child: Container(
                    color: Colors.green,
                    height: 200,
                    width: 400,
                    child: Image.network(
                      authController.firestoreUser.value!.photoUrl!,
                      fit: BoxFit.fill,
                    ),
                  ),
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
            if (authController.firestoreUser.value!.name != null)
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 40.0),
                  child: Text(
                    authController.firestoreUser.value!.name!,
                    style: textTheme.headline6,
                  ),
                ),
              ),
            if (authController.firestoreUser.value!.email != null)
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Text(
                    authController.firestoreUser.value!.email!,
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
                          MaterialStateProperty.all(Colors.blue[200])),
                  child: const Text(
                    "EDITAR PERFIL",
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  onPressed: () async {
                    Get.to(EditProfile());
                  },
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
                  onPressed: () async {
                    await authController.signOut();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
