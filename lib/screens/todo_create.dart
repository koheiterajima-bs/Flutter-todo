import 'package:flutter/material.dart';

class TodoCreateScreen extends StatelessWidget {
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
              decoration: InputDecoration(
                labelText: 'Todoのタイトル',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 32),
            TextField(
              maxLines: 5,
              decoration: InputDecoration(
                labelText: 'Todoの内容',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 32),
            ElevatedButton(
                onPressed: () {
                  // ボタンが押されると、Todoとしてtodo_list.dartに追加される
                },
                child: Text('Todoを登録する')),
          ],
        ),
      ),
    );
  }
}
