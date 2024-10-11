package main

import "fmt"

func init() {
	fmt.Println("init")
}

func main() {
	fmt.Println("aaa")
}

/*
【苦手意識、現状あまり使っていないもの】
・無名関数 →いつ使うの？
・クロージャー →いつ使うの？ジェネレーターの時？
・簡易文付きif文
・型アサーション、型スイッチ
・ラベル付きfor文
・defer文→ファイルのリソース解放処理漏れを防ぐ
・可変長引数
func Sum(s ...int) int {
	n := 0
	for _, v := range s {
		n += v
	}
	return n
}

func main() {
	fmt.Println(Sum(1, 2, 3))
}
・チャネル全般
・struct型コンストラクタ
*/

/*
【新たに学んだこと】
・panicはランタイムエラーを発生させて、実行中のプログラムを強制的に中止させるもの。
・recoverを使うことでパニックにより発生した、ランタイムエラーから復帰することができる。(recoverはdefer文とセットで使う)
・ゴルーチンを生成して、並行処理される新しい処理の流れをランタイムに追加する
・ランタイムとは「実行時に必要となるあれこれの部品や環境」のことを指す。
・ゴルーチンはスレッドよりも小さい処理単位
・Goのパッケージにはパッケージの初期化を目的とした特殊な関数のinitを定義することができる。(func init()と記述するだけで、main関数よりも先に出力される。)
・init関数は複数定義も可能だが、なるべくまとめて定義した方がいい。
・スライス、マップ、チャネルは参照渡し
func main() {
	sl := []int{100, 200}
	sl2 := sl
	sl2[0] = 1000
	fmt.Println(sl) // 参照渡しなので、基のスライスも変わってしまう。

	var i int = 10
	i2 := i
	i2 = 100
	fmt.Println(i, i2) // 値渡しなので、iの値は変わらない。
}
・カンマOKイディオムは、マップと型アサーションで用いられる。
// mapの作成
f := map[string]int {
	"Apple": 1,
	"Banana": 2,
}

if s, ok := f["Apple"]; ok {
	// do something
}

var test interface {}
test = 123

if t, ok := test.(int); ok {
	// do something
}
【参考サイト】https://c-taquna.hatenablog.com/entry/2019/06/17/194407
・チャネルは先入れ先出しでデータが取り出される。
・struct型コンストラクタ→コンストラクタ関数は、型のインスタンスを作成、および初期化するために使用される特殊なタイプの関数
type Person struct {
	name string
	age  int
}

// 型のインスタンスを作成および初期化するために使用される特殊なタイプの関数→コンストラクタ関数
func NewPerson(name string, age int) Person {
	return Person{
		name: name,
		age:  age,
	}
}

func main() {
	hoge := NewPerson("age", 10)
	fmt.Println(hoge)
}
【参考サイト】https://recursionist.io/learn/languages/go/oop/method#:~:text=Go%E8%A8%80%E8%AA%9E%20%E3%82%B3%E3%83%B3%E3%82%B9%E3%83%88%E3%83%A9%E3%82%AF%E3%82%BF%E9%96%A2%E6%95%B0,%E6%85%A3%E7%BF%92%E3%81%AB%E3%81%AA%E3%81%A3%E3%81%A6%E3%81%84%E3%81%BE%E3%81%99%E3%80%82
・チャネルでfor文を使う際には、for文の前にcloseでチャネルを閉じる。
・複数のチャネルを処理しようとするときに、どちらかのチャネルが受信できなくなってしまうと、他のプログラムも停止してしまう。
・interfaceを導入することによって、異なる型をまとめて、同じスライスに入れることができる。
・Goの組み込み型のエラーはinterfaceとして定義されている。
type error interface {
	Error() string
}
・fmtパッケージのStringerインターフェースを使うことで、構造体のフィールドの値を任意の値にカスタマイズできる
*/
