import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'todo_create.dart';

class TodoListScreen extends StatefulWidget {
  // 渡されるTodoリストを保持するためのプロパティ
  final List<Map<String, String>> todos;

  // コンストラクタでTodoリストを受け取る
  TodoListScreen({required this.todos});

  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo一覧'),
      ),
      body: ListView.builder(
        itemCount: widget.todos.length,
        itemBuilder: (context, index) {
          final todo = widget.todos[index];
          return ListTile(
            title: Text(todo['title'] ?? 'No Title'),
            subtitle: Text(todo['content'] ?? 'No Content'),
          );
        },
      ),
    );
  }
}
