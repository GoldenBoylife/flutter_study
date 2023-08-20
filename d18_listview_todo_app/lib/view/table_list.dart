import 'package:d18_listview_todo_app/model/message.dart';
import 'package:d18_listview_todo_app/model/todo_list.dart';
import 'package:d18_listview_todo_app/view/detail_list.dart';
import 'package:flutter/material.dart';

class TableList extends StatefulWidget {
  const TableList({super.key});

  @override
  State<TableList> createState() => _TableListState();
}

class _TableListState extends State<TableList> {

  /*Property */
  late List<TodoList> todoList;   //struct TodoList를 넣기 위해서 
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    todoList = [];
    addData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: const Text("Main View"),
      actions: [
        IconButton(
          /*onPressed는 dart 언어라서 ;로 끝남 */
          onPressed: () {
            Navigator.pushNamed(
              context, "/insert",
            ).then((value) => rebuildData());
            //add창 갔다 왔으면 직접 rebuildData만들어서 화면에 찍어준다.
          },
          icon: const Icon(
            Icons.add_outlined
          ),
        )
      ]
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: ListView.builder(  //build가 카드 모양대로 화면을 만들어줌.
            itemCount: todoList.length,
            //갯수 정보
            itemBuilder: (context, index){
            //index는 우리가 만든 것이 아니라 builder가 카드를 순서대로 index붙인다.
            //Tree구조와 index번호 순서대로 화면 구성한다. 
            //
              return SizedBox(
                height: 100,
                child: GestureDetector(
                  //GestureDetector하면 카드마다 클릭 인식함
                  //각각 하나씩  누른 것의 인덱스 내용을 넘겨준다
                  onTap: () {
                    Message.workList = todoList[index].workList;
                    //클릭 시에 워크리스트의 내용이 Message클래스 쪽으로 넘어감. 
                    Message.imagePath = todoList[index].imagePath;
                    Navigator.push(
                      context,//20줄 위쪽에 있는 context이다. 
                      //두번째 화면에서 뒤로가면, 첫번째 화면 나와야 한ㄴ데, 
                      //첫번째 화면을 알아야 하니까 context가 필요하다. 
                      MaterialPageRoute(builder:(context) => const DetailList() ),
                      //화면을 만들어서(builder) 띄운다.
                    );
                  },
                
                child: Card(
                  color: index % 2 == 0 ?  Colors.amber : Colors.green,
                  child: Row(
                    children: [
                      Image.asset(
                        todoList[index].imagePath,
                        width: 100,
                        height: 100,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Text(
                        todoList[index].workList
                      ),
                    ]
                    
                  )
                ),
                ),
              );    //Card 뒤에 ();다.
            }
          )
        ),
      )
    );

  }


  /*Functions */
  addData() 
  {
    todoList.add(TodoList(imagePath: "images/cart.png", workList: "책구매"));
    todoList.add(TodoList(imagePath: "images/clock.png", workList: "철수와 약속"));
    todoList.add(TodoList(imagePath: "images/pencil.png", workList: "스터디 준비하기"));
    todoList.add(TodoList(imagePath: "images/ing-a.png", workList: "잉어킹과 놀기"));
    todoList.add(TodoList(imagePath: "images/pantum.png", workList: "팬텀과 애나벨과 놀기"));
    todoList.add(TodoList(imagePath: "images/loopi.png", workList: "승원 컷"));
    todoList.add(TodoList(imagePath: "images/newjs.png", workList: "뉴진스와 놀기"));
  }

/*add창에서 얻은 데이터를 추가시킴 */
  rebuildData() 
  {
    if(Message.action == true){
      todoList.add(TodoList(imagePath: Message.imagePath, workList : Message.workList));
      //여기에서 Messge내용이 ToDoList로 추가됨. 
      
      /*아래 setState없으면 Main View에서 추가안됨. */
      Message.action = false;
    }
      setState(() {
        
      });
    
  }
}//ENd