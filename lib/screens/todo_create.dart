import 'package:flutter/material.dart';
import 'todo_list.dart';

class TodoCreateScreen extends StatefulWidget {
  @override
  _TodoCreateState createState() => _TodoCreateState();
}

class _TodoCreateState extends State<TodoCreateScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();

  List<Map<String, String>> _todos = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo作成'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                labelText: 'Todoのタイトル',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 32),
            TextField(
              controller: _contentController,
              decoration: InputDecoration(
                labelText: 'Todoの内容',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 32),
            ElevatedButton(
                onPressed: () {
                  // Todoリストに新しいTodoを追加
                  setState(() {
                    _todos.add({
                      'title': _titleController.text,
                      'content': _contentController.text,
                    });
                  });
                  // todo_list.dartにデータを渡しながら推移
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TodoListScreen(todos: _todos),
                    ),
                  );
                },
                child: Text('リスト追加')),
            SizedBox(height: 32),
            ElevatedButton(
                onPressed: () {
                  // "pop"で前の画面に戻る
                  Navigator.of(context).pop();
                },
                child: Text('キャンセル')),
          ],
        ),
      ),
    );
  }
}
