import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
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
              const TextField(
                decoration: InputDecoration(
                  labelText: 'What Need To be done?',
                  labelStyle: TextStyle(
                    fontSize: 28,
                    color: Colors.blueAccent,
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
                  textWidget('item remaining'),
                  textWidget('All'),
                  textWidget('Active'),
                  textWidget('Completed'),
                ],
              ),
            
            ],
          ),
        ),
      ),
    );
  }

  Expanded textWidget(String title) {
    return Expanded(
      child: TextButton(
        onPressed: () {},
        child: Text(
          title,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
