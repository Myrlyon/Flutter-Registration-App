import 'package:flutter/material.dart';
import 'package:flutter_register_new/app/mainPage.dart';
import 'package:flutter_register_new/app/widgets/textForm.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import './util/imagePicker.dart';
import './widgets/controller/controller.dart';

class registerPage extends StatefulWidget {
  const registerPage({super.key, required String title});

  @override
  State<registerPage> createState() => _registerPageState();
}

class _registerPageState extends State<registerPage> {
  Uint8List? _image;
  final RegisterController controller = Get.put(RegisterController());
  late TextEditingController fullnameController;
  late TextEditingController usernameController;
  late TextEditingController phoneController;
  late TextEditingController addressController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  bool _isObsecure = true;

  @override
  void initState() {
    super.initState();
    fullnameController = TextEditingController();
    usernameController = TextEditingController();
    phoneController = TextEditingController();
    addressController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  void _selectImage() async {
    Uint8List img = await pickImage(ImageSource.gallery);
    setState(() {
      _image = img;
    });
  }

  void signUpFunction(Uint8List? image) {
    if (fullnameController.text.isEmpty ||
        usernameController.text.isEmpty ||
        phoneController.text.isEmpty ||
        addressController.text.isEmpty ||
        emailController.text.isEmpty ||
        passwordController.text.isEmpty) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Warning"),
            content: Text("Please enter your data!"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("OK"),
              ),
            ],
          );
        },
      );
    } else {
      controller.updateUserProfile(
        fullnameController.text,
        usernameController.text,
        phoneController.text,
        addressController.text,
        emailController.text,
        passwordController.text,
        _image,
      );
      Get.to(() => mainPage(
            image: _image,
          ));
    }
  }

  void _toggleObsecure(bool isObsecure) {
    setState(() {
      _isObsecure = isObsecure;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(29, 53, 87, 1.000),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 50,
                ),
                const Row(
                  children: [
                    Icon(
                      Icons.sentiment_satisfied_alt_rounded,
                      size: 40,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Sign Up',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 2,
                ),
                const Text(
                  'Hello!!!',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
                const Text(
                  'Are you ready to get started?',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      color: Colors.white),
                ),
                const SizedBox(
                  height: 30,
                ),
                Center(
                  child: Stack(
                    children: [
                      Stack(
                        children: [
                          _image != null
                              ? CircleAvatar(
                                  backgroundColor: Colors.grey,
                                  radius: 64,
                                  backgroundImage: MemoryImage(_image!),
                                )
                              : CircleAvatar(
                                  backgroundColor: Colors.grey,
                                  radius: 64,
                                  backgroundImage: NetworkImage('_image'),
                                ),
                          Positioned(
                              child: IconButton(
                                onPressed: _selectImage,
                                icon: Icon(
                                  Icons.add_a_photo,
                                  size: 50,
                                  color: Colors.white,
                                ),
                              ),
                              bottom: 33,
                              left: 29),
                        ],
                      ),
                    ],
                  ),
                ),
                signUpForm("Fullname", "Joshua Lemon", false, false,
                    controller: fullnameController),
                signUpForm("Username", "iamsuperstar123", false, false,
                    controller: usernameController),
                signUpForm("Phone Number", "01xxxxxxxxxxx", false, false,
                    controller: phoneController),
                signUpForm(
                    "Address", "Black street, San Francisco", false, false,
                    controller: addressController),
                signUpForm("Email", "example@xample.com", false, true,
                    controller: emailController),
                TextFormField(
                  controller: passwordController,
                  style: const TextStyle(color: Colors.white),
                  cursorColor: Colors.white,
                  obscureText: _isObsecure, // Use the 'isObscure' variable here
                  decoration: InputDecoration(
                    hintText: "",
                    labelText: "Password",
                    labelStyle: const TextStyle(color: Colors.white),
                    hintStyle: const TextStyle(
                        color: Color.fromRGBO(121, 138, 153, 1.000)),
                    enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromRGBO(230, 57, 70, 1.000),
                        width: 1,
                      ),
                    ),
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          _isObsecure = !_isObsecure;
                        });
                      },
                      child: Icon(
                        // Show an eye icon to toggle password visibility
                        _isObsecure ? Icons.visibility_off : Icons.visibility,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Center(
                    child: ElevatedButton(
                  onPressed: () {
                    signUpFunction(_image);
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    backgroundColor: const Color.fromRGBO(230, 57, 70, 1.000),
                    minimumSize: const Size(double.infinity, 45),
                  ),
                  child: const Text(
                    "Sign Up",
                    style: TextStyle(color: Colors.white),
                  ),
                )),
                SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
