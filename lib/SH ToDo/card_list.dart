import 'package:flutter/material.dart';
import 'package:todos/SH%20ToDo/to_do_list_page.dart';

class CardList extends StatefulWidget{
  final ToDo todo;

  CardList({required this.todo});
  @override
  State<StatefulWidget> createState() {
  return _CardListState();
  }
}

class _CardListState extends State<CardList>{
  @override
  Widget build(BuildContext context) {
    return  Card(
                      //margin: EdgeInsets.zero,
                      elevation: 4,
                      margin: EdgeInsets.symmetric(vertical: 0.5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.horizontal(),
                      ),
                      color: Colors.white,
                      child: CheckboxListTile(
                        title: Text(
                          widget.todo.title.isEmpty ? " " : widget.todo.title,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            //fontWeight: FontWeight.bold,
                          ),
                        ),
                        value: widget.todo.isDone,
                        onChanged: (value) {
                          setState(() {
                            widget.todo.isDone = value!;
                          });
                        },
                        controlAffinity: ListTileControlAffinity.leading,
                        activeColor: Colors.deepPurple,
                      ),
                    );
  }
}