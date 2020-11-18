import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final String taskTitle;
  final Function toggleCheckBox;
  final Function deleteTask;
  TaskTile(
      {this.isChecked, this.taskTitle, this.toggleCheckBox, this.deleteTask});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        "$taskTitle",
        style: TextStyle(
          decoration:
              isChecked ? TextDecoration.lineThrough : TextDecoration.none,
        ),
      ),
      trailing: Checkbox(
        activeColor: Colors.purpleAccent,
        value: isChecked,
        onChanged: toggleCheckBox,
      ),
      onLongPress: deleteTask,
    );
  }
}
