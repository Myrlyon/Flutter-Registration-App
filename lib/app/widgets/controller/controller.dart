import 'dart:typed_data';

import 'package:get/get.dart';

class RegisterController extends GetxController {
  final resultData = RxString("initial");
  final RxString fullname = RxString("");
  final RxString username = RxString("");
  final RxString phone = RxString("");
  final RxString address = RxString("");
  final RxString email = RxString("");
  final RxString password = RxString("");

  void resultRegister(
    String fullname,
    String username,
    String email,
    String phone,
    String address,
    String password,
    // String imagePath,
  ) {
    resultData.value = "Registration successful";
    print("U'r Profile Page " + resultData.value.toString());
  }

  void updateUserProfile(
    String fullname,
    String username,
    String email,
    String phone,
    String address,
    String password,
    Uint8List? image,
  ) {
    this.username.value = username;
    this.fullname.value = fullname;
    this.email.value = email;
    this.phone.value = phone;
    this.address.value = address;
    this.password.value = password;
  }
}
