import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController passConfirmController = TextEditingController();

  RxBool checkboxValue = false.obs;
  RxBool obscurePassConfirmation = true.obs;
  RxBool obscureTextPass = true.obs;
}
