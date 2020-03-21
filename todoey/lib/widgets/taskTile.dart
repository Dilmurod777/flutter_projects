import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final String title;
  final bool isChecked;
  final Function checkboxCallback;
  final Function onLongPressCallback;

  TaskTile(
      {this.title,
      this.isChecked,
      this.checkboxCallback,
      this.onLongPressCallback});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      enabled: !isChecked,
      title: Text(
        title,
        style: TextStyle(
          fontSize: 16.0,
          decoration:
              isChecked ? TextDecoration.lineThrough : TextDecoration.none,
        ),
      ),
      trailing: Checkbox(
        activeColor: Colors.lightBlueAccent,
        value: isChecked,
        onChanged: checkboxCallback,
      ),
      onLongPress: onLongPressCallback,
    );
  }
}
