// ignore_for_file: prefer_const_literals_to_create_immutables, sized_box_for_whitespace, unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx_use_api/controllers/home_controller.dart';
import 'package:getx_use_api/screen/home%20part/personal_screen.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('HomeScreen'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                box.write("isLogin", false);
                Get.back();
              },
              icon: Icon(Icons.logout))
        ],
      ),
      body: GetBuilder<HomeScreenController>(
        init: HomeScreenController(),
        builder: (HomeScreenController controller) {
          if (controller.loader) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Container(
              height: screenSize.height,
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: controller.products.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(10),
                    child: GestureDetector(
                      onTap: () {
                        Get.to(
                          PersonalScreen(
                            name: controller.products[index].name,
                            brand: controller.products[index].brand,
                            price: controller.products[index].price,
                            currency: controller.products[index].currency,
                            // rating: controller.products[index].rating,
                            description: controller.products[index].description,
                            category: controller.products[index].category,
                            product_type:
                                controller.products[index].productType,
                            imageLink: controller.products[index].imageLink,
                            product_link:
                                controller.products[index].productLink,
                          ),
                        );
                      },
                      child: Container(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        blurRadius: 10,
                                        color: Colors.grey,
                                        offset: Offset(0, 2),
                                        spreadRadius: 1)
                                  ],
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                        "${controller.products[index].imageLink}"),
                                  ),
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                height: screenSize.height / 1,
                                width: screenSize.width / 4.4,
                              ),
                              SizedBox(
                                width: screenSize.width / 20,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    controller.products[index].name,
                                    style: TextStyle(
                                        fontSize: screenSize.width / 23,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: screenSize.height / 250,
                                  ),
                                  Text(
                                    "${controller.products[index].brand}",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  SizedBox(
                                    height: screenSize.height / 100,
                                  ),
                                  Text(
                                    controller.products[index].price,
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                            border: Border.all(
                                color: Colors.grey.shade500, width: 2)),
                        height: screenSize.height / 7,
                        width: screenSize.width,
                      ),
                    ),
                  );
                },
              ),
            );
          }
        },
      ),
    );
  }
}
