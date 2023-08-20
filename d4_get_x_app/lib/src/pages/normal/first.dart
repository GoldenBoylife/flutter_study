import 'package:d4_get_x_app/src/pages/normal/second.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("First Page"),
        
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              child: Text ("다음페이지 이동"),
              onPressed:() {
                //#방식1: getX 
                // Get.to(SecondPage());
                //#방식2: get X named
                Get.toNamed("/second");

              }
            )
          ]
        )
      )

    );
  }
} 