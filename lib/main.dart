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
                onPressed: () {
                  // ボタンが押されると、todo_create.dartに飛ぶ
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TodoCreateScreen()),
                  );
                },
                child: Text('Todoを作成する')),
          ],
        ),
      ),
    );
  }
}
