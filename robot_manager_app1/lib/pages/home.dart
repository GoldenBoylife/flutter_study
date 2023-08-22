import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  /*Property */
  late List<int> todoList;
  late bool swapMapStatus;
  late String mapPath;

  late TextEditingController idController;
  late TextEditingController speedController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    swapMapStatus =true;
    todoList= [];
    mapPath = "";

    idController = TextEditingController();
    speedController = TextEditingController();
    addData();  
    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "robot Manage Board"
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          children: [
            
            //# 컬럼1: GetList, ViewList
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(onPressed: () {

                  }, 
                    child: Text("Get List", style:TextStyle(fontSize: 50)),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),

                      ),
                      backgroundColor: Color.fromARGB(255, 0, 0, 127),
                      foregroundColor: Colors.white
                    )

                  ),
                Container(
                  color: Colors.blue,
                  width: 200,     //이걸로 Row의 width범위를 정할 수 있다.
                  height: 650,
                  child: ListView.builder(
                    itemCount : todoList.length,//몇개인지 알려줘야함.
                    itemBuilder : ((context, index)  {
                      return Card(
                        //Card 안쓰면 구분 힘듬, Card쓰면 각자 색도 넣을 수 있음
                        color: Colors.amberAccent,
                        child: SizedBox(
                          height: 30,
                          child: Center(
                            child: Text(
                              "${todoList[index].toString()} 번 robot",
                              style: const TextStyle(
                                fontSize:15
                              )
                              )
                          )
                        )
                      );

                    })
                  )
      
                    
                  ),
              ]
                ),
          

            
            SizedBox(width: 25), //중앙 선
            //#컬럼2: information
            Column(
              children: [
                Container(
                  color: Colors.grey,
                  width: 300,     //이걸로 Row의 width범위를 정할 수 있다.
      
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(    //여기만 바꿈
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            
                            Text("selected robot : ", style: TextStyle(fontSize: 25)),
                            SizedBox(width: 10,),
                            Text("Box ", style: TextStyle(fontSize: 25)),
                          ]
                        ),
                        Row(    //여기만 바꿈
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            
                            Text("robot id : ", style: TextStyle(fontSize: 25)),
                            ElevatedButton(onPressed: () {
                            }, 
                            child: Text("-----"))
                            // TextField(
                            //   controller: idController,
                            //   decoration: const InputDecoration(
                            //     labelText: "id입력"
                            //   ),
                            //   keyboardType: TextInputType.number,
                              
                            // )
                          ]
                        ),
                        SizedBox(height:10,),
                        Row(    //여기만 바꿈
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                  
                            
                            Text("current pose : ", style: TextStyle(fontSize: 25)),
                            ElevatedButton(onPressed: () {
                            }, 
                            child: Text("-----"))
                          ]
                        ),
                        SizedBox(height:10,),                    
                        Row(    //여기만 바꿈
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            
                            Text("current Dest : ", style: TextStyle(fontSize: 25)),
                            ElevatedButton(onPressed: () {
                            }, 
                             child: Text("-----"))
                          ]
                        ),
                  
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                Container(
                  color: Colors.green,
                  width: 300,     //이걸로 Row의 width범위를 정할 수 있다.
      
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(    //여기만 바꿈
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            
                            Text("selected robot : ", style: TextStyle(fontSize: 25)),
                            SizedBox(width: 10,),
                            Text("Box ", style: TextStyle(fontSize: 25)),
                          ]
                        ),
                   
                        Row(    //여기만 바꿈
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            
                            Text("robot id : ", style: TextStyle(fontSize: 25)),
                            ElevatedButton(onPressed: () {
                            }, 
                            child: Text("-----"))
                          ]
                        ),
                        SizedBox(height:10,),
                        Row(    //여기만 바꿈
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                  
                            
                            Text("current pose : ", style: TextStyle(fontSize: 25)),
                            ElevatedButton(onPressed: () {
                            }, 
                            child: Text("-----"))
                          ]
                        ),
                        SizedBox(height:10,),                    
                        Row(    //여기만 바꿈
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            
                            Text("current Dest : ", style: TextStyle(fontSize: 25)),
                            ElevatedButton(onPressed: () {
                            }, 
                            child: Text("-----"))
                          ]
                        ),
                  
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 50,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Status Mode"),
                    Switch(
                      value: swapMapStatus,
                      onChanged:(value) {
                          swapMapStatus =value;
                          print("$value");
                            swapMode(value);

                      }
                    ),
                    const Text("Map Mode")
                  ],),


                ElevatedButton(onPressed: () {

                  }, 
                    child: Text("Show Cam", style:TextStyle(fontSize: 50)),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),

                      ),
                      backgroundColor: Color.fromARGB(255, 0, 0, 127),
                      foregroundColor: Colors.white
                    )

                  ),
              ],
            ),
            SizedBox(width: 50), //중앙 선 

            //#컬럼3: map
            Container(
              color: Colors.amber,
              width: 650,     //이걸로 Row의 width범위를 정할 수 있다.
              height:800,
              child: Row(    //여기만 바꿈
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Text("robot id : ", style: TextStyle(fontSize: 25)),
              
                  Image.asset(mapPath,

                  
                    height:650,
                    width: 650,)
      

                ]
              ),
              
            ),
            
          ],
        ),
      )
      );

  
  }

  /*Functions */
  addData() {
    for(int i =0 ;i < 100 ; i++) {
      todoList.add(i);
    }
  }

  swapMode(bool value) {
    
    if(value==true) {
      mapPath = "lib/images/map1.png";
      
    }else{
      mapPath = "lib/images/map2.png";
    }
    setState(() {

    });
    //if true -> map모드
    //else  -> status모드
  }
}//End