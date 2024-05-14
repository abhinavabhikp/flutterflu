import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterflu/quiz/HOME.dart';

void main(){
  runApp( Qmain());
}
class Qmain extends StatelessWidget{
  const Qmain ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,

      home: Qhome(),
    );
  }

}