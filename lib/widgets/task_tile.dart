import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  bool isChecked;
  String taskTitle;
  Function(bool?) checkBoxCallback;


  TaskTile({required this.taskTitle, required this.isChecked,required this.checkBoxCallback});

  @override
  Widget build(BuildContext context) {
  return  ListTile(
    title: Text('$taskTitle',
      style: TextStyle(fontStyle: FontStyle.italic,
      decoration: isChecked?TextDecoration.lineThrough: null
      ),),
    trailing: Checkbox(
       value: isChecked,
       activeColor: Color(0xFFC2A9CF),
       onChanged: checkBoxCallback,
    ) ,
  );
}
}
