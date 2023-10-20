import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:speed_up_flutter/speed_up_flutter.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              20.h,
              const Row(
                children: [
                  Text(
                    'Your Feed',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 33,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                   Spacer(),
                  CircleAvatar(maxRadius: 20,backgroundImage: AssetImage('assets/images/profile.png'),)
                
                ],
              ),
              20.h,
              const Text(
                'Curated specifically for you',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              ),
              40.h,
              Container(
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
                                child:
                                    Image.asset('assets/images/politics.png')),
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
