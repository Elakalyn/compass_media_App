import 'package:compass_app/Modules/Profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:speed_up_flutter/speed_up_flutter.dart';

import '../../Shared/Components/components.dart';

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
          physics: const BouncingScrollPhysics(),
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
                  profileWidget()
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
              const NewsCard(),
            ],
          ),
        ),
      ),
    );
  }
}

