import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:speed_up_flutter/speed_up_flutter.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

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
        child: Column(
          children: [
            20.h,
            const Align(
              alignment: Alignment.center,
              child: Text(
                'A timeline of all modern history',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            20.h,
            Container(
              width: 325.0,
              height: 60.0,
              decoration: BoxDecoration(
                color: HexColor('000F2B'),
                borderRadius: BorderRadius.circular(35.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.search,
                    size: 28,
                    color: HexColor('#797979'),
                  ),
                  20.w,
                  Text('Israeli-Palestinian conflict',
                      style: TextStyle(
                        color: HexColor('#797979'),
                        fontSize: 18,
                      ))
                ],
              ),
            ),
            40.h,
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Popular searches',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            20.h,
            Container(
              width: 320,
              height: 45.0,
              decoration: BoxDecoration(
                color: HexColor('000F2B'),
                borderRadius: BorderRadius.circular(35.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.search,
                    size: 28,
                    color: HexColor('#797979'),
                  ),
                  20.w,
                  Text('Israeli-Palestinian conflict',
                      style: TextStyle(
                        color: HexColor('#797979'),
                        fontSize: 16,
                      ))
                ],
              ),
            ),
            20.h,
            Container(
              width: 320,
              height: 45.0,
              decoration: BoxDecoration(
                color: HexColor('000F2B'),
                borderRadius: BorderRadius.circular(35.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.search,
                    size: 28,
                    color: HexColor('#797979'),
                  ),
                  20.w,
                  Text('Israeli-Palestinian conflict',
                      style: TextStyle(
                        color: HexColor('#797979'),
                        fontSize: 16,
                      ))
                ],
              ),
            ),
            20.h,
            Container(
              width: 320,
              height: 45.0,
              decoration: BoxDecoration(
                color: HexColor('000F2B'),
                borderRadius: BorderRadius.circular(35.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.search,
                    size: 28,
                    color: HexColor('#797979'),
                  ),
                  20.w,
                  Text('Israeli-Palestinian conflict',
                      style: TextStyle(
                        color: HexColor('#797979'),
                        fontSize: 16,
                      ))
                ],
              ),
            ),
            20.h,
          ],
        ),
      ),
    );
  }
}
