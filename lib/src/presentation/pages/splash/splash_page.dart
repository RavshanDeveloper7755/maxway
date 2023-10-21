import 'package:flutter/material.dart';
import 'package:maxway/src/core/utils/app_colors.dart';

import '../../../core/utils/app_images.dart';
import 'splash_languages.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (_) => const SplashLanguage(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.defaultPurple,
      body: Center(
        child: Image.asset(AppImages.maxwayLogo),
      ),
    );
  }
}
