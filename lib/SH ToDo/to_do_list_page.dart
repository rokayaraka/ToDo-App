import 'package:flutter/material.dart';

class ToDo {
  String title;
  bool isDone;
  ToDo({
    required this.title,
    this.isDone = false,
  });
}

class ToDoListPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ToDoListPageState();
  }
}

class _ToDoListPageState extends State<ToDoListPage> {
  List<ToDo> todos = [];
  String filter = 'All';

  @override
  Widget build(BuildContext context) {
    List<ToDo> filteredTodos;
    if (filter == 'Active') {
      filteredTodos = todos.where((t) => !t.isDone).toList();
    } else if (filter == "Completed") {
      filteredTodos = todos.where((t) => t.isDone).toList();
    } else {
      filteredTodos = todos;
    }

    int remaining = todos.where((t) => !t.isDone).length;

    return Expanded(
      child: ListView.builder(
        itemCount: filteredTodos.length,
        itemBuilder: (context, index) {
          final todo = filteredTodos[index];

          return Card(
            child: CheckboxListTile(
              value: todo.isDone,
              onChanged: (value){
                setState(() {
                  todo.isDone=value!;
                });
              },
              title: Text(
                todo.title.isEmpty? " ": todo.title,
              ),
              activeColor: Colors.deepPurple,
            ),
          );
        },
      ),
    );
  }
}
