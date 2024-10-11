import 'package:flutter/material.dart';

class TodoListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo一覧'),
      ),
      body: Center(
        child: Text('ここにTodo一覧を表示する'),
      ),
    );
  }
}
