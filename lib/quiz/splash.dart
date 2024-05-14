import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterflu/store.dart';
import 'package:lottie/lottie.dart';
void main (){
  runApp(MaterialApp(home: Qsplash(),debugShowCheckedModeBanner: false,));
}
class Qsplash extends StatefulWidget{
  @override
  State<Qsplash> createState() => _QsplashState();
}

class _QsplashState extends State<Qsplash> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    });
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: Lottie.asset("asset/animation/Animation.json"),
      ),

    );

  }
}