import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterflu/quiz/constraints.dart';

class Qhome extends StatefulWidget{
  const Qhome ({Key? key}) : super(key: key);

  @override
  State<Qhome> createState() => _QhomeState();
}

class _QhomeState extends State<Qhome> {
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(title: Text("TAKE A QUIZ"),
     backgroundColor: background,),
   );
  }
}