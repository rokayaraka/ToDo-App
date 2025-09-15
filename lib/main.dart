import 'package:flutter/material.dart';
import 'package:todos/SH%20ToDo/home_page.dart';

import 'package:todos/YT%20Todo/to_do_Homepage.dart';

void main() {
  runApp(const ToDoApp());
}

class ToDoApp extends StatelessWidget {
  const ToDoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home:  ToDoHomepage(),
      home: HomePage(),
    );
  }
}
