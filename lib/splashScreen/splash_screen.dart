import 'dart:async';

import 'package:flutter/material.dart';


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
    Timer(Duration(seconds: 3), () async {
      //send user to home screen
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
