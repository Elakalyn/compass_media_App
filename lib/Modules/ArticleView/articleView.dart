// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:speed_up_flutter/speed_up_flutter.dart';

import '../../Shared/Components/components.dart';

class ArticleViewScreen extends StatelessWidget {
  const ArticleViewScreen(
      {super.key,
      required this.name,
      required this.image,
      required this.content});
  final name;
  final image;
  final content;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        centerTitle: true,
        title: SafeArea(
          child: Image.asset(
            'assets/images/app_Icon.png',
            width: 65,
            height: 65,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Stack(
          children: [
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  20.h,
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      name,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 33.5,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  20.h,
                  Container(
                    width: 320.0,
                    height: 190,
                    decoration: BoxDecoration(
                      color: HexColor('000F2B'),
                      borderRadius: BorderRadius.circular(35.0),
                    ),
                    child: Stack(children: [
                      ClipRRect(
                          borderRadius: BorderRadius.circular(25),
                          child: Image.network(image, fit: BoxFit.fill)),
                      Align(
                        alignment: Alignment.topRight,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            children: [
                              CircleAvatar(
                                  maxRadius: 15,
                                  backgroundColor: HexColor('#0F1D37'),
                                  child: Image.asset(
                                      'assets/images/politics.png')),
                              10.h,
                              const CircleAvatar(
                                  maxRadius: 15,
                                  backgroundImage: AssetImage(
                                    'assets/sources/BBC.png',
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ]),
                  ),
                  20.h,
                  Container(
                    width: 320.0,
                    height: 50,
                    decoration: BoxDecoration(
                      color: HexColor('000F2B'),
                      borderRadius: BorderRadius.circular(35.0),
                    ),
                  ),
                  40.h,
                  Headline(content: content),
                  40.h,
                  Headline(content: content),
                  40.h,
                  Headline(content: content),
                  40.h,
                  Headline(content: content),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: InkWell(
                onTap: () {
                  showModalBottomSheet(
                      backgroundColor: HexColor('#0F1D37'),
                      context: context,
                      isScrollControlled: true,
                      isDismissible: true,
                      builder: (BuildContext context) {
                        return SizedBox(
                          height: 350,
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(20.0),
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Row(
                                      children: [
                                        Text('Comments',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontWeight: FontWeight.w600,
                                            )),
                                        10.w,
                                        Text('6',
                                            style: TextStyle(
                                              color: HexColor('#898989'),
                                              fontSize: 18,
                                              fontWeight: FontWeight.w800,
                                            )),
                                      ],
                                    ),
                                  ),
                                ),
                                Comment(),
                                Comment(),
                                Comment(),
                                Comment(),
                                Comment(),
                                Comment(),
                              ],
                            ),
                          ),
                        );
                      });
                },
                child: Container(
                  width: 320,
                  height: 105,
                  decoration: BoxDecoration(
                    color: HexColor('132649'),
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: [
                      BoxShadow(
                        color: HexColor('#000000'),
                        blurRadius: 4,
                        offset: const Offset(0, 4),
                        spreadRadius: 0,
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(11),
                    child: Stack(
                      children: [
                        const Align(
                          alignment: Alignment.topLeft,
                          child: Text('Comments',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              )),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Row(
                            children: [
                              const profileWidget(),
                              20.w,
                              const Text('Comment Text',
                                  style: TextStyle(
                                    fontSize: 14,
                                  )),
                            ],
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Align(
                              alignment: Alignment.bottomRight,
                              child: Icon(
                                Icons.keyboard_arrow_down,
                                color: Colors.white,
                              )),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Comment extends StatelessWidget {
  const Comment({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          const profileWidget(),
          20.w,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text('@Username',
                      style:
                          TextStyle(fontSize: 14, color: HexColor('#898989'))),
                  20.w,
                  Text('On: 10/10/2023',
                      style:
                          TextStyle(fontSize: 12, color: HexColor('#898989'))),
                ],
              ),
              4.h,
              const Align(
                alignment: Alignment.centerLeft,
                child: Text('Comment Text',
                    style: TextStyle(
                      fontSize: 18,
                    )),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Headline extends StatelessWidget {
  const Headline({
    super.key,
    required this.content,
  });
  final content;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          content,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.normal,
          ),
        ),
      ],
    );
  }
}
