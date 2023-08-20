import 'package:d4_get_x_app/src/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'first.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Second Page"),
        ),
        body: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          TextButton(
              child: Text("뒤로  이동"),
              onPressed: () {
                Get.back();
              }),
          TextButton(
              child: Text("홈 페이지 이동"),
              onPressed: () {
                Get.to(Home());
              })
        ])));
  }
}
