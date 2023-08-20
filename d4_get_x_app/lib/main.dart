import 'package:d4_get_x_app/src/home.dart';
import 'package:d4_get_x_app/src/pages/named/first.dart';
import 'package:d4_get_x_app/src/pages/named/second.dart';
import 'package:d4_get_x_app/src/pages/next.dart';
import 'package:d4_get_x_app/src/pages/user.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(  //Get추가해야 밑에서 getPages:[]쓸수 있다.
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: const Home(), //route써야하면 이 줄 빼야함
      //#방식1 : 기존
      // initialRoute: "/",
      // routes: {
      //   "/" : (context) => Home(),
      //   "/first" : (context) => FirstNamedPage(),
      //   "/second" : (context) => SecondNamedPage(),
      // },
      //#방식2: getX Named
      initialRoute: "/",
      getPages: [
        GetPage(name: "/", page: () => Home(),transition: Transition.zoom),
        GetPage(name: "/first", page: () =>FirstNamedPage(),transition: Transition.zoom),
        GetPage(name: "/second", page: ()=>SecondNamedPage(),transition: Transition.zoom),
        GetPage(name: "/next", page: ()=>NextPage(),transition: Transition.zoom),
        GetPage(name: "/user/:uid", page: ()=>UserPage(),transition: Transition.zoom)
        //user의 회원아이디를 다음 페이지에 준다든지 그런식일 때
      ],
      
    );
  }
}
