import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'dart:math';

class Todolist extends StatelessWidget {
  const Todolist({
    super.key,
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged, required this.deleteFunction,
  });

  final bool taskCompleted;
  final Function(bool?)? onChanged;
  final Function(BuildContext)?deleteFunction;

  final String taskName;

  @override
  Widget build(BuildContext context) {
    // Generate a random purple shade
    final random = Random();
    // Purple: high red & blue, low green
    final int red = 120 + random.nextInt(128); // 128-255
    final int green = random.nextInt(90);      // 0-79
    final int blue = 120 + random.nextInt(128); // 128-255
    final Color randomPurple = Color.fromARGB(255, red, green, blue);
    return Padding(
      padding: const EdgeInsets.only(
        top: 20,
        left: 20,
        right: 20,
        bottom: 0,
      ),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(onPressed: deleteFunction ,
            icon: Icons.delete,
            borderRadius: BorderRadius.circular(15),
           // backgroundColor: Colors.red,
            ),
          ],
        ),
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: randomPurple,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            children: [
              Checkbox(
                value: taskCompleted,
                onChanged: onChanged,
                checkColor: Colors.black,
                activeColor: Colors.white,
                side: const BorderSide(
                  color: Colors.white,
                ),
              ),
              Text(
                taskName,
                // ToDoList[index][0],
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                  color: Colors.white,
                  decoration: taskCompleted
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                  decorationColor: Colors.white,
                  decorationThickness: 2,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
