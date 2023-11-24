import 'package:flutter/material.dart';
import 'package:routing_app/onboarding_page.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    _navigatetoOnBoarding();
  }

 _navigatetoOnBoarding()async{
  await Future.delayed(const Duration(milliseconds: 1500), (){});
  // ignore: use_build_context_synchronously
  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const OnBoardingPage()));
 }

  @override 
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: const Color(0xFFED9728),
      body: Center(
        child: 
        Image.asset('assets/images/logo.png')
        ),
      );
      
    
  }
}
