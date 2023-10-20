import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:speed_up_flutter/speed_up_flutter.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              40.h,
              Container(
                width: 320.0,
                height: 120.0,
                decoration: BoxDecoration(
                  color: HexColor('0F1D37'),
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
                child: Row(
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(25),
                        child: Image.asset('assets/images/profile.png')),
                    20.w,
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 20.0),
                      child: Column(
                        children: [
                          Text('Username',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              )),
                          Text('Created: 9/10/23',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                              )),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: IconButton(
                          icon: const Icon(Icons.edit, color: Colors.white),
                          onPressed: () {},
                        ),
                      ),
                    )
                  ],
                ),
              ),
              40.h,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      child: const Center(
                        child: Text(
                          'Topics',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      child: Center(
                        child: Text(
                          'Sources',
                          style: TextStyle(
                            color: HexColor('#898989'),
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              40.h,
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Selected Topics',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              20.h,
              Wrap(
                spacing: 16,
                runSpacing: 20,
                children: [
                  Container(
                      width: 152.0,
                      height: 197.0,
                      decoration: BoxDecoration(
                        color: HexColor('132649'),
                        borderRadius: BorderRadius.circular(25.0),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0x3F000000),
                            blurRadius: 4,
                            offset: Offset(0, 4),
                            spreadRadius: 0,
                          )
                        ],
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Image.asset('assets/sources/BBC.png'),
                          ),
                          const Text(
                            'BBC',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const Spacer(),
                        ],
                      )),
                  Container(
                      width: 152.0,
                      height: 197.0,
                      decoration: BoxDecoration(
                        color: HexColor('132649'),
                        borderRadius: BorderRadius.circular(25.0),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0x3F000000),
                            blurRadius: 4,
                            offset: Offset(0, 4),
                            spreadRadius: 0,
                          )
                        ],
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Image.asset('assets/sources/foxNews.png'),
                          ),
                          const Text(
                            'Fox News',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const Spacer(),
                        ],
                      )),
                  Container(
                      width: 152.0,
                      height: 197.0,
                      decoration: BoxDecoration(
                        color: HexColor('132649'),
                        borderRadius: BorderRadius.circular(25.0),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0x3F000000),
                            blurRadius: 4,
                            offset: Offset(0, 4),
                            spreadRadius: 0,
                          )
                        ],
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Image.asset('assets/sources/CNN.png'),
                          ),
                          const Text(
                            'CNN',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const Spacer(),
                        ],
                      )),
                  Container(
                      width: 152.0,
                      height: 197.0,
                      decoration: BoxDecoration(
                        color: HexColor('132649'),
                        borderRadius: BorderRadius.circular(25.0),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0x3F000000),
                            blurRadius: 4,
                            offset: Offset(0, 4),
                            spreadRadius: 0,
                          )
                        ],
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Image.asset('assets/sources/Reuters.png'),
                          ),
                          const Text(
                            'Reuters',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const Spacer(),
                        ],
                      )),
                ],
              ),
              40.h,
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Other Topics',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              20.h,
              Wrap(
                spacing: 16,
                runSpacing: 20,
                children: [
                  Container(
                      width: 152.0,
                      height: 197.0,
                      decoration: BoxDecoration(
                        color: HexColor('132649'),
                        borderRadius: BorderRadius.circular(25.0),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0x3F000000),
                            blurRadius: 4,
                            offset: Offset(0, 4),
                            spreadRadius: 0,
                          )
                        ],
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Image.asset('assets/sources/NYTimes.png'),
                          ),
                          const Text(
                            'NY Times',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const Spacer(),
                        ],
                      )),
                  Container(
                      width: 152.0,
                      height: 197.0,
                      decoration: BoxDecoration(
                        color: HexColor('132649'),
                        borderRadius: BorderRadius.circular(25.0),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0x3F000000),
                            blurRadius: 4,
                            offset: Offset(0, 4),
                            spreadRadius: 0,
                          )
                        ],
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Image.asset('assets/sources/GoogleNews.png'),
                          ),
                          const Text(
                            'Google News',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const Spacer(),
                        ],
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
