// ignore_for_file: prefer_const_literals_to_create_immutables, avoid_print

import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_use_api/controllers/home_controller.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

import 'home_screen.dart';

class PersonalScreen extends StatefulWidget {
  final String imageLink;
  final String name;
  final String brand;
  final String price;
  final String currency;
  final String description;
  // final String rating;
  final String category;
  // ignore: non_constant_identifier_names
  final String product_link;
  // ignore: non_constant_identifier_names
  final String product_type;
  const PersonalScreen(
      {Key? key,
      required this.imageLink,
      required this.name,
      required this.brand,
      // ignore: non_constant_identifier_names
      required this.price,
      required this.currency,
      required this.description,
      // required this.rating,
      required this.category,
      // ignore: non_constant_identifier_names
      required this.product_type,
      // ignore: non_constant_identifier_names
      required this.product_link})
      : super(key: key);

  @override
  _PersonalScreenState createState() => _PersonalScreenState();
}

class _PersonalScreenState extends State<PersonalScreen> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: GetBuilder<HomeScreenController>(
        init: HomeScreenController(),
        builder: (HomeScreenController controller) {
          if (controller.loader) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: screenSize.height / 50,
                        ),
                        IconButton(
                          onPressed: () {
                            Get.to(HomeScreen());
                          },
                          icon: Icon(
                            Icons.arrow_back,
                            size: 40,
                          ),
                        ),
                      ],
                    ),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.fitWidth,
                        image: NetworkImage(widget.imageLink),
                      ),
                    ),
                    width: screenSize.width,
                    height: screenSize.height / 2.5,
                  ),
                  SizedBox(
                    height: screenSize.height / 100,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              // ignore: unnecessary_string_interpolations
                              "${widget.name}",
                              style: TextStyle(
                                  fontSize: screenSize.width / 17,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                            Spacer(),
                            Icon(
                              Icons.collections_bookmark_outlined,
                              size: 30,
                            ),
                            SizedBox(
                              width: screenSize.width / 20,
                            ),
                            IconButton(
                              onPressed: () {
                                print("button");
                                Share.share(
                                    "http://localhost:61750/#/PersonalScreen");
                              },
                              icon: Icon(Icons.share),
                            ),
                            SizedBox(
                              width: screenSize.width / 30,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "#",
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                            Text(widget.brand),
                          ],
                        ),
                        SizedBox(
                          height: screenSize.height / 100,
                        ),
                        Row(
                          children: [
                            Container(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    "4.1",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 17),
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Colors.white,
                                    size: 18,
                                  )
                                ],
                              ),
                              width: screenSize.width / 8,
                              height: screenSize.height / 25,
                              decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(8)),
                            ),
                            SizedBox(
                              width: screenSize.width / 50,
                            ),
                            Text(
                              "19,415 ratings",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 20),
                            )
                          ],
                        ),
                        SizedBox(
                          height: screenSize.height / 70,
                        ),
                        Container(
                          child: Center(
                            child: Text(
                              "price",
                              style:
                                  TextStyle(color: Colors.green, fontSize: 22),
                            ),
                          ),
                          width: screenSize.width / 6,
                          height: screenSize.height / 25,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.green.shade100),
                        ),
                        SizedBox(
                          height: screenSize.height / 60,
                        ),
                        Row(
                          children: [
                            Text(
                              "\$",
                              style: TextStyle(fontSize: 35),
                            ),
                            Text(
                              widget.price,
                              style: TextStyle(fontSize: 35),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: screenSize.height / 60,
                        ),
                        Text(
                          widget.description,
                          style: TextStyle(color: Colors.grey, fontSize: 20),
                        ),
                        SizedBox(
                          height: screenSize.height / 60,
                        ),
                        Text(
                          "Web Link",
                          style: TextStyle(fontSize: 30),
                        ),
                        SizedBox(
                          height: screenSize.height / 60,
                        ),
                        GestureDetector(
                          onTap: () {
                            print("button");
                          },
                          // onTap: () async {
                          //   await launch(
                          //       controller.products[index].productLink);
                          // },
                          child: Text(
                            widget.product_link,
                            style: TextStyle(fontSize: 20, color: Colors.grey),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
