import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kaay_livre/authentification/login_screen.dart';
import 'package:kaay_livre/authentification/signup_screen.dart';
import 'package:kaay_livre/mainScreen/main_screen.dart';


class MySplashScreen extends StatefulWidget
{
  const MySplashScreen({Key? key}) : super(key: key);

  @override
  State<MySplashScreen> createState() => _MySplashScreenState();
}



class _MySplashScreenState extends State<MySplashScreen>
{

  starTimer()
  {
    Timer(const Duration(seconds: 5), () async
    {
      Navigator.push(context, MaterialPageRoute(builder: (c)=> LoginScreen()));
    });
  }

  @override
  void initState() {
    super.initState();

    starTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: Colors.black,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Image.asset("images/logo1.png"),

              const SizedBox(height: 10,),

              const Text(
                "Bienvénue sur Kaay Livré",
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.bold
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
