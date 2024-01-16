import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hogwarts_magic_hat_app/presentation/shared/colors.dart';
import 'package:hogwarts_magic_hat_app/presentation/shared/images.dart';
import 'package:hogwarts_magic_hat_app/tools/router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 1),
    ).then(
      (value) => router.pushReplacementNamed(RoutePath.home),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Center(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            width: double.infinity,
            height: 104,
            child: SvgPicture.asset(
              AppImages.logo,
              colorFilter: const ColorFilter.mode(Colors.black, BlendMode.srcIn),
            ),
          ),
        ),
      ),
    );
  }
}
