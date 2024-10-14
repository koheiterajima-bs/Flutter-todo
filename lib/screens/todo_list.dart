import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'todo_create.dart';

class TodoListScreen extends StatefulWidget {
  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoListScreen> {
  // Todoを格納するリスト
  List<Map<String, String>> _todos = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo一覧'),
      ),
      // スクロール可能なリストを生成する
      body: ListView.builder(
        itemCount: _todos.length, // 表示するアイテムの数を指定
        itemBuilder: (context, index) {
          // 各アイテムをどう表示するか
          final todo = _todos[index];
          return ListTile(
            title: Text(todo['title'] ?? 'No Title'),
            subtitle: Text(todo['content'] ?? 'No Content'),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          // TodoCreateScreenを開いてデータを取得する
          final newTodo = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => TodoCreateScreen()),
          );

          // newTodoがnullでない場合、リストに追加
          if (newTodo != null) {
            setState(() {
              _todos.add(newTodo);
            });
          }
        },
      ),
    );
  }
}
