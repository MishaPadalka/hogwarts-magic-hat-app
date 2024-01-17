import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hogwarts_magic_hat_app/presentation/screens/splash_screen/splash_screen_cubit/splash_screen_cubit.dart';
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
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Center(
          child: BlocConsumer<SplashScreenCubit, SplashScreenState>(listener: (context, state) {
            if (state is SplashScreenLoaded) {
              router.pushReplacementNamed(RoutePath.home);
            }
            // TODO: implement listener
          }, builder: (context, state) {
            if (state is SplashScreenLoading) {
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                width: double.infinity,
                height: 104,
                child: SvgPicture.asset(
                  AppImages.logo,
                  colorFilter: const ColorFilter.mode(Colors.black, BlendMode.srcIn),
                ),
              );
            }
            if (state is SplashScreenError) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(state.errorMessage),
                  ElevatedButton(
                      onPressed: () async {
                        await context.read<SplashScreenCubit>().getCharacters();
                      },
                      child: const Text('Try again'))
                ],
              );
            }
            return Container();
          }),
        ),
      ),
    );
  }
}
