import 'package:flutter/foundation.dart';
import 'dart:collection';

import './task.dart';

class TasksData extends ChangeNotifier {
  List<Task> _tasks = [
    Task(name: 'Buy milk'),
    Task(name: 'Buy bread'),
    Task(name: 'Buy cheese'),
  ];

  int get tasksCount => _tasks.length;

  UnmodifiableListView<Task> get tasks => UnmodifiableListView(_tasks.reversed);

  void addTask(String taskName) {
    _tasks.add(Task(name: taskName));
    notifyListeners();
  }

  void updateTaskStatus(Task task) {
    task.toggleDone();
    notifyListeners();
  }

  void deleteTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }
}
