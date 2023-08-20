import 'package:d4_get_x_app/src/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'first.dart';

class SecondNamedPage extends StatelessWidget {
  const SecondNamedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Second Named Page"),
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
                //#방식1: GetX
                // Get.to(Home());
                //#방식2: GetX off All, 이전 페이지 기록 모두 지우고 이동
                Get.offAllNamed("/");
              })
        ])));
  }
}
