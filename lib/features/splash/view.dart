import 'package:final_project/core/resources/cache_helper.dart';
import 'package:final_project/features/home_nav/view.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../features/auth/login/view.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3), () async{
      String token = await CacheHelper.getToken();
      print("token = $token");
      if (token != "") {
        Navigator.of(
          context,
        ).pushReplacement(MaterialPageRoute(builder: (context) => HomeNav()));
      }
      else {
        Navigator.of(
          context,
        ).pushReplacement(MaterialPageRoute(builder: (context) => Login()));
      }

    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(child: Lottie.asset("assets/json/Shopping bag.json")),
    );
  }
}
