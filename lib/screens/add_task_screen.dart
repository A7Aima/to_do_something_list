import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_something_list/constants.dart';
import 'package:to_do_something_list/models/task_data.dart';

class AddTaskScreen extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    String newTaskTitle;

    return Container(
      color: Color(0xFF757575),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            topLeft: Radius.circular(20),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Add Task',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.purpleAccent,
                fontSize: 25,
              ),
            ),
            TextField(
              controller: _controller,
              autofocus: true,
              maxLines: 2,
              cursorColor: Colors.purpleAccent,
              decoration: kTextFieldInputDecoration,
              onChanged: (newValue) {
                newTaskTitle = newValue;
              },
            ),
            SizedBox(height: 20),
            FlatButton(
              onPressed: () {
                if (newTaskTitle != null) {
                  Provider.of<TaskData>(context, listen: false)
                      .addTask(newTaskTitle);
                  _controller.clear();
                  Navigator.pop(context);
                }
              },
              color: Colors.purpleAccent,
              child: Text(
                "Add",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
