import 'package:flutter/material.dart';
import 'package:kemet/core/strings.dart';
import 'package:kemet/core/themes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false ,
      title: AppStrings.appName,
      theme: appLightTheme(),
      darkTheme:appDarkTheme(),
      //TODO:Handle the start point
      home: null,
    );
  }
}
