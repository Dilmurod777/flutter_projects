import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/tasks_data.dart';
import './taskTile.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TasksData>(
      builder: (context, tasksData, child) => ListView.builder(
        itemCount: tasksData.tasksCount,
        itemBuilder: (context, index) {
          final task = tasksData.tasks[index];
          return TaskTile(
            title: task.name,
            isChecked: task.isDone,
            checkboxCallback: (checkboxState) {
              tasksData.updateTaskStatus(task);
            },
            onLongPressCallback: () {
              tasksData.deleteTask(task);
            },
          );
        },
      ),
    );
  }
}
