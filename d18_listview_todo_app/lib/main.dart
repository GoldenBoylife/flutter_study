import 'package:flutter/material.dart';
import 'view/table_list.dart';
import 'view/insert_list.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/', 
      routes: {
        '/':(context) => const TableList(),
        '/insert' : (context) => const InsertList(),
      }
    );
  }
}

