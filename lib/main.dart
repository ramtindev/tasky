import 'package:flutter/material.dart';
import 'package:orgtaski/page.dart';


void main (){
  runApp(const Task());
}
class Task extends StatelessWidget {
  const Task({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Page(),
    );
  }
}
class Page extends StatelessWidget {
  const Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: GestureDetector(onTap: () =>
      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SecondPage()))
       ,
        child: Container(
          width: 120,
          height: 120,
          color: Colors.black,
          child:Center(child: Text('Enter',style: TextStyle(fontWeight: FontWeight.bold
          ,fontSize: 40,color: Colors.white
          ),)) ,
        ),
      ),),
    );
  }
}