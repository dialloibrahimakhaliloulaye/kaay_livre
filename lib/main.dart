import 'dart:js';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:kaay_livre/firebase_options.dart';
import 'package:kaay_livre/infoHandler/app_info.dart';
import 'package:kaay_livre/splashScreen/splash_screen.dart';
import 'package:provider/provider.dart';

void main() async
{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );


  runApp(
    MyApp(
      child: ChangeNotifierProvider(
        create: (context) => AppInfo(),
        child: MaterialApp(
          title: 'kaay_livre',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const MySplashScreen(),
          debugShowCheckedModeBanner: false,
        ),
      ),
    )
  );
}



class MyApp extends StatefulWidget
{
  final Widget? child;

  MyApp({this.child});

  static void restarApp(BuildContext context)
  {
    context.findAncestorStateOfType<_MyAppState>()!.restarApp();
  }

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp>
{
  Key key = UniqueKey();
  void restarApp()
  {
    setState(() {
      key = UniqueKey();
    });
  }
  @override
  Widget build(BuildContext context) {
    return KeyedSubtree(
      key: key,
      child: widget.child!,
    );
  }
}
