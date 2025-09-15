import 'package:flutter/material.dart';
import 'package:todos/SH%20ToDo/to_do_list_page.dart';
import 'package:todos/YT%20Todo/todolist.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  List<ToDo> todos = [
    ToDo(title: 'late night sleep', isDone: true),
  ];
  String filter = 'All';
  final _controller = TextEditingController();

  void checkBoxChanged(int index) {
    setState(() {
      todos[index].isDone = !todos[index].isDone;
    });
  }

  void saveNewTask() {
    setState(() {
      todos.add(ToDo(title: _controller.text, isDone: false));
      _controller.clear();
    });
  }

  void deletTask(int index) {
    setState(() {
      todos.removeAt(index);
    });
  }

  int get remaining => todos.where((t) => !t.isDone).length;

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
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 166, 185, 209),
        // appBar: AppBar(
        //   backgroundColor: Colors.blue,
        //   elevation: 0,
        //   //toolbarHeight: 3,
        //   foregroundColor: const Color.fromARGB(255, 221, 222, 231),
        //   title: Center(
        //     child: Text(
        //       'ToDo App',
        //       style: TextStyle(
        //         fontWeight: FontWeight.bold,
        //       ),
        //     ),
        //   ),
        // ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const SizedBox(
                height: 86,
              ),
              Center(
                child: Text(
                  'ToDos',
                  style: TextStyle(
                      fontSize: 60,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 7, 40, 222)),
                ),
              ),
              const SizedBox(
                height: 26,
              ),
              TextField(
                controller: _controller,
                decoration: InputDecoration(
                  hintText: 'What Needs To Be done?',
                  filled: true,
                  fillColor: const Color.fromARGB(255, 143, 170, 215),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.white,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color.fromARGB(255, 127, 152, 209),
                    ),
                  ),
                ),
              ),
              // const Divider(
              //   thickness: 2,
              //   color: Color.fromARGB(255, 85, 141, 236),
              // ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  //textWidget('item remaining'),
                  Text("$remaining item left"),
                  textWidget('All'),
                  textWidget('Active'),
                  textWidget('Completed'),
                ],
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: filteredTodos.length,
                  itemBuilder: (context, index) {
                    final todo = filteredTodos[index];

                    return Card(
                      color: const Color.fromARGB(255, 192, 204, 214),
                      child: CheckboxListTile(
                        title: Text(
                          todo.title.isEmpty ? " " : todo.title,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        value: todo.isDone,
                        onChanged: (value) {
                          setState(() {
                            todo.isDone = value!;
                          });
                        },
                        activeColor: Colors.deepPurple,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.grey.shade400,
          child: const Icon(
            Icons.add,
            color: Colors.deepPurple,
          ),
          onPressed: () {
            saveNewTask();
          },
        ),
      ),
    );
  }

  Expanded textWidget(String title) {
    return Expanded(
      child: TextButton(
        onPressed: () {
          setState(() {
            filter = title;
          });
        },
        child: Text(
          title,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
