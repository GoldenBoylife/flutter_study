import 'package:flutter/material.dart';

import '../model/message.dart';

class InsertList extends StatefulWidget {
  const InsertList({super.key});

  @override
  State<InsertList> createState() => _InsertListState();
}

class _InsertListState extends State<InsertList> {


  /*property */
  late TextEditingController addController;
  late bool buySwitch;
  late bool commitSwitch;
  late bool studySwitch;
  late String picture;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    addController = TextEditingController();
    /*첫화면에서 스위치 상태 */
    buySwitch = true;
    commitSwitch = false;
    studySwitch = false;
    //picture = "images/cart.png";
    Message.imagePath = "images/cart.png";
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar : AppBar(
        title: const Text("Add View"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("구매"),
                  Switch(
                    value: buySwitch,
                    onChanged: (value) {
                      checkSwitch("buy",value);
                    },
                  ),
                  Image.asset("images/cart.png",
                    height: 100,
                    width: 100,),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("약속"),
                  Switch(
                    value: commitSwitch,
                    onChanged: (value) {
                      checkSwitch("commit",value);
                    },
                  ),
                  Image.asset("images/clock.png",
                    height: 100,
                    width: 100,),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("스터디"),
                  Switch(
                    value: studySwitch,
                    onChanged: (value) {
                      checkSwitch("study",value);
                    },
                  ),
                  Image.asset("images/pencil.png",
                    height: 100,
                    width: 100,),
                ],
              ),
                                          
              TextField(
                controller : addController,
                decoration: const InputDecoration(
                  // labelText: "목록을 입력하세요." //입력하려 하면  글자 위로 올라감.
                  hintText: "목록을 입력하세요." //입력하려 하면 글자 사라짐
                ),
                keyboardType:  TextInputType.text,
              ),
              Padding(
              //패딩으로 해야 디바이스 바뀌어도 잘 적용된다. 반면 sizedbox는 문제가 생긴다. 
                padding: const EdgeInsets.all(20.0),
                child: ElevatedButton(
                  onPressed:() => addAction(),
                  child: const Text("OK"),
                ),
              )
            ]
          )
        ),
      )
    );
  }

  /*Functions */
 addAction() 
 {
  //isEmpty하면else에서만 쓰게 되니까 새로 나오게 된 isNotEmpty
  if(addController.text.trim().isNotEmpty){
    addList();
    //데이터 있음 -> add-> pop
  }

  Navigator.pop(context);
  //데이터 없음 -> pop(이래야 댓글 덜 달림림)

 }
 /*여기에서 Message를 최신화함, 다만 vector처럼 추가로 넣는 건 아니군. */
  addList() 
  {
    // Message.imagePath  = picture;
    Message.workList = addController.text;
    Message.action = true;
    //새로 등록한 것이라는 것을 표시함. 
  }


 checkSwitch(String name, bool value)
 {
    /*3개값 확인-> 변화시킴
      만약 3개 다  false이면 , 구매를 true로
       */
  switch(name) {
    case "buy" :
      buySwitch = value;
      if (value == true){
        commitSwitch = false;
        studySwitch = false;
        // picture = "images/cart.png";
        Message.imagePath = "images/cart.png";
      }
      setState(() {          
      });
    case "commit" : 
      commitSwitch = value;
      if (value == true){
        buySwitch = false;
        studySwitch = false;
        // picture = "images/clock.png";
        Message.imagePath = "images/clock.png";
      }
      setState(() {
      
      });
    case "study" : 
      studySwitch = value;
      if (value == true){
        buySwitch = false;
        commitSwitch = false;
        // picture = "images/pencil.png";
        Message.imagePath = "images/pencil.png";
      }
      setState(() {
        
      });
      }
  switchNonCheck();    
  }
 switchNonCheck() 
 {
    if( buySwitch ==false && commitSwitch==false && studySwitch == false)
    {
      buySwitch= true;
      Message.imagePath = "images/cart.png";
    }
 }
 

}//End