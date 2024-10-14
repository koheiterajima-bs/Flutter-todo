import 'package:flutter/material.dart';

class TodoCreateScreen extends StatefulWidget {
  @override
  _TodoCreateState createState() => _TodoCreateState();
}

class _TodoCreateState extends State<TodoCreateScreen> {
  // TextEditingControllerを使って、TextFieldに入力された内容を取得する
  // タイトル用のコントローラー
  final TextEditingController _titleController = TextEditingController();

  // 内容用のコントローラー
  final TextEditingController _contentController = TextEditingController();

  // リアルタイムで更新されるTodo
  String _title = '';
  String _content = '';

  @override
  void initState() {
    super.initState();

    // タイトル用のリスナー
    _titleController.addListener(() {
      setState(() {
        _title = _titleController.text;
      });
    });

    // 内容用のリスナー
    _contentController.addListener(() {
      setState(() {
        _content = _contentController.text;
      });
    });
  }

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
              maxLines: null,
              decoration: InputDecoration(
                labelText: 'Todoの内容',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 32),
            // リアルタイムで更新されるTodoのプレビュー
            Text('現在のTodoのプレビュー:'),
            Text('タイトル: $_title'),
            Text('内容: $_content'),
            // ElevatedButton(
            //     onPressed: () {
            //       // ボタンが押されると、Todoとしてtodo_list.dartに追加される

            //       // タイトルと内容をまとめたTodoデータを返す
            //       final todo = {
            //         'title': _titleController.text,
            //         'content': _contentController.text
            //       };
            //       Navigator.pop(context, todo); // todo_list.dartにデータを渡す
            //     },
            //     child: Text('Todoを登録する')),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    // コントローラーの破棄
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }
}
