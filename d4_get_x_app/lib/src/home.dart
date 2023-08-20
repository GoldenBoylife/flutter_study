import 'package:d4_get_x_app/src/pages/named/first.dart';
import 'package:d4_get_x_app/src/pages/normal/first.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'pages/normal/second.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("라우트 관리 홈"),
        ),
        body: Center(
          child:
            Column(mainAxisAlignment: MainAxisAlignment.center, 
              children: [
                TextButton(
                  child: Text("일반 라우트(다음 페이지)"),
                  onPressed: () {
                    /*기존 방식 */
                    // Navigator.of(context)
                    //     .push(MaterialPageRoute(
                    //       builder: (_) => FirstPage()
                    //     )
                    // );
                    /*getX방식 */
                    Get.to(FirstPage());
            },
          ),
          TextButton(
            child: Text("Named 라우트(다음 페이지)"),
            onPressed: () {
              //# 방식1: 기존 Named방식
              // Navigator.of(context).pushNamed("/first");
              //# 방식2: getX Named방식
              Get.toNamed("/first");
            },
          ),
          TextButton(
            child: Text("Arguments 전달(다음페이지))"),
            onPressed: () {
              //# 방식1: 기존 Named방식
              // Navigator.of(context).pushNamed("/first");
              //# 방식2: getX Named방식
              //  #보내기1: 문자
              //  Get.toNamed("/next",arguments: "후동");
              //  #보내기2: 숫자 
              //  Get.toNamed("/next",arguments: 3);
              //  #보내기3: Map
              // Get.toNamed("/next",arguments:{"name":"후동", "age": "22"} );
              //  #보내기4: class 저장된것
              Get.toNamed("/next", arguments: User(
                name: "후동이", age :11 ,
              ));
            },
          ),
          TextButton(
            child: Text("동적 url 전달(다음페이지))"),
            onPressed: () {
              //# 보내기5 : parameter보내기
              Get.toNamed("/user/28357?name=후동3&age=111");
            },
          ),

        ])));
  }

}//End

/*class 저장한 것 arguments로 보내기 */
class User{
  String name;
  int age;
  User({required this.name,required this.age});
  }
