import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar("Hello world"),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 40,left: 20, right: 20),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: const Color(0xff1D1617).withOpacity(0.11),
                  blurRadius: 40,
                  spreadRadius: 0.0
                )
              ]
            ),
            child: TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.all(10),
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: SvgPicture.asset('assets/icons/Search.svg'),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none
                )
              ),
            ),
          )
        ],
      ),
    );
  }
}

AppBar appBar(String title){
  return AppBar(
    title:  Text(title,
      style: const TextStyle(
          color: Colors.red,
          fontSize: 24,
          fontWeight: FontWeight.bold
      ),
    ),
    backgroundColor: Colors.black,
    elevation: 0.0,
    centerTitle: true,
    leading: Container(
      margin: const EdgeInsets.all(10),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(10)
      ) ,
      child: SvgPicture.asset('assets/icons/Arrow - Left 2.svg'),
    ),
    actions: [
      Container(
          margin: const EdgeInsets.all(10),
          child: const Icon(
            Icons.accessibility,
            color: Colors.red,
            size: 29,
          )
      )
    ],
  );
}