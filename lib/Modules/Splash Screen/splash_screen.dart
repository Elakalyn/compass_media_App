import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Image.asset('assets/images/app_Logo.jfif')),
      backgroundColor: HexColor('#0F1D37'),
    );
  }
}
