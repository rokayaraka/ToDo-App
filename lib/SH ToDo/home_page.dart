import 'package:flutter/material.dart';
import 'package:todos/SH%20ToDo/card_list.dart';
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
    //ToDo(title: 'late night sleep', isDone: true),
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
        backgroundColor: Colors.white,
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 16,
              ),

              Text(
                'Todos',
                style: TextStyle(
                  fontSize: 80,
                  color: const Color.fromARGB(255, 152, 199, 240),
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(
                height: 12,
              ),
              // Text(
              //   'What needs to be done?',
              //   style: TextStyle(
              //     fontSize: 20,
              //     color: Colors.black54,
              //     fontWeight: FontWeight.w400,
              //   ),
              // ),
              TextField(
                controller: _controller,
                decoration: InputDecoration(
                  hintText: 'What Needs To Be done?',
                  hintStyle: TextStyle(
                    fontSize: 28,
                  ),

                  //filled: true,
                  // fillColor: const Color.fromARGB(255, 143, 170, 215),
                  // enabledBorder: OutlineInputBorder(
                  //   // borderSide: const BorderSide(
                  //   //   color: Colors.white,
                  //   // ),
                  //   borderRadius: BorderRadius.circular(15),
                  // ),
                  // focusedBorder: OutlineInputBorder(
                  //   borderSide: const BorderSide(
                  //     color: Color.fromARGB(255, 127, 152, 209),
                  //   ),
                  // ),
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
                  padding: EdgeInsets.zero,
                  itemCount: filteredTodos.length,
                  itemBuilder: (context, index) {
                    final todo = filteredTodos[index];

                    return CardList(todo: todo);
                  },
                ),
              ),
              //SizedBox(height: 90,),
            ],
          ),
        ),

        floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 20),
          child: Container(
             // padding:  EdgeInsets.only(bottom: 20),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [Colors.grey, Colors.grey.shade300],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          
            child: FloatingActionButton(
              //backgroundColor: Colors.grey.shade500,
              backgroundColor: Colors.transparent,
              shape: CircleBorder(),
              
              child: const Icon(
                Icons.add,
                color: Colors.deepPurple,
              ),
          
              onPressed: () {
                saveNewTask();
              },
            ),
            
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        
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
           style: TextStyle(
          color: filter == title ? Colors.deepPurple : Colors.black, // ✅ selected/unselected
          fontWeight: filter == title ? FontWeight.bold : FontWeight.normal, // optional
        ),
        ),
      ),
    );
  }
}
