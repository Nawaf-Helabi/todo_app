import 'package:flutter/material.dart';
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

class _TodoAppState extends State<TodoApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(56, 66, 68, 0.7),
      appBar: AppBar(backgroundColor: Color.fromRGBO(56,66,68,1),
      elevation: 0,

        title: Text('TO DO APP',style: TextStyle(fontSize: 33,color: Colors.white,fontWeight: FontWeight.bold),),
      ),
      body: Container(width: double.infinity,
        child: Column(children: [
          FractionallySizedBox(widthFactor: 0.9,
            child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(11),
            color: Color.fromRGBO(209, 224, 224, 0.2)),
              margin: EdgeInsets.only(top: 33),
            padding: EdgeInsets.all(22),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children:[
              
              Text('data',style: TextStyle(color: Colors.white,fontSize: 22),),
              Icon(Icons.close,size: 27,color: Colors.red,)
                ]),),
          ),
          
           
           
           
           


          

      
        
        ],),
      ),
    );
  }
}