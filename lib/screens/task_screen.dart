import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/widgets/bottom_sheet.dart';
import 'package:todo_app/widgets/task_list.dart';
import 'package:todo_app/models/task.dart';

class TaskScreen extends StatefulWidget {
  @override
  State<TaskScreen> createState() => _TaskScreenState();
}
class _TaskScreenState extends State<TaskScreen> {
  List<Task> tasks= [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFC2A9CF),
     floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFFC2A9CF),
        shape: CircleBorder(),
        child: Icon(Icons.add,color: Colors.white,),
        onPressed: (){
       showModalBottomSheet(
           context: context,
           builder: (BuildContext context) =>
               AddBottomSheet((newTask){
                 setState(() {
                   tasks.add(Task(newTask));
                 });
                 Navigator.pop(context);
               }));
       },
     ),
     body: Column(
       children: [
         Container(
           padding: EdgeInsets.only(top: 70,left: 20,right: 30, bottom: 30),
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
              CircleAvatar(
                backgroundColor: Colors.white,
                  radius: 30,
                  child: Icon(
                    Icons.list,
                    size: 40,
                  color: Color(0xFFC2A9CF),)
               ),
               SizedBox(
                 height: 8,
               ),
               Text('Todays Task',
                 style: TextStyle(
                   color: Colors.white,
                   fontSize: 50,
                   fontWeight: FontWeight.w600
                 ),
               ),
               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   Text(
                     '${tasks.length} Tasks',
                     style: TextStyle(
                       color: Colors.white,
                       fontSize: 20
                     ),
                   ),
                   TextButton(
                     child: Text("Clear All",
                       style: TextStyle(
                           color: Colors.white,
                           fontSize: 20
                       ),
                     ),
                     onPressed: (){
                       setState(() {
                         tasks= [];
                       });
                     },
                   )
                 ],
               ),
             ],
           ),
         ),
             Expanded(
               child: Container(
                 padding: EdgeInsets.symmetric(horizontal: 20),
                 decoration: BoxDecoration(
                     color: Colors.grey.shade300,
                     borderRadius: BorderRadius.only(
                         topLeft: Radius.circular(20),
                         topRight: Radius.circular(20))
                 ),
                 child: TaskList(tasks)
                 ),
               ),
       ],
     ), 
    );
  }
}


