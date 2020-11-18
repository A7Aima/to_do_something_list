import 'package:flutter/material.dart';
import 'package:to_do_something_list/widgets/task_tile.dart';
import 'package:provider/provider.dart';
import 'package:to_do_something_list/models/task_data.dart';

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
          itemCount: taskData.taskCount,
          itemBuilder: (context, index) {
            final task = taskData.tasks[index];
            return TaskTile(
              taskTitle: task.name,
              isChecked: task.isDone,
              toggleCheckBox: (checkBoxState) {
                taskData.updateTask(task);
              },
              deleteTask: () {
                taskData.deleteTask(task);
              },
            );
          },
        );
      },
    );
  }
}
