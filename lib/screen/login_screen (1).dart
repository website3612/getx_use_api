import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx_use_api/screen/home%20part/home_screen.dart';

// ignore: must_be_immutable
class LogInScreen extends StatelessWidget {
  LogInScreen({Key? key}) : super(key: key);
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passWordController = TextEditingController();

  final _key = GlobalKey<FormState>();
  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LogInScreen'),
      ),
      body: Form(
        key: _key,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'email',
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                ),
                controller: _emailController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'please enter the email';
                  } else {
                    return null;
                  }
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'password',
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                ),
                controller: _emailController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'please enter the email';
                  } else {
                    return null;
                  }
                },
              ),
              SizedBox(height: 40),
              MaterialButton(
                color: Colors.orange,
                minWidth: double.infinity,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                height: 50,
                onPressed: () {
                  if (_emailController.text == "admin@gmail.com" &&
                      _passWordController.text == "admin@123") {
                    box.write("isLogin", true);
                    Get.to(HomeScreen());
                  }
                },
                child: Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
