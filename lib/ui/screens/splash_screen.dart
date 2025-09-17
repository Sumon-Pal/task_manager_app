import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task_manager/ui/asset_path.dart';
import 'package:task_manager/ui/screens/on_boarding_screen.dart';

class SplashScreen extends StatelessWidget {
  static const String name = "/";
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
            child: GestureDetector(
              onTap:(){
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const OnBoardingScreen()),
                );
              },
                child: SvgPicture.asset(AssetPath.splashScreen))),
      ),
    );
  }
}
