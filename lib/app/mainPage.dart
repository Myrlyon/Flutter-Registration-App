import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './widgets/controller/controller.dart';
import './widgets/textForm.dart';

class mainPage extends StatelessWidget {
  final RegisterController controller = Get.find();
  final Uint8List? image;

  mainPage({required this.image});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(29, 53, 87, 1.000),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: const Color.fromRGBO(29, 53, 87, 1.000),
        title: Text(
          "Profile",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            children: [
              Text("Profile",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
              SizedBox(height: 30),
              image != null
                  ? CircleAvatar(
                      radius: 64,
                      backgroundImage: MemoryImage(image!),
                    )
                  : CircleAvatar(
                      radius: 64,
                      backgroundColor: Colors.grey,
                    ),
              SizedBox(height: 15),
              buildInfoBox("Name : ", controller.fullname.value),
              buildInfoBox("Username : ", controller.username.value),
              buildInfoBox("Phone : ", controller.phone.value),
              buildInfoBox("Address : ", controller.address.value),
              buildInfoBox("Email : ", controller.email.value),
              buildInfoBox("Password : ", controller.password.value),
            ],
          ),
        ),
      ),
    );
  }
}
