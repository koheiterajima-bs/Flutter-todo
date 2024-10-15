import 'package:flutter/material.dart';

class TodoListScreen extends StatefulWidget {
  // 渡されるTodoリストを保持するためのプロパティ
  final List<Map<String, String>> todos;
  final Function(int) onDelete; // 削除機能を渡すためのコールバック

  // コンストラクタでTodoリストを受け取る
  // required修飾子で必須にしている
  const TodoListScreen({Key? key, required this.todos, required this.onDelete})
      : super(key: key);

  @override
  _TodoListScreenState createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo一覧'),
      ),
      // ListView.builderは、Flutterで効率的なリストビューを作成するためのウィジェット
      // 長いリストや動的なリストを表示する際に役立つ
      body: ListView.builder(
        // リストの表示するアイテムの総数
        itemCount: widget.todos.length,

        // リストアイテムを構築するための関数指定
        itemBuilder: (context, index) {
          // widget.todosにアクセスして、現在のインデックスに対応するTodoアイテムを取得
          final todo = widget.todos[index];

          return Dismissible(
            key: Key(todo['title'] ?? 'Todo$index'),
            direction: DismissDirection.endToStart, // スワイプ方向を右から左に設定
            onDismissed: (direction) {
              // 削除機能を呼び出す
              widget.onDelete(index);

              // スナックバーで通知
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('${todo['title']} を削除しました')),
              );
            },
            background: Container(
              color: Colors.red,
              alignment: Alignment.centerRight,
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Icon(Icons.delete, color: Colors.white),
            ),
            child: Card(
              elevation: 4.0,
              margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              child: Column(
                // リストの各アイテムを表示するための便利なウィジェット、アイテムのタイトルやサブタイトルを簡単に配置できる
                children: [
                  ListTile(
                    title: Text(todo['title'] ?? 'No Title'),
                    subtitle: Text(todo['content'] ?? 'No Content'),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
