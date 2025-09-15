import 'package:flutter/material.dart';
import 'package:todos/YT%20Todo/todolist.dart';

class ToDoHomepage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ToDoHomepageState();
  }
}

class _ToDoHomepageState extends State<ToDoHomepage> {
  final _controller = TextEditingController();
  List ToDoList = [];

  void checkBoxChanged(int index) {
    setState(() {
      ToDoList[index][1] = !ToDoList[index][1];
    });
  }

  void saveNewTask() {
    setState(() {
      ToDoList.add([_controller.text, false]);
      _controller.clear();
    });
  }

  void deletTask(int index) {
    setState(() {
      ToDoList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade100,
      appBar: AppBar(
        title: Center(
          child: Text(
            'Simple todo',
          ),
        ),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: ToDoList.length,
        itemBuilder: (BuildContext context, index) {
          return Todolist(
            taskName: ToDoList[index][0],
            taskCompleted: ToDoList[index][1],
            onChanged: (value) => checkBoxChanged(index),
            deleteFunction: (context) => deletTask(index),
          );
        },
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
        ),
        
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: TextField(
                  controller: _controller,
                  decoration: InputDecoration(
                    hintText: 'Add new To Do Items',
                    filled: true,
                    fillColor: Colors.deepPurple.shade200,
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.deepPurple,
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ),
            ),
            FloatingActionButton(
              onPressed: saveNewTask,
              child: Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}
