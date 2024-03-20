// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:speed_up_flutter/speed_up_flutter.dart';

import '../../Modules/ArticleView/articleView.dart';
import '../../Modules/Profile/profile.dart';
import '../Models/ArticleModel/articleModel.dart';

class GlobalCard extends StatelessWidget {
  const GlobalCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
       // navigateTo(context, const ArticleViewScreen());
      },
      child: Container(
        width: 320.0,
        height: 430.0,
        decoration: BoxDecoration(
          color: HexColor('0F1D37'),
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
              blurRadius: 50,
              offset: const Offset(10, 10),
              color: HexColor('06142E'),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 244,
                width: 300,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: Image.network(
                      'https://img-s-msn-com.akamaized.net/tenant/amp/entityid/AA1hUBhf.img?w=549&h=309&m=6',
                      fit: BoxFit.fill),
                ),
              ),
              12.h,
              Row(
                children: [
                  Container(
                    width: 80,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 25,
                            height: 25,
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(25),
                                child: Image.asset('assets/sources/BBC.png')),
                          ),
                          8.w,
                          const Text(
                            'BBC',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  8.w,
                  Container(
                    width: 110,
                    decoration: BoxDecoration(
                      color: HexColor('0040B8'),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 25,
                            height: 25,
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(25),
                                child: Image.asset(
                                    'assets/images/politicsIcon.png')),
                          ),
                          8.w,
                          const Text(
                            'POLITICS',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              12.h,
              Row(
                children: [
                  Container(
                    width: 4,
                    height: 89,
                    decoration: BoxDecoration(
                        color: HexColor('5A94FF'),
                        borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(25),
                            topRight: Radius.circular(25))),
                  ),
                  8.w,
                  Expanded(
                    child: Column(
                      children: [
                        const Text('Israel declares war on Hamas',
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            )),
                        8.h,
                        Text(
                            'After the attacks that occurred on the 7th of October last week, Bibi\'s cabinet has issued a declaration of war to ensure',
                            overflow: TextOverflow.ellipsis,
                            maxLines: 3,
                            style: TextStyle(
                              fontSize: 16,
                              color: HexColor('BEBEBE'),
                            )),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget? NewsCard(Articles article, BuildContext context) {
  if (article.urlToImage != null)
    return GestureDetector(
      onTap: () {
        navigateTo(context, ArticleViewScreen(image: article.urlToImage,name: article.title,content: article.content,));
      },
      child: Container(
        width: 320.0,
        height: 322.0,
        decoration: BoxDecoration(
          color: HexColor('0F1D37'),
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
              blurRadius: 50,
              offset: const Offset(10, 10),
              color: HexColor('06142E'),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 171,
                width: 300,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: Image.network(article.urlToImage!, fit: BoxFit.fill),
                ),
              ),
              12.h,
              Row(
                children: [
                  Container(
                    width: 80,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 25,
                            height: 25,
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(25),
                                child: Image.asset('assets/sources/BBC.png')),
                          ),
                          8.w,
                          const Text(
                            'BBC',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  8.w,
                  Container(
                    width: 110,
                    decoration: BoxDecoration(
                      color: HexColor('0040B8'),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 25,
                            height: 25,
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(25),
                                child: Image.asset(
                                    'assets/images/politicsIcon.png')),
                          ),
                          8.w,
                          const Text(
                            'POLITICS',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              8.h,
              Text(
                article.title!,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );

  if (article.urlToImage == null) return null;
 
}

Future<void> navigateToAndFinish(context, widget) async =>
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => widget),
      (route) => false,
    );

Future<void> navigateTo(context, widget) async => Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => widget),
    );

class profileWidget extends StatelessWidget {
  const profileWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        navigateToAndFinish(context, const ProfileScreen());
      },
      child: const CircleAvatar(
        maxRadius: 20,
        backgroundImage: AssetImage('assets/images/profile.png'),
      ),
    );
  }
}

class Logo extends StatelessWidget {
  const Logo({
    super.key,
    this.size,
  });
  final size;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/app_Icon.png',
      width: size,
      height: size,
    );
  }
}
