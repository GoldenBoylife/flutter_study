import 'package:d4_get_x_app/src/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Next Page"),
        ),
        body: Center(
          child:
            Column(
              mainAxisAlignment: MainAxisAlignment.center, 
                children: [
                  //#받기1: 문자
                  // Text("${Get.arguments}"), //이렇게 하면 home에서 전달해준 arguments를 받는다.
                  //#받기2: 숫자
                  //  Text("${Get.arguments.toString()}"), 
                  //#받기3: Map
                  // Text("${Get.arguments['name']} : ${Get.arguments['age']}"),
                  //#받기4: class 저장된 것
                  Text("${Get.parameters['uid']}"),
                  //28357이 출력된다
                  Text("${Get.parameters['name']}님 안뇽하세요"),
                  Text("${Get.parameters['age']}님 안뇽하세요"),
                  TextButton(
                    child: Text("뒤로  이동"),
                      onPressed: () {
                        Get.back();
                      }),

        ])));
  }
}
