import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
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
      home:const Test(),
    );
  }
}

class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  void initState() {
    super.initState();
    initialization();
  }

  void initialization() async {
    //TODO: If we wanna reload data before finish Splash
    FlutterNativeSplash.remove();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title:const Text(
          'Home Screen'
        ),
      ) ,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.red,
        child: Image.asset('assets/images/kemet.png'),
      ),
    );
  }
}

