import 'package:final_project/features/login/login.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState(){
    Future.delayed(
      Duration(seconds: 2), () => Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => Login(),),));

    }
  @override

  Widget build(BuildContext context) {
    return Scaffold(

      body:Center(

        child: Lottie.asset("assets/jason/Shopping bag.json") ,




      ),






    );
  }
}
