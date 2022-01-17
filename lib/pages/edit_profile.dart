import 'dart:io';

import 'package:beer_not_bear_flutter/controller/auth_controller.dart';
import 'package:beer_not_bear_flutter/models/user_model.dart';
import 'package:beer_not_bear_flutter/services/firestore/firestore_service_users.dart';
import 'package:beer_not_bear_flutter/theme/color_theme.dart';
import 'package:beer_not_bear_flutter/theme/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class EditProfile extends StatelessWidget {
  final AuthController authController = Get.find();
  final picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
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
                    "EDITAR FOTO",
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  onPressed: () async {
                    _showPicker(context);
                  },
                ),
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
          ],
        ),
      ),
    );
  }

  Future _imgFromCamera(BuildContext context) async {
    XFile? image =
        await picker.pickImage(source: ImageSource.camera, imageQuality: 50);

    print(image!.path);

    _uploadFile(context, File(image.path));
  }

  Future _imgFromGallery(BuildContext context) async {
    XFile? image =
        await picker.pickImage(source: ImageSource.gallery, imageQuality: 50);

    print(image!.path);
  }

  void _showPicker(context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return SafeArea(
            child: Container(
          child: Wrap(
            children: [
              ListTile(
                leading: Icon(Icons.photo_library),
                title: Text("Acceder a la galeria"),
                onTap: () {
                  _imgFromGallery(context);
                  Get.back();
                },
              ),
              ListTile(
                leading: Icon(Icons.photo_camera),
                title: Text("Acceder a la cámara"),
                onTap: () {
                  _imgFromCamera(context);
                  Get.back();
                },
              ),
            ],
          ),
        ));
      },
    );
  }

  Future _uploadFile(BuildContext context, File imageProfile) async {
    firebase_storage.Reference storageReference = firebase_storage
        .FirebaseStorage.instance
        .ref()
        .child('imagesProfile/${authController.firestoreUser.value!.uid}');

    print(storageReference);

    firebase_storage.UploadTask uploadTask =
        storageReference.putFile(imageProfile);

    print(uploadTask);

    await uploadTask.whenComplete(() {
      storageReference.getDownloadURL().then((url) {
        UserModel _updatedUser = UserModel(
          uid: authController.firestoreUser.value!.uid,
          email: authController.firestoreUser.value!.email,
          name: authController.firestoreUser.value!.name,
          photoUrl: url,
        );
        authController.updateUser(context, _updatedUser);
      });
    });
  }
}
