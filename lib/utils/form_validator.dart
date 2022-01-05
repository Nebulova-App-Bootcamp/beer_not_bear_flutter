import 'package:beer_not_bear_flutter/lang/string_keys.dart';
import 'package:get/get.dart';

class FormValidator {
  String? isValidEmail(String? text) {
    return (text ?? "").isEmail ? null : SK.not_valid_email;
  }

  String? isValidName(String? text) {
    if (text == null || text.isEmpty) {
      return SK.name_cannto_be_empyt;
    }
    return null;
  }

  String? isValidPass(String? text) {
    if (text == null || text.length < 6) {
      return SK.pass_too_short;
    }
    return null;
  }
}
