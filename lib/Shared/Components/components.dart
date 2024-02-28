import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:speed_up_flutter/speed_up_flutter.dart';

import '../../Modules/ArticleView/articleView.dart';
import '../../Modules/Profile/profile.dart';

class subTopicCard extends StatelessWidget {
  const subTopicCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 145,
      height: 320,
      decoration: BoxDecoration(
        color: HexColor('132649'),
        borderRadius: BorderRadius.circular(25.0),
        boxShadow: const [
          BoxShadow(
            color: Color(0x3F000000),
            blurRadius: 8,
            offset: Offset(0, 4),
            spreadRadius: 0,
          ),
          BoxShadow(
            color: Color(0x3F000000),
            blurRadius: 8,
            offset: Offset(0, 4),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: Image.network(
                'https://img-s-msn-com.akamaized.net/tenant/amp/entityid/AA1hUBhf.img?w=549&h=309&m=6',
                height: 320,
                fit: BoxFit.fill),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  CircleAvatar(
                      maxRadius: 15,
                      backgroundColor: HexColor('#0F1D37'),
                      child: Image.asset('assets/images/politics.png')),
                ],
              ),
            ),
          ),
          const Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                'Polish Elections',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Image.asset('assets/images/vignette.png',
                  height: 106, fit: BoxFit.fill),
            ),
          ),
        ],
      ),
    );
  }
}

class NewsCard2 extends StatelessWidget {
  const NewsCard2({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        navigateTo(context, ArticleViewScreen());
      },
      child: Container(
        width: 320.0,
        height: 180.0,
        decoration: BoxDecoration(
          color: HexColor('132649'),
          borderRadius: BorderRadius.circular(25.0),
          boxShadow: const [
            BoxShadow(
              color: Color(0x3F000000),
              blurRadius: 8,
              offset: Offset(0, 4),
              spreadRadius: 0,
            ),
            BoxShadow(
              color: Color(0x3F000000),
              blurRadius: 8,
              offset: Offset(0, 4),
              spreadRadius: 0,
            ),
          ],
        ),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Image.network(
                  'https://img-s-msn-com.akamaized.net/tenant/amp/entityid/AA1hUBhf.img?w=549&h=309&m=6'),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    CircleAvatar(
                        maxRadius: 15,
                        backgroundColor: HexColor('#0F1D37'),
                        child: Image.asset('assets/images/politics.png')),
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
            const Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  'Israel army on southern\nterritory near Gaza',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: Image.asset('assets/images/vignette.png'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget NewsCard(context) => GestureDetector(
      onTap: () {
        navigateTo(context, ArticleViewScreen());
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
              offset: Offset(10, 10),
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
                  child: Image.network(
                      'https://img-s-msn-com.akamaized.net/tenant/amp/entityid/AA1hUBhf.img?w=549&h=309&m=6'),
                ),
              ),
              12.h,
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
                            child:
                                Image.asset('assets/images/politicsIcon.png')),
                      ),
                      8.w,
                      Text(
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
              8.h,
              Text(
                'Israeli army on southern territory near Gaza',
                style: TextStyle(
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
        navigateTo(context, ProfileScreen());
      },
      child: CircleAvatar(
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
