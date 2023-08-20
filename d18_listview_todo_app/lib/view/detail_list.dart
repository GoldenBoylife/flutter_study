import 'package:d18_listview_todo_app/model/message.dart';
import 'package:flutter/material.dart';


class DetailList extends StatefulWidget {
  const DetailList({super.key});

  @override
  State<DetailList> createState() => _DetailListState();
}

class _DetailListState extends State<DetailList> {
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail View"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
           children: [ 
            Text(Message.workList),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Image.asset(Message.imagePath),
            )
           ]
          //
        )

      )
    );
  }
}