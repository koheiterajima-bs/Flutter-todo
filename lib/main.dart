import 'package:flutter/material.dart';
import 'screens/todo_create.dart';
import 'screens/todo_list.dart';

// エントリーポイント
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  // 親クラスのコンストラクタにkey(固有の識別子)を渡す役割
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  // buildメソッドは、FlutterのWidgetクラスにおけるUIの構築を担当するメソッド
  Widget build(BuildContext context) {
    // MaterialAppは、Flutterアプリケーション全体をラップするウィジェットで、GoogleのMaterialDesignに基づいたUIを提供する
    return MaterialApp(
      title: 'Todoアプリ',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Todoアプリ'),
    );
  }
}

// 状態を持つウィジェットを定義しているコード
class MyHomePage extends StatefulWidget {
  // MyHomePageのコンストラクタ、ウィジェットのインスタンスを作成する際に必要な情報を初期化
  const MyHomePage({super.key, required this.title});
  // titleというString型のプロパティを持っている
  final String title;

  @override
  // StatefulWidgetに必須のメソッド、Stateオブジェクトを作成して返す
  State<MyHomePage> createState() => _MyHomePageState();
}

// MyHomePageウィジェットに対応する状態を定義している
class _MyHomePageState extends State<MyHomePage> {
  List<Map<String, String>> _todos = []; // Todoリストをここで管理

  @override
  // contextは、Flutterウィジェットツリー内でのウィジェットの位置や親子関係、テーマなどの情報を持つ重要なオブジェクト
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Todo作成',
              style: TextStyle(
                fontSize: 24.0,
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
            ),
            ElevatedButton(
                onPressed: () async {
                  // TodoCreateScreenに移動し、戻ってきた時に新しいTodoが追加されているか確認
                  final newTodo = await Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TodoCreateScreen()),
                  );
                  // 戻ってきた時に新しいTodoをリストに追加
                  if (newTodo != null) {
                    setState(() {
                      _todos.add(newTodo);
                    });
                  }
                },
                child: Text('Todoを作成する')),
            SizedBox(height: 32),
            Text(
              'Todo一覧',
              style: TextStyle(
                fontSize: 24.0,
                color: Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  // Todoリストを表示
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TodoListScreen(
                            todos: _todos,
                            onDelete: (index) {
                              setState(() {
                                _todos.removeAt(index);
                              });
                            })),
                  );
                },
                child: Text('Todoリストを見る')),
          ],
        ),
      ),
    );
  }
}
