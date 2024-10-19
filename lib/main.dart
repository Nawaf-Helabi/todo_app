// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:todo_app/widgets/counter.dart';
import 'package:todo_app/widgets/todo_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(useMaterial3: true),
      home: TodoApp(),
    );
  }
}

class TodoApp extends StatefulWidget {
  const TodoApp({super.key});

  @override
  State<TodoApp> createState() => _TodoAppState();
}
//كلاس لمحتوى الداخل في التاسكات
class Task {
  String? title;
  bool? status;
  Task({required this.title, required this.status});
}

class _TodoAppState extends State<TodoApp> {
  //لست من المهام
  List allTask = [
    Task(title: 'pray', status:false),
    Task(title: 'study', status: false),
    Task(title: 'GEM', status: false),
    Task(title: 'sleep well', status: true),
  ];
  //يقوم بحذف جميع التاسكس
  deleteAll( ){
    setState(() {
      allTask.removeRange(0,allTask.length);
    });

  }
  //يقوم بحذف تاسك واحده
  delete(int removeOne){
    setState(() {
      allTask.remove(allTask[removeOne]);
    });
  }
  //يقوم بتغيير الحاله من true to false 
  changeStatus(int taskIndex){
    setState(() {
      allTask[taskIndex].status=!allTask[taskIndex].status;
    });

  }
  //يقوم باضافه تاسك جديده
  myfunc() {
    setState(() {
      allTask.add(Task(title: mycntroller.text, status: false));
    });
  }
  //متغير لالتقاط التكست من textfild
  final mycntroller = TextEditingController();
  //يقوم المهام التي تم انجازها على شكل رقم 
  int calculatecounter() {
    int counter = 0;

    for (var item in allTask) {
      if(item.status==true){
        counter++;
      }
    }
    return counter;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///////////////////// floatingActionButton////////////////////////////
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return Dialog(
                  child: Container(
                      padding: EdgeInsets.all(22),
                      height: 200,
                      width: 200,
                      child: Column(
                        children: [
                          TextField(
                            controller: mycntroller,
                            maxLength: 20,
                            decoration: InputDecoration(hintText: 'Add Task'),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextButton(
                              onPressed: () {
                                
                                  myfunc();
                                
                                Navigator.pop(context);
                              },
                              child: Text('ADD')),
                        ],
                      )),
                );
              });
        },
        child: Icon(Icons.add),
      ),
      backgroundColor: Color.fromRGBO(56, 66, 68, 0.7),
      // /////////////////////////////////apppar////////////////////////////////
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(56, 66, 68, 1),
        elevation: 0,
        title: Text(
          'TO DO APP',
          style: TextStyle(
              fontSize: 33, color: Colors.white, fontWeight: FontWeight.bold),
              
        ),
        actions: [IconButton(onPressed: (){deleteAll();}, icon: Icon(Icons.delete_forever,size: 39,color: Colors.red[300],))],
      ),
      ////////////////////////////////body///////////////////////////////
      body: Container(
        width: double.infinity,
        child: Column(
          children: [
            //    /// counter /// ///          ///    //   
             Counter(
              firstNum: calculatecounter(),
              lastNum: allTask.length,
             ),Container(height: 550,
             child: ListView.builder(
               itemCount: allTask.length,
               itemBuilder: (BuildContext context, int index) {
                //   ///    todocard     ///     ///     ///    
                 return  Todocard(
                  //هده الكود يكون عندما تكون ودجت في صفحه لوحدها يقوم بتمريرها عن طريق هدي الاكواد
                  vartitle: allTask[index].title,
                  donORnot: allTask[index].status,
                  myfun:changeStatus,
                  iii: index,
                  delete:delete,
                  
                  
                );
               },
             ),),
             
            // ...allTask.map((item) => Todocard(
            //       vartitle: item.title,
            //       donORnot: item.status,
            //     ))
          ],
        ),
      ),
    );
  }
}
