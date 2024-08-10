import 'package:flutter/material.dart';

class AddBottomSheet extends StatelessWidget {
  final Function addTaskCallback;
  AddBottomSheet(this.addTaskCallback);

  String? newTaskTitle;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding:EdgeInsets.symmetric(horizontal: 40,vertical: 20),
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          topLeft:  Radius.circular(20),
        )
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Center(
            child: Text('Add Task',
            style: TextStyle(
             color: Color(0xFFC2A9CF),
             fontSize: 25,
              fontWeight: FontWeight.w500
             ),
            ),
          ),
          TextField(
         autofocus: true,
            textAlign: TextAlign.center,
            onChanged: (value){
               newTaskTitle=value;
            },
          ),
          SizedBox(
            height: 20,
          ),
          TextButton(
              onPressed: (){
                addTaskCallback(newTaskTitle);
              },
              child: Text('ADD',
                style:TextStyle(color: Colors.white),),
            style: TextButton.styleFrom(
              backgroundColor: Color(0xFFC2A9CF),
              shape: LinearBorder.bottom()
            )
          )
        ],
      ),
    );
  }
}