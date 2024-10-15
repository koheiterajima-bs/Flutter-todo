import 'package:flutter/material.dart';

class TodoListScreen extends StatefulWidget {
  // 渡されるTodoリストを保持するためのプロパティ
  final List<Map<String, String>> todos;

  // コンストラクタでTodoリストを受け取る
  // required修飾子で必須にしている
  TodoListScreen({required this.todos});

  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoListScreen> {
  // _todosをState内で定義
  // lateキーワードを使って遅延初期化される
  late List<Map<String, String>> _todos;

  @override
  void initState() {
    super.initState();
    // widget.todosを使って初期化
    _todos = List.from(widget.todos);
  }

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
        itemCount: _todos.length,

        // リストアイテムを構築するための関数指定
        itemBuilder: (context, index) {
          // widget.todosにアクセスして、現在のインデックスに対応するTodoアイテムを取得
          final todo = widget.todos[index];
          return Card(
            elevation: 4.0,
            margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: Column(
              // リストの各アイテムを表示するための便利なウィジェット、アイテムのタイトルやサブタイトルを簡単に配置できる
              children: [
                ListTile(
                  title: Text(todo['title'] ?? 'No Title'),
                  subtitle: Text(todo['content'] ?? 'No Content'),
                ),
                IconButton(
                  icon: const Icon(Icons.delete),
                  color: Colors.red,
                  onPressed: () {
                    // Todoを削除する処理
                    setState(() {
                      _todos.removeAt(index);
                    });
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
