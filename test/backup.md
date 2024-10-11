## Goとは
- Goは、サーバー側のクラウドソフトウェアで頻繁に使用される。
- 簡潔で無駄のない表現に優れているため、効率性と信頼性の高いコードが記述できる。
- Linux、MacなどのUnixシステムに加え、Windowsでも実行できる。
- 複数のコアを一度に使用できる
- 厳密かつ静的に型指定された言語、コンパイル時に変数が認識される。
- オブジェクト指向のプログラミング機能とデザインパターンを使用できるが、完全に実装できるわけではない。
- 全てのプロジェクトが同じワークスペースを共有する。
  - ワークスペース…全てのソースコードが存在する場所
  <br>
  **参考サイト**
  [Go ワークスペースを構成する](https://learn.microsoft.com/ja-jp/training/modules/go-get-started/2-install-go?pivots=windows)

## Goの原則
- Goのライセンスは、100%オープンソース。
- プログラムが単一の自己完結型バイナリにコンパイルするので、共有と分散を簡単に実行できる。
    - 自己完結型バイナリ…外部との依存関係を持たずに単独で動作する実行可能ファイルのこと。
- 様々なプラットフォームやオペレーティングシステムに対してクロスコンパイルをサポートしている。
    - クロスコンパイル…プログラムのソースコードを元に、開発に使用している機種やOSとは異なる環境向けに実行可能なコードを生成すること。
    <br>
    **参考サイト**
    [クロスコンパイル](https://e-words.jp/w/%E3%82%AF%E3%83%AD%E3%82%B9%E3%82%B3%E3%83%B3%E3%83%91%E3%82%A4%E3%83%AB.html#:~:text=%E3%82%AF%E3%83%AD%E3%82%B9%E3%82%B3%E3%83%B3%E3%83%91%E3%82%A4%E3%83%AB%EF%BC%88cross%20compile%EF%BC%89%E3%81%A8,%E8%BB%A2%E9%80%81%E3%81%97%E3%81%A6%E5%AE%9F%E8%A1%8C%E3%81%99%E3%82%8B%E3%80%82)
- 言語を小規模でシンプルに保ち、より少ないコード行でより多くの処理を行えるようになっている。
- コンカレンシー(並行性)により、あらゆる関数を軽量スレッドとして実行できる。
    - コンカレンシー(並行性)…システムの複数タスクをアクティブな状態で維持し、同時に処理を実行すること。
    <br>
    **参考サイト**
    [並行性(コンカレンシー)](https://www.isus.jp/hpc/part1/#:~:text=%E4%B8%A6%E8%A1%8C%E6%80%A7%20(%E3%82%B3%E3%83%B3%E3%82%AB%E3%83%AC%E3%83%B3%E3%82%B7%E3%83%BC),-%E4%B8%A6%E5%88%97%E3%82%B3%E3%83%B3%E3%83%94%E3%83%A5%E3%83%BC%E3%83%86%E3%82%A3%E3%83%B3%E3%82%B0&text=%E4%B8%A6%E8%A1%8C%E6%80%A7%3A%20%E3%82%B7%E3%82%B9%E3%83%86%E3%83%A0%E3%81%AE%E8%A4%87%E6%95%B0,%E5%87%A6%E7%90%86%E3%82%92%E5%AE%9F%E8%A1%8C%E3%81%99%E3%82%8B%E3%81%93%E3%81%A8%E3%80%82)
- ガベージコレクションなどの自動メモリ管理を実行できる。
    - ガベージコレクション…メモリ上の不要なデータを自動的に削除する仕組みのこと。
    <br>
    **参考サイト**
    [ガベージコレクション](https://www.hitachi.co.jp/rd/glossary/jp_ka/gabeezikorekusyon.html#:~:text=%E7%94%A8%E8%AA%9E%E8%A7%A3%E8%AA%AC,%E3%81%AE%E6%89%8B%E9%96%93%E3%82%92%E6%B8%9B%E3%82%89%E3%81%9B%E3%82%8B%E3%80%82)
- コンパイルと実行が高速。
- コード全体が使用されるので、宣言された変数等は使用されていないとエラーが出てしまう。
- 標準ライブラリが充実している。
- 以前にリリースされたバージョンとも互換性を保証している。

## Goでの記述について
- `package main`
  - package mainステートメントは、作成しているアプリが実行可能プログラムであることをGoに伝える方法。(全ての実行可能プログラムはmainパッケージの一部である必要があるため、mainと命名しなくてはならない。)
  - パッケージ…一般的なソースコードのセットのこと。パッケージは1つのディレクトリに1つ定義される。
    ```go
    // ディレクトリ構造
    myapp/
    ├── main.go
    ├── utils.go
    └── models/
        ├── blog.go
        └── user.go
    ```
    - main.go
    ```go
    package main

    import (
        "fmt"
        "myapp/models"
    )

    func main() {
        b := models.Blog{Title: "Go Packages", Content: "Understanding packages in Go."}
        fmt.Println(b.GetFullArticle())
    }
    ```
    - utils.go
    ```go
    package main

    // このファイルも main パッケージに属します。
    func UtilityFunction() {
        // 何かしらの処理
    }
    ```
    - models/blog.go
    ```go
    package models

    import "fmt"

    type Blog struct {
        Title   string
        Content string
    }

    func (b Blog) GetFullArticle() string {
        return b.Title + "\n-----\n" + b.Content
    }
    ```
    - models/users.go
    ```go
    package models

    type User struct {
        Name  string
        Email string
    }

    func (u User) GetContactInfo() string {
        return u.Name + " - " + u.Email
    }
    ```
- `import "fmt"`
  - importステートメントは、別のパッケージ内にある他のコードからプログラムにアクセスできる。(fmtは標準ライブラリパッケージ)
  - 未使用だとコンパイルされずエラーが吐かれる。
    ```sh
    .\main.go:3:8: "fmt" imported and not used
    ```
- コードブロック(`func main`)
  - funcステートメントは、関数の宣言に使用する予約語。
  - main()関数で、fmtパッケージのPrintln関数を呼び出し、画面に表示するテキストメッセージを送信した。
    ```sh
    func main() {
        fmt.Println("Hello world")
    }
    ```
- `go build`と`go run`の違い
  - go buildは、プログラムがコンパイルされ、エラーがない場合は、Goを使用せずに実行できるバイナリ可能ファイルが生成される。
  - go runは、アプリケーションがコンパイル及び実行されるが、バイナリは作成されない。
    
## 変数の宣言と利用
- 変数とはプログラムであるデータを一時的に保存しておくためのもの。
- 変数は実際には変数に割り当てられたデータ型によって確保されたメモリ領域を指す名前。
- 変数を宣言するには、`var`キーワードを使用する必要がある。(varで宣言する場合は初期化不要)
    ```go
    package main

    var firstName string

    //複数の変数定義も可能
    var firstName, lastName string

    //int型の場合
    var age int

    //かっこで変数宣言専用ブロックのようにもできる
    var (
        firstName, lastName string
        age int
    )
    ```
- 変数の初期化
    ```go
    //型指定の場合
    var (
        firstName string = "John"
        lastName string = "Doe"
        age int = 32
    )

    //型を指定しない場合(型推定)
    var (
        firstName = "John"
        lastName = "Doe"
        age = 32
    )
    //1つにまとめて変数を初期化する
    var (
        firstName, lastName, age = "John", "Doe", 32
    )
    //varを使わずに初期化する、暗黙的な型宣言(Goでもっとも一般的な方法)
    package main

    import "fmt"

    func main() {
        firstName, lastName := "John", "Doe"
        age := 32
        fmt.Println(firstName, lastName, age)
    }
    //:=の場合、宣言する変数は新しいものである必要がある
    ```

## 定数の宣言
- 定数は静的な値。変数と同様、定数の型はそれに割り当てられた値から推定される。
    ```go
    const HTTPStatusOK = 200

    //1つのブロックでまとめて宣言することも可能
    const (
        StatusOK = 0
        StatusConnectionReset = 1
        StatusotherError = 2
    )
    ```
- 文字、文字列、boolean、数値のみで使える。
- 定数は変数とは異なり、定数を使用せずに定数を宣言してもエラーは表示されない。
- 定数は:=を使って定義できない。

## 使用しない変数を宣言するとエラーが出る
- Goでは、変数を宣言してもそれを使用しなかった場合、エラーが出る。
    ```go
    func main() {
        firstName, lastName := "John", "Doe"
        age := 32
    }
    ```
    ```sh
        ./main.go:4:2: firstName declared but not used
        ./main.go:4:13: lastName declared but not used
        ./main.go:5:2: age declared but not used
    ```
## コメントについて
- `//`もしくは`/* */`を用いて、コメントを書く。
    ```go
    // これは1行のコメント

    /*
    これは
    複数行の
    コメント
    */
    ```
- コメントは、読んでも何をしているか不明瞭の場合に説明を書く。

## リテラルについて
- リテラルとは、プログラムの中で直接記述された値のこと。リテラルは、その値によってデータ型が決まる。
- 整数リテラル、浮動小数点リテラル、文字列リテラル、論理リテラル等がある。
- 整数リテラル
    ```go
    var x int = 10 // 10進数
    var y int = 010 // 8進数
    var z int = 0x10     // 16進数
    var w int = 0b10     // 2進数
    ```
## ポインタについて
- コンピュータは主メモリをアドレスと呼ばれる数値で管理している。
- 1つのアドレスで示すことができるメモリは多くの場合、1バイト(8ビット)のデータ。(コンピュータによっては16ビットや21ビット)
- プログラムがメモリ上のデータを操作するためには、そのデータのアドレスを知る必要がある。この仕組みがポインタ。
### ポインタ入門
- ポインタとは、ある値が保存されているメモリ内の位置を表す変数。
- どの変数も1バイトもしくは何バイトか連続したメモリに保存されており、この位置のことをアドレスと呼ぶ。
- 変数の型が違えば、保存に必要なメモリの量も異なる。下の画像では2つの変数を示していて、xは32ビット(4バイト)変数で、yはブール値。
![変数とアドレスについて](../assets/image/05_01.png)
- ポインタも変数であることには変わりはなく、その中身が別の変数が保存されているアドレスというだけの話。
- ポインタはある変数のメモリアドレスを保持する変数。(変数がどこにあるかのアドレスが入っている変数)
- 普通の変数は変数の型が異なれば、メモリの量も異なるが、ポインタはどのような型を参照していてもサイズが同じ。(位置を示した値というだけなので)
- ポインタのゼロ値はnilである。スライス、マップ、関数はポインタで実装されているので、ゼロ値はnil。
- 「&」はアドレス演算子で変数の前につけると、その変数のアドレスを返す。
    ```go
    x := "hello"
    pointerToX := &x
    ```
- 「*」は間接参照のための演算子。ポインタ型の変数の前に付けると、そのポインタが参照するアドレスに保存されている値を返す。これをデリファレンスという。
    ```go
    func main() {
        x := 10
        pointerToX := &x
        fmt.Println(pointerToX)  // 0xc000112068
        fmt.Println(*pointerToX) // 10 デリファレンスする
        z := 5 + *pointerToX
        fmt.Println(z) // 15

        var a *int            // 初期化されていないポインタ
        fmt.Println(a == nil) // true(nilポインタ)
        fmt.Println(*a)       // nilポインタをデリファレンスしようとすると、パニックになる

        var b = new(int)      // new関数を使ってメモリを割り当てる
        fmt.Println(b == nil) // false
        fmt.Println(*b)       // 0
    }
    ```
- 上記コードにて組み込みの関数newはポインタ型の変数を生成する。ただし、newはほとんど使われない。
    ```go
    var y string
    z := &y // 「&」アドレス演算子を用い、宣言する
    ```
- 構造体のフィールドに基本型へのポインタがあると、そのフィールドにリテラルを直接代入できない。
    ```go
    type person struct {
        FirstName  string
        MiddleName *string // 構造体のフィールドに基本型へのポインタ
        LastName   string
    }

    func main() {
        p := person{
            FirstName:  "Pat",
            MiddleName: "Perry", // コンパイル時にエラー
            LastName:   "Peterson",
        }
        fmt.Println(p)
    }
    ```
  - 回避方法1…定数値を保持する変数を作る
    ```go
    type person struct {
        FirstName  string
        MiddleName *string
        LastName   string
    }

    // 定数値を保持する変数を作る
    func main() {
        s := "Perry"
        p := person{
            FirstName:  "Pat",
            MiddleName: &s,
            LastName:   "Peterson",
        }

        fmt.Println(p)
    }
    ```
  - 回避方法2…ポインタを返すヘルパー関数を作成する
    ```go
    type person struct {
        FirstName  string
        MiddleName *string
        LastName   string
    }

    // ブール値、数値、文字列を引数に取り、ポインタを返すヘルパー関数を作成
    func stringp(s string) *string {
        return &s
    }

    func main() {
        p := person{
            FirstName:  "Pat",
            MiddleName: stringp("Perry"),
            LastName:   "Peterson",
        }

        fmt.Println(p)
    }
    ```
### ポインタはミュータブル(変更可能)の印
- Goは値渡しの言語なので、関数に渡される値はコピー。
- プリミティブ、構造体、配列などの非ポインタ型の場合、呼び出された関数は元の値を変更することができない。
- 呼び出された関数には元のデータのコピーがあるため、元のデータの不変性が保証される。
- ポインタが関数に渡されると、関数はポインタのコピーを取得する。
- 関数にnilポインタを渡すと、値を非nilにすることはできない。
    ```go
    func failedUpdate(g *int) {
        x := 10
        g = &x
    }

    func main() {
        var f *int // nilポインタ
        failedUpdate(f)
        fmt.Println(f) // nilポインタに値を渡してもnilのまま
    }
    ```
    ```go
    func failedUpdate(px *int) {
        x2 := 20
        px = &x2
    }

    func update(px *int) {
        *px = 20
    }

    func main() {
        x := 10
        failedUpdate(&x)
        fmt.Println(x) // 10
        update(&x)
        fmt.Println(x) // 20
    }
    ```
<!-- もう一度上記確認！！！！ -->
## ポインタは最後の手段


## データ型について
### 型とは何か
- 型を利用することによるメリット
  - 変数の型を指定することによって、その変数に代入できる値を限定し、間違った操作を行わないようにする。
  - 演算の対象を特定の型にすることによって、間違った値を演算の対象とすることを防ぐ。
  - 特定の型に対して共通して行われる操作(関数など)を記述することで、その型を統一的に扱うとともに、対象外の値や変数に対してその操作を行ってしまうことを防ぐ。
### Go言語における型
- 抽象型と具象型…抽象型は型が何をするものか定義するが、それをどのようにするかは規定しない。対して具象型は何をどのようにするかを規定する。
- 現状、だから何？感ある。。
    ```go
    package main

    import "fmt"

    // バスケをするためのインターフェース
    type BasketBaller interface {
        Run()
        Dunk()
        Jump()
        Shoot()
    }

    // 人間と犬の構造体
    type Human struct {
        Height int
        Weight int
    }
    type Dog struct {
        Kind string
    }

    // 人間のインターフェースの実装
    func (h Human) Run() {
        fmt.Printf("身長: %v, 体重:%v, の選手が走るよ\n", h.Height, h.Weight)
    }
    func (h Human) Dunk() {
        fmt.Printf("身長: %v, 体重:%v, の選手がダンクをするよ\n", h.Height, h.Weight)
    }
    func (h Human) Jump() {
        fmt.Printf("身長: %v, 体重:%v, の選手がジャンプをするよ\n", h.Height, h.Weight)
    }
    func (h Human) Shoot() {
        fmt.Printf("身長: %v, 体重:%v, の選手がシュートするよ\n", h.Height, h.Weight)
    }

    // 犬のインターフェースの実装
    func (d Dog) Run() {
        fmt.Printf("犬（%v）が走るよ\n", d.Kind)
    }
    func (d Dog) Dunk() {
        fmt.Printf("犬（%v）はダンクをできないよ\n", d.Kind)
    }
    func (d Dog) Jump() {
        fmt.Printf("犬（%v）がジャンプをするよ\n", d.Kind)
    }
    func (d Dog) Shoot() {
        fmt.Printf("犬（%s）はシュートができないよ\n", d.Kind)
    }

    // BasketBallerインターフェースが引数になる、Basketメソッド
    func Basket(b BasketBaller) {
        b.Run()
        b.Dunk()
        b.Jump()
        b.Shoot()
    }

    func main() {
        var human = Human{170, 64}
        var dog = Dog{Kind: "プードル"}
        var basketBaller BasketBaller

        basketBaller = human // Human型をBasketBaller型に
        Basket(basketBaller)

        basketBaller = dog // Dog型をBasketBaller型に
        Basket(basketBaller)
    }
    ```
    ```go
    package main

    import "fmt"

    // interfaceの宣言
    type Animal interface {
        MakeSound() string
    }

    type Dog struct{}

    func (d Dog) MakeSound() string {
        return "Bark"
    }

    type Cat struct{}

    func (c Cat) MakeSound() string {
        return "Meow"
    }

    type Lion struct{}

    func (l Lion) MakeSound() string {
        return "Roar"
    }

    func main() {
        animals := []Animal{Dog{}, Cat{}, Lion{}}

        for _, animal := range animals {
            fmt.Println(animal.MakeSound())
        }
    }
    ```
- 基底型…すべての型はその型のベースになる型である基底型を持っている。
- Goは「型指定が厳密」な言語。宣言した全ての変数は特定のデータ型に結び付けられ、その型に一致する値のみを受け入れる。
- Goではデータ型に4つのカテゴリーがある。これらのGo言語にあらかじめ組み込まれているデータ型を組み込み型という。
    - 基本型(プリミティブ型)：数値、文字列、真偽値
    - 集計型：配列と構造体
    - 参照型：ポインター、スライス、マップ、関数、チャネル
    - インターフェース型：インターフェース
- typeで型定義する場合、元となる型を基底型と呼ぶ
- 新しい型を作ることで基底型の特性を引き継ぎながらメソッドを追加して定義することで機能を拡張できる
    ```go
    package main

    import "fmt"

    // 基底型(元となる型)
    type HTTPStatus int

    const (
        StatusOK              HTTPStatus = 200
        StatusUnauthorized    HTTPStatus = 401
        StatusPaymentRequired HTTPStatus = 402
        StatusForbidden       HTTPStatus = 403
    )

    // メソッドを追加することで基底型の特性を引き継ぎながら機能を拡張できる
    func (s HTTPStatus) String() string {
        switch s {
        case StatusOK:
            return "OK"
        case StatusUnauthorized:
            return "Unauthorized"
        case StatusPaymentRequired:
            return "Payment Required"
        case StatusForbidden:
            return "Forbidden"
        default:
            return fmt.Sprintf("HTTPStatus(%d", s)
        }
    }

    func main() {
        var status HTTPStatus = 401
        fmt.Println(status.String())
    }
    ```
### コンテナ・合成型
- コンテナ型…数値、ブール値および文字列といった単純な型だけでプログラムが作れるわけでなく、複数の値をまとめて扱うための型が必要になる。このような型をコンテナ型という。配列、スライス、マップなどが当てはまる。
```go
// 配列
func main() {
    // 配列の宣言と初期化
    var numbers [5]int = [5]int{1, 2, 3, 4, 5}

    // 配列の要素にアクセス
    fmt.Println(numbers[0]) // 1
    fmt.Println(numbers[4]) // 5

    // 配列の長さを取得
    fmt.Println(len(numbers)) // 出力5
}
```
```go
// スライス
func main() {
    // スライスの宣言と初期化
    numbers := []int{1, 2, 3, 4, 5}

    // スライスの要素にアクセス
    fmt.Println(numbers[0]) // 1
    fmt.Println(numbers[4]) // 5

    // スライスの長さと容量を取得
    fmt.Println(len(numbers))
    fmt.Println(cap(numbers))

    // スライスに要素を追加
    numbers = append(numbers, 6)
    fmt.Println(numbers)
}
```
```go
func main() {
    // マップの宣言と初期化
    person := map[string]string {
        "name": "John",
        "age": "30",
    }

    // マップの要素にアクセス
    fmt.Println(person["name"]) // John
    fmt.Println(person["age"]) // 30
    
    // マップに新しいキーと値を追加
    person["city"] = "New York"
    fmt.Println(person) // map[age:30 city:New York name:John]
}
```
- 合成型…コンテナ型と単純な型を組み合わせて作った型
```go
type Person struct {
    Name string
    Age int
    City string
}

func main() {
    // 構造体の初期化
    john := Person{
        Name: "John",
        Age: 30,
        City: "New York",
    }

    // 構造体のフィールドにアクセス
    fmt.Println(john.Name)
    fmt.Println(john.Age)
    fmt.Println(john.City)

    // 構造体のフィールドを変更
    john.Age = 31
    fmt.Println(john.Age)
}
```
#### 配列型
- 可変長でないため、直接使われることは少ない。
    ```go
    // 配列の大きさと要素の型を指定したもの
    var x [3]int

    // 配列の大きさ、要素の型に加え、値を指定したもの
    var x = [3]int{10, 20, 30}

    // 配列の初期化に配列リテラルを使う場合
    var x = [...]int{10, 20, 30}

    // ==と!=を使って、配列の比較も可能
    var x = [...]int{1, 2, 3}
    var y = [3]int{1, 2, 3}
    fmt.Println(x == y)

    // 多次元配列を表現したい場合
    var x [2][3]int

    // 配列の長さを取得
    fmt.Println(len(s))
    ```
#### スライス型
- 可変長である、スライスは比較可能ではない。
```go
// 配列と異なり、宣言時に大きさを指定しない
var x = []int{10, 20, 30}

var x = []int{1, 5: 4, 6, 10: 100, 15}
// [1, 0, 0, 0, 0, 4, 6, 0, 0, 0, 100, 15] 

// スライスのゼロ値はnil
var x = []int

// スライスの要素を増やすには関数appendを用いる
var x = []int{1, 2, 3}
x = append(x, 4)
x = append(x, 4, 5, 6) // 複数要素の追加も可能

y := []int{20, 30, 40}
x = append(x, y...)
```
- スライスのキャパシティ…スライスの各要素はメモリ内の連続した領域に記憶されることで、素早い読み書きができる。各スライスはキャパシティ(容量)を持っている。
```go
var x []int
fmt.Println(x, len(x), cap(x)) // [] 0 0
x = append(x, 10)
fmt.Println(x) // [10] 1 1
x = append(x, 20)
fmt.Println(x) // [10, 20] 2 2
x = append(x, 30)
fmt.Println(x) // [10, 20, 30] 3 4
x = append(x, 40)
fmt.Println(x) // [10, 20, 30, 40] 4 4
x = append(x, 50)
fmt.Println(x) // [10, 20, 30, 40, 50] 5 8
```
```go
// 長さが容量を超えると、容量は倍の大きさになる。
// スライスに入れるものの数がわかっているのなら、make関数を使って適切な初期容量でスライスを作成する
fmt.Println(x) // [10, 20] 2 2
x = append(x, 30)
fmt.Println(x) // [10, 20, 30] 3 4
```
- make…makeを使うと、スライスの型、長さ、キャパシティを指定できる。(初めから入れる数がわかっているのであれば、このmake関数を使うと効率的)
```go
x := make([]型, 長さ, 容量)

// int型、長さ5のスライス
x := make([]int, 5)

// int型、長さ5、容量10のスライス
x := make([]int, 5, 10)
```
- スライスを空にする…clear関数を使うと、スライスの全ての要素を空にできる
```go
s := []string{"first", "second", "third"}
fmt.Println(s, len(s), cap(s)) // [first second third] 3 3
clear(s)
fmt.Println(s, len(s), cap(s)) // [  ] 3 3
```
- スライスの生成方法の選択
  - スライスに初期値を設定しない場合
    ```go
    var data []int // スライスのゼロ値nilで初期化される
    fmt.Println(data == nil)

    // var x = []int{}は異なるもの
    ```
  - 初期値がある場合、あるいはスライスの値が変化しない場合
    ```go
    data := []int{2, 4, 6, 8}
    fmt.Println(data)
    ```
- スライスのスライス…スライス式は、スライスから別のスライスを作るためのもので、[n:m]の形式で書く。
```go
func main() {
    x := []int{1, 2, 3, 4}
    y := x[:2]
    z := x[1:]
    d := x[1:3]
    e := x[:] // これは0から最後まで
	fmt.Println("x:", x) // 1,2,3,4
	fmt.Println("y:", y) // 1,2
	fmt.Println("z:", z) // 2,3,4
	fmt.Println("d:", d) // 2,3
	fmt.Println("e:", e) // 1,2,3,4
}
```
```go
// スライスからスライスを取り出すとき、値渡しのため、その要素を共有する全てのスライスに影響する
x := []int{1, 2, 3, 4}
y := x[1:3]
y[0] = 10
fmt.Println(y) // [10,3]
fmt.Println(x) // [1,10,3,4]
```
- スライスの記憶領域の共有
```go
func main() {
	x := make([]int, 0, 5)              // 長さ0,容量5のスライス
	x = append(x, 1, 2, 3, 4, 5)        // [1,2,3,4,5] 長さ5,容量5のスライス
	y := x[:2]                          // [1,2] 長さ2,容量5のスライス
	z := x[2:]                          // [3,4,5] 長さ3,容量3のスライス
	fmt.Println(cap(x), cap(y), cap(z)) // 5,5,3
	y = append(y, 30, 40, 50)
	x = append(x, 60)
	z = append(z, 70)
	fmt.Println("x:", x) // [1,2,30,40,50,60]
	fmt.Println("y:", y) // [1,2,30,40,50]
	fmt.Println("z:", z) // [30,40,50,70]
}
```
```go
// 以上にて、容量が異なるのは、「スライスの容量はスライスの開始点から基礎となるスライスの終了点の距離として計算される」ため。
	y := x[:2]                          // [1,2] 長さ2,容量5のスライス
	z := x[2:]                          // [3,4,5] 長さ3,容量3のスライス
```
- フルスライス式…フルスライス式を使うと、新しいメモリ領域を確保してくれるため、appendによる上書きが起こらない
```go
// フルスライス式slice[low:high:max]
// low: スライスの開始インデックス
// high: スライスの終了インデックス(含まない)
// max: 新しいスライスの容量の上限
// 容量はmax - lowになる
func main() {
	x := make([]int, 0, 5)    // 長さ0,容量5のスライス
	x = append(x, 1, 2, 3, 4) // [1,2,3,4] 長さ4,容量5
	y := x[:2:2]              // [1,2] 長さ2,容量2
	z := x[2:4:4]             // [3,4] 長さ2,容量2
	fmt.Println(cap(x), cap(y), cap(z))
	y = append(y, 30, 40, 50)
	x = append(x, 60)
	z = append(z, 70)
	fmt.Println("x:", x)
	fmt.Println("y:", y)
	fmt.Println("z:", z)
}
```
- スライスのコピー…スライスからスライスすると、値渡しになってしまい、スライス先の値を変更すると、基のスライスまで変更されてしまう。コピーを行えば、参照渡しになるのでもとのスライスに影響しない。
```go
func main() {
	x := []int{1, 2, 3, 4}
	y := make([]int, 4)
	num := copy(y, x)
	y[0] = 100
	fmt.Println(y, num) // [100,2,3,4] 4
	fmt.Println(x, num) // [1,2,3,4] 4
}
```
- 配列のスライスへの変換
```go
// スライス同様、値渡しのため、元の配列も変わってしまう
func main() {
	x := [4]int{5, 6, 7, 8}
	y := x[:2]
	z := x[2:]
	x[0] = 10
	fmt.Println(x) // [10,6,7,8]
	fmt.Println(y) // [10,6]
	fmt.Println(z) // [7,8]
}
```
- メモリを共有しないスライスのコピー…オリジナルのスライスとはメモリを共有しないスライスを生成する必要があるのならば、makeと組み込み関数copyを使う。
```go
func main() {
	x := []int{1, 2, 3, 4}
	y := make([]int, 4)
	num := copy(y, x)
	fmt.Println(y, num)
	y = append(y, 10)
	fmt.Println(y)
}
```
- スライスの配列への変換…スライスを配列に変換すると、スライス内のデータは新しいメモリにコピーされる、つまりスライスを変更しても元の配列には影響しない
```go
// スライスを配列に変換すると、スライス内のデータは新しいメモリにコピーされる、つまりスライスを変更しても元の配列には影響しない
func main() {
	xSlice := []int{1, 2, 3, 4}
	xArray := [4]int(xSlice)
	smallArray := [2]int(xSlice)
	xSlice[0] = 10
	fmt.Println(xSlice)     // [10,2,3,4]
	fmt.Println(xArray)     // [1,2,3,4]
	fmt.Println(smallArray) // [1,2]
}
```
### 整数
- 整数型を定義するキーワードは`int`
- int8、int16、int32、int64の各型が用意されている。
- 符号なしを使いたい場合には、uintを用いる。(uint8、uint16、uint32、uint64)(unsigned integer:符号なし整数)
    ```go
    var integer8 int8 = 127
    var integer16 int16 = 32767
    var integer32 int32 = 2147483647
    var integer64 int64 = 9223372036854775807
    fmt.Println(integer8, integer16, integer32, integer64) 

    //別の型を足すとエラーになる
    var integer16 int16 = 127
    var integer32 int32 = 32767
    fmt.Println(integer16 + integer32)

    invalid operation: integer16 + integer32 (mismatched types int16 and int32)
    ```
- rune(ルーン)型はint32の別名。Unicode文字を表すために使用される。
    ```go
    rune := 'G'
    fmt.Println(rune)
    ```

### 浮動小数点数
- Goには2つのサイズの浮動小数点データ型がある。(`float32`、`float64`)
    ```go
    var float32 float32 = 2147483647
    var float64 float64 = 9223372036854775807
    fmt.Println(float32, float64)
    ```
- 型の限界は、mathパッケージの`math.MaxFloat32`、`math.MaxFloat64`定数で調べられる。
    ```go
    fmt.Println(math.MaxFloat32, math.MaxFloat64)
    ```

### 真偽値
- 真偽値(ブール値)の可能な値は、`true`と`false`だけ。ブール型を宣言するには`bool`を用いる。
    ```go
    var featureFlag bool = true
    ```

### 文字列
- Go言語の文字列はruneではなく、バイト列を使っている。
- Goのソースコードは常にUTF-8で記述される。
- 配列やスライス同様、一つの文字を抽出できる。しかし、配列やスライスのように変更はできない。(immutable:不変)
```go
func main() {
	var s string = "Hello there"
	var s2 string = s[4:5]
	fmt.Println(s2) // o
}
```
- UTF-8のコードポイントは1バイトから4バイトの長さを持っている。漢字や絵文字では1バイト以上使う。
  - Goでは文字列に対してスライスとインデックスの構文を使うことができるが、文字列が1バイトの文字しか含んでいない場合にのみ使うべき
```go
// 組み込み関数lenにより、文字列の長さを出力できる
func main() {
	var s string = "☀"
	fmt.Println(len(s)) // 3 3バイト使っている
}
```
- rune、文字列、バイトの間には複雑な関係があるので、runeあるいはバイトは文字列に変換できる。
```go
func main() {
	var a rune = 'x'          // rune型のため、シングルクォーテーションで囲う
	var s string = string(a)  // string型に変換
	var b byte = 'y'          // byte型のため、シングルクォーテーションで囲う
	var s2 string = string(b) // string型に変換
}
```
- 文字列は、runeのスライス、バイトのスライスに変換可能。
```go
func main() {
	var s string = "Hello,"
	var bs []byte = []byte(s)
	var rs []rune = []rune(s)
	fmt.Println(bs)
	fmt.Println(rs)
}
```
- UTF-8について
  - Unicodeとは…世界中のほとんどの文字を一貫して表現するための標準化された文字コード。Unicodeは文字や記号に対して一意のコードポイント(番号)を割り当てることで、様々な文字セット間の互換性と一貫性を提供する。
  - コードポイント…Unicodeで各文字や記号に一意に割り当てられた番号のこと。コードポイントは「U+」で始まる16進数で表現される。英文字の「A」は`U+0041`、漢字の「漢」は`U+6F22`などで表される。
  - UTF-8…Unicode文字をエンコードするための可変長エンコーディング方式の1つ。(1バイトは8ビット)
    - 1バイト：ASCII文字
    - 2バイト：追加のラテン文字やギリシャ文字
    - 3バイト：基本多言語面の多くの文字
    - 4バイト：追加面の文字
- `string`を用いて文字列データ型を表す。文字列変数を初期化するには、ダブルクォーテーションで囲う。(シングルクォーテーションはruneとバイト)
    ```go
    var firstName string = "John"
    lastName := "Doe"
    fmt.Println(firstName, lastName)
    ```
- エスケープ文字については以下
    ```go
    // 改行
    kaigyou := "改行 \n これで改行"
    fmt.Println(kaigyou)

    // 復帰
    fukki := "ここの部分は表示されない\rこれで復帰"
    fmt.Println(fukki)

    // タブ
    tab := "タブ\tここの左にタブが入る"
    fmt.Println(tab)

    // 単一引用符(エスケープの必要ない？？)
    singleInyouhu := "これで'シングルクォーテーションをエスケープ"
    fmt.Println(singleInyouhu)

    // 二重引用符
    doubleInyouhu := "これで\"ダブルクォーテーションをエスケープ"
    fmt.Println(doubleInyouhu)

    // バックスラッシュ
    backslash := "これで\\バックスラッシュをエスケープ"
    fmt.Println(backslash)
    ```
## 各データ型の初期値(既定値)
- 以下で初期値を確認できる
    ```go
    var defaultInt int
    var defaultFloat32 float32
    var defaultFloat64 float64
    var defaultBool bool
    var defaultString string
    fmt.Println(defaultInt, defaultFloat32, defaultFloat64, defaultBool, defaultString)
    ```
## 型の変換
```go
var integer16 int16 = 127
var integer32 int32 = 32767
fmt.Println(int32(integer16) + integer32)
```
- strconvはGo言語の組み込みパッケージで、数値やbool型をstring型に、string型を他の型にコンバージョンする。
```go
// 文字列から数値に変換
i, _ := strconv.Atoi("42")

// 数値から文字列に変換
s := strconv.Itoa(-42)

fmt.Println(i, s)
```

## 関数
- 入力値を受け取り、命令を実行し、出力値を返すまでの複合分のこと。
- アプリケーションの他の部分から呼び出せる一連のステートメントを関数としてグループ化できる。
- 関数を使用してコードを整理し、読みやすくすることで保守性が向上する。
- 関数は0個以上の引数を取れる。
    ```go
    func add(x int, y int) int {
        return x + y
    }

    //複数の引数が同じ型の場合は、省略可能
    func add(x, y int) int {
        return x + y
    }
    ```
- 複数の戻り値を返せる
    ```go
    func swap(x, y string) (string, string) {
        return y, x
    }

    func main() {
        a, b := swap("hello", "world")
        fmt.Println(a, b)
    }
    ```
    - 戻り値に名前を付けることができる(returnに何も書かずに返せる)
    ```go
    func split(sum int) (x, y int) {
        x = sum * 4 / 9
        y = sum - x
        // 返り値にx,yと命名することで、returnを命名しなくてもよい
        return
    }

    func main() {
        fmt.Println(split(17))
    }
    ```
- 可変長引数
  - Go言語においても可変長引数を取ることができる。型の前に「...」を付けて表す。
  - 可変長引数は、引数リストの最後のものでなければならない。
    ```go
    func addTo(base int, vals ...int) []int {
        out := make([]int, 0, len(vals))
        for _, v := range vals {
            out = append(out, base+v)
        }
        return out
    }

    func main() {
        fmt.Println(addTo(3))             // []
        fmt.Println(addTo(3, 2))          // [5]
        fmt.Println(addTo(3, 2, 4, 6, 8)) // [5,7,9,11]
    }
    ```
- 複数の戻り値
    ```go
    func divAndRemainder(numerator int, denominator int) (int, int, error) {
        if denominator == 0 {
            return 0, 0, errors.New("Cannot divide by zero")
        }
        return numerator / denominator, numerator % denominator, nil
    }

    func main() {
        result, remainder, err := divAndRemainder(5, 2)
        if err != nil {
            fmt.Println(err)
            os.Exit(1)
        }
        fmt.Println(result, remainder)
    }
    ```
- 戻り値の無視…関数を呼び出してもその戻り値をすべて使うわけでない場合、_(アンダースコア)を用いる。Goでは宣言した変数を全て使わなくてはならないため。
    ```go
    result, _ := divAndRemainder(5,2)
    ```
- 名前付き戻り値…関数から複数の値を返せるだけでなく、戻り値の名前も指定できる。
    ```go
    func divAndRemainder(numerator int, denominator int) (result int, remainder int, err error) { // 戻り値に名前を指定できる
        if denominator == 0 {
            return numerator, denominator, errors.New("0で割ることはできません")
        }
        result, remainder = numerator/denominator, numerator%denominator
        return result, remainder, err
    }
    ```
- 無名関数…関数を変数に代入して使うことができる。defer文やゴルーチンで使われる。
    ```go
    func main() {
        for i := 0; i < 5; i++ {
            func(j int) {
                fmt.Println("無名関数の中で", j, "を出力")
            }(i)
        }
    }
    ```
- クロージャー…関数f内で定義された関数gは、外側の関数f内で定義された変数にアクセスしたりできる。関数内で定義された関数gをクロージャー(Closure)と呼ぶ。
  - sortで使用する例
    ```go
    func main() {
        var list []int = []int{3, 5, 1, 4, 2}
        fmt.Println("変更前：", list) // [3, 5, 1, 4, 2]

        sort.Slice(list, func(i, j int) bool {
            return list[i] < list[j]
        })
        fmt.Println("変更後：", list) // [1 2 3 4 5]
    }
    ```
  - 関数の中で定義された変数をその環境ごと包み込んで持ち出して、関数の外でも使用する例
    ```go
    func incrementer(base int) func() int {
        i := 0
        return func() int {
            i = i + base
            return i
        }
    }

    func main() {
        oneIncrementer := incrementer(2)
        for i := 0; i < 5; i++ {
            fmt.Println(oneIncrementer())
            // 2 4 6 8 10と出力されていく
        }
    }
    ```
  **参考サイト**
  (Goでクロージャーを使用する理由)[https://engineer-want-to-grow.com/go-closure/]
- 関数引数…関数を別の関数の引数として渡すことができる。以下の例だと、sort.Slice()関数を用い、引数にスライスと関数を渡している。
    ```go
    func main() {
        // 構造体の宣言
        type Person struct {
            FirstName string
            LastName  string
            Age       int
        }

        // スライスの宣言
        people := []Person{
            {"Pat", "Patterson", 37},
            {"Tracy", "Bobbert", 23},
            {"Fred", "Fredson", 18},
        }
        fmt.Println("●初期データ")
        fmt.Println(people) //listend1

        // 姓（LastName）でソート //liststart2
        sort.Slice(people, func(i int, j int) bool {
            return people[i].LastName < people[j].LastName
        })
        fmt.Println("●姓（LastName。2番目のフィールド）でソート")
        fmt.Println(people) //listend2

        // 年齢（Age）でソート //liststart3
        sort.Slice(people, func(i int, j int) bool {
            return people[i].Age < people[j].Age
        })
        fmt.Println("●年齢（Age）でソート")
        fmt.Println(people) //listend3
    }
    ```
- 関数から関数を返す
    ```go
    func makeMult(base int) func(int) int {
        return func(factor int) int {
            return base * factor
        }
    }

    func main() {
        twoBase := makeMult(2)
        threeBase := makeMult(3)
        for i := 0; i <= 5; i++ {
            fmt.Print(i, ": ", twoBase(i), ", ", threeBase(i), "\n")
        }
    }

    /*
    twoBaseやthreeBaseは
    func(factor int) int {
        return base * factor
    }
    の関数を指す。
    */
    ```
- defer…関数終了時に特定の処理を実行するために使用される。プログラムではファイルやネットワーク接続といった一時的なリソースを作成することがよくあるが、そういったリソースは後始末(クリーンアップ)が必要になる。
    ```go
    func main() {
        // ファイルを開く
        file, err := os.Open("example.txt")
        if err != nil {
            fmt.Println("Error opening file:", err)
            return
        }

        // 関数が終了する前にファイルを閉じる
        defer file.Close()

        // ファイル操作を実行
        buf := make([]byte, 1024)
        for {
            n, err := file.Read(buf)
            if err != nil {
                break
            }
            fmt.Print(string(buf[:n]))
        }

        fmt.Println("File reading completed.")
    }
    ```
  - deferの実行順序…LIFO(Last In, First Out)の順で実行される。
    ```go
    func main() {
        a := "1番目"
        b := "2番目"
        c := "3番目"
        d := "4番目"

        defer fmt.Println(a)
        defer fmt.Println(b)
        defer fmt.Println(c)
        defer fmt.Println(d)

        /*
        4番目
        3番目
        2番目
        1番目
        */
    }
    ```
- 値渡しについて…Go言語は値渡しの言語。値渡しは関数に引数を渡した際に必ず引数の値を作るということ。


- main関数
  - main関数はプログラムの開始点であるため、全ての実行可能プログラムにはmain関数がある。
  - プログラムに存在できるmain関数は1つだけ。
  - パッケージを作成する場合には、main関数を記述する必要はない。
  - main関数には、パラメーターが一つもなく、何も返さない。(しかしユーザーから値を読み取れないというわけではない、os.Args変数を使用できる)
    ```go
    func main() {
        number1, _ := strconv.Atoi(os.Args[1])
        number2, _ := strconv.Atoi(os.Args[2])
        fmt.Println("Sum:", number1+number2)
    }
    ```
- カスタム関数
    ```go
    func sum(number1 string, number2 string) int {
        int1, _ := strconv.Atoi(number1)
        int2, _ := strconv.Atoi(number2)
        return int1 + int2
    }
    ```
- 複数の値を返す
    ```go
    func calc(number1 string, number2 string) (sum int, mul int) {
        //関数の戻り値のいずれかが不要になった場合に_変数に代入することで戻り値を破棄できる
        int1, _ := strconv.Atoi(number1)
        int2, _ := strconv.Atoi(number2)
        sum = int1 + int2
        mul = int1 * int2
        return
    }
    ```
- 関数のパラメーター値(ポインタ)を変更する
  - ポインタは、メモリ上の特定の場所(アドレス)を指す変数。
  - ポインタを使うことで、変数の値を直接操作することができる。(値渡しではなく、参照渡し)
  - &演算子を用いると、メモリアドレスを取得、*を用いると、メモリの値を取得。
    ```go
    package main

    import "fmt"

    func main() {
        i, j := 42, 2701

        // ポインタの取得
        // &演算子を使って、変数iのメモリアドレスを取得し、それをポインタ変数pに代入している。
        p := &i

        // ポインタを通じて値を読み取る
        // *pはポインタpが指すアドレスにある値を取得する。
        // pのみだと、メモリアドレスが表示される
        fmt.Println(*p)

        // ポインタを通じて値を変更する
        *p = 21
        fmt.Println(i)

        // 別の変数を指すポインタに変更する
        p = &j

        // 別の変数の値をポインタを通じて操作する
        *p = *p /37
        fmt.Println(j)
    }
    ```
- ポインタの利点
  - 効率的なメモリ使用…ポインタを使うことで、大きなデータ構造をコピーせずに関数間で渡すことができる。
  - 参照渡し…ポインタを使うことで、関数が引数として受け取った変数の値を直接変更できる。
  - データ構造の操作…リンクリストやツリーなどのデータ構造を実装する際に重要な役割を果たす。
- 値渡しと参照渡しの違い
  - 値渡し…関数に引数として渡されるデータのコピーが関数内で使用される。つまり、関数内でその引数を変更しても、元の変数には影響を与えない。
  - numの値がchangeValue関数に渡されるが、関数内で変更してもmain関数内のnumには影響ない。
    ```go
    package main

    import "fmt"

    func changeValue(val int) {
        val = 100
    }

    func main() {
        num := 10
        changeValue(num)
        fmt.Println(num) // 出力：10
    }
    ```
  - 参照渡し…関数に引数として渡されるのは、データのアドレス(ポインタ)。これにより、関数内でそのデータを変更すると、元の変数に直接影響を与える。
  - numのアドレス(ポインタ)がchangeValue関数に渡される。関数内でポインタを通じてnumの値を変更すると、その変更がmain関数内のnumにも影響を与える。
    ```go
    package main

    import "fmt"

    func changeValue(val *int) {
        *val = 100
    }

    func main() {
        num := 10
        changeValue(&num)
        fmt.Println(num) // 出力：100
    }
    ```



## 構造体について
- 構造体は、異なる種類のデータをまとめて1つのまとまりとして扱うための仕組み。例えば、一人の人に関する情報(名前、年齢、身長など)をひとつの構造体にまとめることができる。
- 利点
  - データの整理と管理：構造体を使うと、関連するデータをまとめられる。人の名前や年齢など
  - コードの可読性向上：データがまとまっているため、何を扱っているか明確でコードがわかりやすくなる。
  - 再利用性の向上：一度定義した構造体は、他の場所でも再利用できるのでコードの重複を避け、保守が楽になる。
  - メモリ効率の向上：構造体を使うことで、関連データが連続したメモリ領域に格納され、アクセスが効率的になる。
  - データの一貫性：構造体を使うことで、関連データが一緒に管理されるので、一貫性が保ちやすくなる。
- マップにおいてもキーと値でまとめてデータを扱えるが、特定のキーだけを含むような限定されたマップの定義ができない。(キーが限定されていないので、誤ったキーを追加する可能性がある)加えてマップのキーの値はすべて同じ型でなければならない。
- 構造体では特定のフィールドだけを持ち、各フィールドに異なる型の値を持つことができる。これにより、型安全性が向上し、予期しないキーの追加を防ぐことができる。
    ```go
    // マップを使う場合の限界
    func main() {
        // マップを使って情報を格納する
        person := map[string]interface{}{
            "name": "Alice",
            "age":  30,
            "city": "New York",
        }

        // キーが限定されていないので、誤ったキーを追加する可能性がある
        person["unknown"] = "test"
        fmt.Println(person) // map[age:30 city:New York name:Alice unknown:test]
    }
    ```
    ```go
    func main() {
        // Person構造体の定義
        type Person struct {
            Name string
            Age  int
            City string
        }

        // 構造体を使って情報を格納する
        person := Person{
            Name: "Alice",
            Age:  30,
            City: "New York",
        }

        // このように誤ったフィールドを追加することはできないので安全
        // 新しくフィールドを追加する場合は、構造体の中に追加する
        // person.Unknown = "test"
    }
    ```
- 構造体の定義方法
    ```go
    // type 構造体の名前 struct {フィールド名 フィールドの型}
    type Person struct {
        name string
        age int
        pet string
    }
    ```
  - 構造体を宣言したら、その構造体を型として持つ変数を定義できる。
    ```go
    var fred Person
    fmt.Println(fred) // { 0 }
    ```
  - 構造体リテラルを変数に代入することも可能。
    ```go
    fred := Person{}
    fmt.Println(fred) // { 0 }
    ```
  - 構造体への値の代入の仕方
    ```go
    func main() {
        // 値の代入方法1
        julia := Person{
            "ジュリア",
            40,
            "cat",
        }
        fmt.Println(julia)

        // 値の代入方法2(フィールドの順番や値を指定しないフィールドがあっても問題ない)
        taro := Person{
            name: "たろう",
            age:  20,
        }
        fmt.Println(taro)
        fmt.Println(taro.name) // 構造体のフィールドにアクセスするには「.」を用いてアクセスできる
    }
    ```
- 無名構造体…名前付き構造体と同じように代入したり、値を呼び出したりできる。
  - 用途
    - 外部データを構造体に変換(アンマーシャリング(unmarshaling))
    - 構造体を外部データ(JSON)に変換(マーシャリング(marshaling))
    - テスト：テーブル駆動のテストを書く際に無名構造体のスライスを使う
    ```go
    func main() {
        // 無名の構造体
        var person struct {
            name string
            age  int
            pet  string
        }
        person.name = "ボブ"
        person.age = 50
        person.pet = "dog"

        // 無名の構造体
        pet := struct {
            name string
            kind string
        }{
            name: "ポチ",
            kind: "dog",
        }
        fmt.Println(pet.name)
    }
    ```
- 構造体の比較と変換
  - 比較可能な構造体の例
    ```go
    // 全てのフィールドが比較可能な型のため、この構造体は比較可能
    type Person struct {
        Name string
        Age  int
        Pet  string
    }

    func main() {
        // 構造体のインスタンスを作成し、変数に代入
        person1 := Person{Name: "Alice", Age: 30, Pet: "Cat"}
        person2 := Person{Name: "Alice", Age: 30, Pet: "Cat"}
        person3 := Person{Name: "Bob", Age: 30, Pet: "Cat"}

        fmt.Println(person1 == person2) // true
        fmt.Println(person1 == person3) // false
    }
    ```
  - 比較不可能な構造体の例
    ```go
    // スライス、マップ、関数、チャネルなどの比較不可能なフィールドを持つ構造体は直接比較不可
    type PersonWithSlice struct {
        Name string
        Age  int
        Pets []string
    }

    func main() {
        // 構造体のインスタンスを作成し、変数に代入
        person1 := PersonWithSlice{Name: "Alice", Age: 30, Pets: []string{"Cat"}}
        person2 := PersonWithSlice{Name: "Alice", Age: 30, Pets: []string{"Cat"}}

        // 比較不可能なフィールドを持つ構造体は==で比較できない
        // fmt.Println(person1 == person2)
    }
    ```
  - 自作の関数で等価性を再定義
    ```go
    type PersonWithSlice struct {
        Name string
        Age  int
        Pets []string // スライスは比較不可能
    }

    // 自作の等価性比較関数
    func areEqual(p1, p2 PersonWithSlice) bool {
        if p1.Name != p2.Name || p1.Age != p2.Age {
            return false
        }
        return reflect.DeepEqual(p1.Pets, p2.Pets)
    }

    func main() {
        person1 := PersonWithSlice{Name: "Alice", Age: 30, Pets: []string{"Cat", "Dog"}}
        person2 := PersonWithSlice{Name: "Alice", Age: 30, Pets: []string{"Cat", "Dog"}}
        person3 := PersonWithSlice{Name: "Bob", Age: 25, Pets: []string{"Cat"}}

        // 自作の関数を使って等価性を比較
        fmt.Println(areEqual(person1, person2))
        fmt.Println(areEqual(person1, person3))
    }
    ```
  - 型の異なる構造体の比較
    ```go
    type Person struct {
        Name string
        Age  int
        Pet  string
    }

    type AnotherPerson struct {
        Name string
        Age  int
        Pet  string
    }

    func main() {
        person := Person{Name: "Alice", Age: 30, Pet: "Cat"}
        anotherPerson := AnotherPerson{Name: "Alice", Age: 30, Pet: "Cat"}

        // 型の異なる構造体は比較できない
        // fmt.Println(person == anotherPerson)

        // 型変換をすることで比較可能、ただしフィールドの名前、順番、型が一致している場合のみ
        convertedPerson := Person(anotherPerson)
        fmt.Println(person == convertedPerson)
    }
    ```
- 構造体は、複数のフィールドを持つデータ型を定義するための方法。
  - 構造体を使うことで、関連するデータをグループ化し、1つの複合データ型として扱うことができる。
    ```go
    package main

    import "fmt"

    // 構造体
    type Person struct {
        Name string
        Age  int
    }

    func main() {
        // Person構造体のインスタンスを作成
        // 構造体の初期化
        p1 := Person{Name: "Alice", Age: 30}
        p2 := Person{"Bob", 25}

        // フィールドにアクセス
        fmt.Println(p1.Name, p1.Age)
        fmt.Println(p2.Name, p2.Age)

        // フィールドの値を変更
        p1.Age = 31
        fmt.Println(p1.Age)
    }
    ```
- 構造体の埋め込み
  - 構造体に別の構造体を埋め込むことができる。
    ```go
    type Person struct {
        ID        int
        FirstName string
        LastName  string
        Address   string
    }

    type Employee struct {
        // 別の構造体を埋め込む
        Information Person
        ManagerID   int
    }

    // このフィールドを参照する場合(Informationフィールドを含める必要がある)
    var employee Employee
    employee.Information.FirstName = "John"
    ```
- 構造体のインスタンス化…構造体をもとにして、実際のデータを作成すること。構造体のフィールドに具体的な値を割り当てること。
    ```go
    type Person struct {
        ID        int
        FirstName string
        LastName  string
    }

    var person = Person{
        ID:        222,
        FirstName: "hogehoge",
        LastName:  "hugahuga",
    }
    ```
- インスタンスとは…特定の型(特に構造体)から生成されたオブジェクトのことを指す。
    ```go
    type Person struct {
        Name string
        Age  int
    }

    func main() {
        // 構造体のインスタンスを生成し、変数に代入
        p2 := Person{Name: "Bob", Age: 25}
        fmt.Println(p2)
    }
    ```
### ポインタと構造体
- 構造体のポインタを使うことで、関数に渡したり、メソッドレシーバとして使用することができる。
    ```go
    package main

    import "fmt"

    type Person struct {
        Name string
        Age  int
    }

    func main() {
        p := Person{Name: "Alice", Age: 30}
        pPointer := &p

        // ポインタを使ってフィールドにアクセス
        fmt.Println(pPointer.Name) // 出力：Alice

        // ポインタを使ってフィールドの値を変更
        pPointer.Age = 31
        fmt.Println(p.Age)
    }
    ```

## パッケージについて
- ソースファイル(.go)の集合体
- Goのパッケージは、他のプログラミング言語のライブラリやモジュールのようなもの。
- コードをパッケージ化すれば、別の場所で再利用できる。

### メインパッケージ
- どんな単純なプログラムでもmainパッケージは必要。
    - コンパイルして実行可能なバイナリファイルを生成するために必要なため。

### パッケージを作成
- package パッケージ名と記述することで、そのGoファイルを初期化し、パッケージとして定義する。
    - 他のGoファイルからパッケージとしてインポートして利用できるようになる。
- プライベートにする要素は、名前の先頭を小文字にすることで、そのファイル内でしか呼び出せない。
- パブリックにする要素は、名前の先頭を大文字にすることで、他のファイルからも呼び出せる。
    ```go
    // パッケージの名前でgoファイルを初期化する
    package calculator

    var logMessage = "[LOG]"

    // Version of the calculator
    var Version = "1.0"

    func internalSum(number int) int {
        return number - 1
    }

    // Sum two integer numbers
    func Sum(number1, number2 int) int {
        return number1 + number2
    }
    ```
- 上記のパッケージを利用するには、
    ```go
    package main

    import (
        "fmt"
        "helloworld/calculator"
    )

    func main() {
        result := calculator.Sum(3, 5)
        fmt.Println("Sum:", result)
        fmt.Println("Calculator Version:", calculator.Version)
    }
    ```
### モジュールについて
- パッケージの集合体
- モジュールとは、パッケージを管理し、他のプロジェクトで再利用するための仕組み。
- 複数のGoパッケージをまとめて管理するための仕組み。

## go.modファイル
- 自モジュールの設定に関する内容が記述されているファイル。
  - 公開場所
  - 動作するGoのバージョン
  - 直接的な依存先モジュール
  - 間接的な依存先モジュール
- ファイルの作り方の流れ(新規開発する際)
  - go mod <自モジュール置き場のURL>→go.modが新規作成される。
  - go mod tidyにて、go.modとgo.sumファイルを整理する。
- ローカルリポジトリで複数モジュールを扱う際、モジュール間を跨いで関数の受け渡しを行うにはgo.modファイルを変更する必要がある。
  - 書き換えないで済むように最初からリモートに上げた時に合わせる。
    ```go
    // go.mod

        module github.com/hogehoge/hoge-project

        go 1.22.3
    ```
- とあるが、上記は利便性に欠ける。
また、VSCodeはマルチモジュールに対応していない。
(greetingsとhelloは各々ではコンパイル実行できるが、このルートディレクトリではコンパイル実行できない。)
そのため、go.workとvscodeのワークスペースを使うと、便利。

## 条件式について
### if/else文
- 他のプログラミング言語と異なり、Goでは条件をかっこで囲う必要がない。
    ```go
    func main() {
        x := 27
        if x%2 == 0 {
            fmt.Println(x, "is even")
        }
    }

    //else if文
    func main() {
        if num := givemeanumber(); num < 0 {
            fmt.Println(num, "is negative")
        } else if num < 10 {
            fmt.Println(num, "has only digit")
        } else {
            fmt.Println(num, "has multiple digits")
        }
    }
    ```

### switch文
- 一致する条件が見つかるまで、switch文の各ケースが比較される。
- Go言語では、他言語と異なり、選択されたcaseだけを実行して、すべてのcaseは実行されない。
  - 他言語では各caseの最後にbreakが必要であるが、Goでは自動的に提供される。
    ```go
    func main() {
        sec := time.Now().Unix()
        rand.Seed(sec)
        i := rand.Int31n(10)

        switch i {
        case 0:
            fmt.Print("zero...")
        case 1:
            fmt.Print("one...")
        case 2:
            fmt.Print("two...")
        default:
            fmt.Print("no match")
        }

        fmt.Println("ok")
    }
    ```
- 複数の式も含めることができる。
    ```go
    func location(city string) (string, string) {
        var region string
        var continent string
        switch city {
        case "Delhi", "Hyderabad", "Mumbai", "Chennai", "Kochi":
            region, continent = "India", "Asia"
        case "Lafayette", "Louisville", "Boulder":
            region, continent = "Colorado", "USA"
        case "Irvine", "Los Angeles", "San Diego":
            region, continent = "California", "USA"
        default:
            region, continent = "Unknown", "Unknown"
        }
        return region, continent
    }

    func main() {
        region, continent := location("Irvine")
        fmt.Printf("John works in %s, %s\n", region, continent)
    }
    ```
- 関数の呼び出し
    ```go
    func main() {
        // switchで関数を呼び出すこともできる
        switch time.Now().Weekday().String() {
        case "Monday", "Tuesday", "Wednesday", "Thursday", "Friday":
            fmt.Println("It's time to learn some Go.")
        default:
            fmt.Println("It's the weekend, time to rest!")
        }
        fmt.Println(time.Now().Weekday().String())
    }
    ```
- 条件を省略する
    ```go
    func main() {
        rand.Seed(time.Now().Unix())
        r := rand.Float64()
        switch {
        case r > 0.1:
            fmt.Println("Common case, 90% of the time")
        default:
            fmt.Println("10% of the time")
        }
    }
    ```
- ロジックが次のcaseにフォールスルーされるようにする(fallthrough)
    ```go
    func main() {
        switch num := 15; {
        case num < 50:
            fmt.Printf("%d is less than 50\n", num)
            // fallthroughすることで、caseを検証せずに次のステートメントに直ちに移動する
            fallthrough
        case num > 100:
            fmt.Printf("%d is greater than 100\n", num)
            fallthrough
        case num < 200:
            fmt.Printf("%d is less than 200", num)
        }
    }
    ```
### for文
- forループはコロンで3つの部分に分けられている
  - 初期化ステートメント：最初のイテレーション(繰り返し)の前に初期化が実行される。
  - 条件式：イテレーション毎に評価される。
  - 後処理ステートメント：イテレーション毎の最後に実行される。
- if文やswitch文と同様、for文にもかっこは必要ない。
    ```go
    func main() {
        sum := 0
        for i := 1; i <= 100; i++ {
            sum += i
        }
        fmt.Println("sum of 1..100 is", sum)
    }
    ```
- for文の初期化ステートメントと後処理ステートメントを空にして、他のプログラミング言語のwhile文のようなふるまいをさせる。(その条件が満たされている限りはループを回す)
    ```go
    func main() {
        var num int64 //初期値0
        rand.Seed(time.Now().Unix())
        for num != 5 {
            num = rand.Int63n(15)
            fmt.Println(num)
        }
    }
    ```
- 無限ループとbreak文…for文において、条件式を記述しなければ無限ループとなる。
    ```go
    func main() {
        var num int32
        sec := time.Now().Unix()
        rand.Seed(sec)

        for {
            fmt.Print("Writing inside the loop...")
            if num = rand.Int31n(10); num == 5 {
                fmt.Println("finish!")
                // breakを使うことでif文の条件に合った際に無限ループを止める
                break
            }
            fmt.Println(num)
        }
    }
    ```
- continue文を使うと、一定条件のみ飛ばして、ループを続けてくれる。
    ```go
    func main() {
        sum := 0
        for num := 1; num <= 100; num++ {
            if num%5 == 0 {
                // ここで次のループに行く
                continue
            }
            // 条件式に合致する場合はスルー
            sum += num
        }
        fmt.Println("The sum of 1 to 100, but excluding numbers divisible by 5, is", sum)
    }
    ```
- forループに使うrangeは、スライスやマップをひとつずつ反復処理するために使う
  - 一つ目の変数は、index、二つ目の変数は、indexの場所の要素のコピー
    ```go
    var pow = []int{1, 2, 4, 8, 16, 32, 64, 128}

    func main() {
        // rangeで書く場合
        for i, v := range pow {
            fmt.Printf("2**%d = %d\n", i, v)
        }
        // for文のみで書く場合
        for i := 1; i < len(pow); i++ {
            v := pow[i]
            fmt.Printf("2**%d = %d\n", i, v)
        }
    }
    ```
  - indexや値は、_を代入することで、捨てることができる。
    ```go
    func main() {
        // indexや値は_を代入することで、捨てることができる
        for _, v := range pow {
            fmt.Println(v)
        }
    }
    ```
## defer、panic、recoverについて
### defer関数(延期する)
- defer文を使うと、関数が終了するまで関数の実行が延期される。
- defer文は、最後から最初へと逆の順序で実行される。
    ```go
    func main() {
        for i := 1; i <= 4; i++ {
            defer fmt.Println("deferred", -i)
            fmt.Println("regular", i)
        }
    }
    ```
- deferの一般的な使い方は、ファイルの使用が終了した後でファイルを閉じること。
    ```go
    package main

    import (
        "fmt"
        "io"
        "os"
    )

    func main() {
        newfile, error := os.Create("learnGo.txt")
        if error != nil {
            fmt.Println("Error: Could not create file.")
            return
        }
        defer newfile.Close()
        // deferを付けないと、以下の処理がされない状態で関数の処理が終了してしまう。
        // newfile.Close()

        if _, error = io.WriteString(newfile, "Learning Go!"); error != nil {
            fmt.Println("Error: Could not write to file.")
            return
        }

        newfile.Sync()
    }
    ```
### panic関数
- 関数がエラーを返し、そのエラーにどう対象すべきかわからない場合にpanicを呼んでプログラムを中断させる。
    ```go
    func highlow(high int, low int) {
        if high < low {
            fmt.Println("Panic!")
            panic("highlow() low greater than high")
        }
        defer fmt.Println("Defered: highlow(", high, ",", low, ")")
        fmt.Println("Call: highlow(", high, ",", low, ")")

        // highlow関数自身を再帰的に呼び出している、条件が満たされる限り自分自身を呼び出し続けるため、ループのような動作をする。
        highlow(high, low+1)
    }

    func main() {
        highlow(2, 0)
        fmt.Println("Program finished successfully!")
    }
    ```
### recover関数
- パニックの後に制御を取り戻すことができる。
    ```go
    func highlow(high int, low int) {
        if high < low {
            fmt.Println("Panic!")
            panic("highlow() low greater than high")
        }
        defer fmt.Println("Defered: highlow(", high, ",", low, ")")
        fmt.Println("Call: highlow(", high, ",", low, ")")

        highlow(high, low+1)
    }

    func main() {
        defer func() {
            handler := recover()
            if handler != nil {
                fmt.Println("main(): recover", handler)
            }
        }()

        highlow(2, 0)
        fmt.Println("Program finished successfully!")
    }
    ```
## パッケージについて
### math.Pow
- べき乗を計算する。
    ```go 
    func pow(x, n, lim float64) float64 {
        // Powはべき乗、math.Pow(2, 3)で8
        if v := math.Pow(x, n); v < lim {
            return v
        }
        return lim
    }

    func main() {
        fmt.Println(
            pow(3, 2, 10),
            pow(3, 3, 20),
        )
    }
    ```
## 配列
- Goの配列は、特定の型の固定長のデータ構造。
- 0個以上の要素を保持することができ、これらを宣言、初期化するときにサイズを宣言する必要がある。(作成後にサイズを変更できない)
- 配列の宣言
    ```go
    func main() {
        // 配列の宣言(要素数3つ)
        var a [3]int
        a[1] = 10
        fmt.Println(a[0])
        fmt.Println(a[1])
        fmt.Println(a[len(a)-1])
    }
    ```
- 配列の初期化
    ```go
    func main() {
        // 配列の初期化
        cities := [5]string{"New York", "Paris", "Berlin", "Madrid"}
        fmt.Println(cities)
    }
    ```
- 配列の省略…必要な位置の数はわからなくても、データ要素のセットは分かっている場合に省略記号を使う。
    ```go
    func main() {
        // 配列の初期化
        cities := [5]string{"New York", "Paris", "Berlin", "Madrid"}
        fmt.Println(cities)
    }
    ```
- 省略記号を使用し、特定の値指定もできる。
    ```go
    func main() {
        //99番目の値を10に指定する
        numbers := [...]int{99: 10}
        fmt.Println(numbers)
    }

    func main() {
        // 0番目を2に、10番目を1に指定する
        numbers := [...]int{0: 2, 10: 1}
        fmt.Println(numbers)
    }
    ```
- 多次元配列…複合データ構造を使用する必要がある場合に必要。
    ```go
    // 2次元配列
    func main() {
        var twoD [3][5]int
        for i := 0; i < 3; i++ {
            for j := 0; j < 5; j++ {
                twoD[i][j] = (i + 1) * (j + 1)
            }
            fmt.Println("Row", i, twoD[i])
        }
        fmt.Println("\nAll at once:", twoD)
    }
    // 出力結果
    Row 0 [1 2 3 4 5]
    Row 1 [2 4 6 8 10]
    Row 2 [3 6 9 12 15]
    All at once: [[1 2 3 4 5] [2 4 6 8 10] [3 6 9 12 15]]

    // 3次元配列
    func main() {
        var threeD [3][5][2]int
        for i := 0; i < 3; i++ {
            for j := 0; j < 5; j++ {
                for k := 0; k < 2; k++ {
                    threeD[i][j][k] = (i + 1) * (j + 1) * (k + 1)
                }
            }
        }
        fmt.Println("\nAll at once:", threeD)
    }
    // 出力結果
    All at once: [[[1 2] [2 4] [3 6] [4 8] [5 10]] [[2 4] [4 8] [6 12] [8 16] [10 20]] [[3 6] [6 12] [9 18] [12 24] [15 30]]]
    ```
## スライス
- 配列と同様、スライスは同じ型の要素が連続していることを表すデータ型。
  - 配列との違いは、スライスのサイズは固定ではなく、動的(可変長)である。
- スライスのコンポーネントは3つのみ
  - 基となる配列の最初の到達可能な要素へのポインタ
  - スライスの長さ
  - スライスの容量
    ```go
    func main() {
        months := []string{"January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"}
        fmt.Println(months)
        fmt.Println("Length:", len(months))
        fmt.Println("Capacity:", cap(months))
    }
    // 出力結果
    [January February March April May June July August September October November]
    Length: 11
    Capacity: 11

    func main() {
        months := []string{"January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"}
        quarters1 := months[0:3]
        quarters2 := months[3:6]
        quarters3 := months[6:9]
        quarters4 := months[9:12]
        fmt.Println(quarters1, len(quarters1), cap(quarters1))
        fmt.Println(quarters2, len(quarters2), cap(quarters2))
        fmt.Println(quarters3, len(quarters3), cap(quarters3))
        fmt.Println(quarters4, len(quarters4), cap(quarters4))
        // スライスの拡張
        quarters2Extended := quarters2[:4]
        fmt.Println(quarters2Extended, len(quarters2Extended), len(quarters2Extended))
    }
    // 出力結果
    [January February March] 3 12
    [April May June] 3 9
    [July August September] 3 6
    [October November December] 3 3
    [April May June July] 4 4
    ```
- make関数…長さ、容量を指定したスライスを作成できる。
    ```go
    func main() {
        // 長さ5のスライス作成
        a := make([]int, 5)
        printSlice("a", a)

        // 長さ0、容量5のスライス作成
        b := make([]int, 0, 5)
        printSlice("b", b)

        // スライスの宣言
        c := []int{}
        fmt.Printf("%d, len=%d cap=%d", c, len(c), cap(c))
    }

    func printSlice(s string, x []int) {
        fmt.Printf("%s len=%d cap=%d %d\n", s, len(s), cap(x), x)
    }
    ```
- append…スライスに新しい要素を追加するにはappendを用いる。
  - 第一引数にはスライスのパラメータ、第二引数以降は追加する変数群
    ```go
    func main() {
        var s []int
        printSlice(s)

        s = append(s, 2)
        printSlice(s)

        s = append(s, 10)
        printSlice(s)

        s = append(s, 100, 1000)
        printSlice(s)
    }

    func printSlice(s []int) {
        fmt.Printf("len=%d cap=%d %v\n", len(s), cap(s), s)
    }
    ```

- 項目を追加
  - 容量については、より多くの要素を保持するだけの容量がスライスにない場合は、その容量が2倍される
  - 容量は、スライスの開始点から基礎となる配列の終了点までの距離として計算される。
    ```go
    func main() {
        var numbers []int
        for i := 0; i < 10; i++ {
            numbers = append(numbers, i)
            // %v：デフォルトの形式で出力、%d：10進整数
            fmt.Printf("%d\tcap=%d\t%v\n", i, cap(numbers), numbers)
        }
    }
    0       cap=1   [0]
    1       cap=2   [0 1]
    2       cap=4   [0 1 2]
    3       cap=4   [0 1 2 3]
    4       cap=8   [0 1 2 3 4]
    5       cap=8   [0 1 2 3 4 5]
    6       cap=8   [0 1 2 3 4 5 6]
    7       cap=8   [0 1 2 3 4 5 6 7]
    8       cap=16  [0 1 2 3 4 5 6 7 8]
    9       cap=16  [0 1 2 3 4 5 6 7 8 9]
    ```
- 要素を削除
    ```go
    func main() {
        letters := []string{"A", "B", "C", "D", "E"}
        remove := 2

        if remove < len(letters) {
            fmt.Println("Before", letters, "Remove", letters[remove])

            // 第一引数：先頭から該当要素-1までを取り出せる
            // 第二引数：該当要素+1以降の要素を追加
            letters = append(letters[:remove], letters[remove+1:]...)

            fmt.Println("After", letters)
        }
    }
    // 出力結果
    Before [A B C D E] Remove C
    After [A B D E]
    ```
- スライスのコピー…スライスは要素を変更すると、その基となる配列も変更されてしまう。そのため、コピーが必要。
    ```go
    func main() {
        // スライスを定義
        slice := []int{1, 2, 3, 4, 5}

        // スライスの一部をスライス
        cutSlice := slice[1:4]

        fmt.Println(cutSlice) //[2, 3, 4]

        // 要素を一部変更
        cutSlice[0] = 1000
        cutSlice[1] = 20000

        // 基となる配列まで書き換えられてしまう
        fmt.Println(slice)    //[1 1000 20000 4 5]
        fmt.Println(cutSlice) //[1000 20000 4]
    }

    func main() {
        letters := []string{"A", "B", "C", "D", "E"}
        fmt.Println("Before", letters)

        // slice1の一部をスライス
        slice1 := letters[0:2]

        // slice2を作成
        slice2 := make([]string, 3)
        // コピー
        copy(slice2, letters[1:4])

        slice1[1] = "Z"

        fmt.Println("After", letters)
        fmt.Println("Slice2", slice2)
    }
    ```
- スライスのゼロ値はnil
    ```go
    func main() {
        var s []int
        fmt.Println(s, len(s), cap(s))
        if s == nil {
            fmt.Println("nil")
        }
    }
    ```
## マップ
- ある値と別の値を関連付けたい場合のための組み合わせデータ型のこと。
- mapはデータ構造の一つで、キーと値を保持するために使われる。
    ```go
    func main() {
        stocks := map[string]float64{}
        stocks["MSFT"] = 245.71
        stocks["AAPL"] = 123.74
        stocks["GOOGL"] = 2347.58
        fmt.Println(stocks["AAPL"])
        // 123.74
    }
    func main() {
        studentAge := map[string]int{
            "John": 32,
            "Bob":  31,
        }
        fmt.Println(studentAge)
    }
    ```
- varでの宣言…文字列のキーとintの値を持つマップとして宣言。マップのゼロ値はnil。nilマップの長さは0
    ```go
    var nilMap map[string]int
    ```
- マップリテラルでの宣言(空の場合)…空のマップリテラルを使用。上記のnilマップとは異なる。
  - リテラルとは、プログラミングにおいて特定の値を直接記述するための表現のこと。(数値リテラル：42,3.14、文字列リテラル："hello")
    ```go
    totalWins := map[string]int{}
    ```
- マップリテラルでの宣言(空でない場合)…マップリテラルの本文はキー、コロン、値の順に記述する。最終行であってもコンマが必要。
    ```go
    teams := map[string][]string {
        "Orcas": []string{"Fred", "Ralph", "Bijou"},
        "Lions": []string{"Sarah", "Peter", "Billie"},
        "Kittens": []string{"Waldo", "Raul", "Ze"},
    }
    ```
- make関数…マップに入れるキーとペアの数はわかっているが、正確な値がわかっていない場合はmake関数を使い、デフォルトのサイズでマップを作成できる。
    ```go
    studentAge := make(map[string]int, 10) // make(map[string]int, 容量(省略可能))
    ```
- マップとスライスの使い分け…データを連続して処理する場合や要素の順序が重要な場合はデータのリストにスライスを使用する。
- マップの読み書き
    ```go
    func main() {
        totalWins := map[string]int{}
        totalWins["Orcas"] = 1
        totalWins["Lions"] = 2
        fmt.Println(totalWins["Orcas"])   // 1
        fmt.Println(totalWins["Kittens"]) // 0 一度も設定されていないマップキーに割り当てられた値を読み取ろうとすると、マップはそのマップ値型に対するゼロ値を返す
        totalWins["Kittens"]++            // インクリメント操作により、0から1になった
        fmt.Println(totalWins["Kittens"]) // 1
        totalWins["Lions"] = 3
        fmt.Println(totalWins["Lions"]) // 3
    }
    ```
- カンマ ok イディオム…キーがマップに既にあるかどうかを判定するもの。マップの読み込みの結果をひとつの変数に代入するのではなく、2つの変数に代入する。こうすることでokの変数に真偽値が返る。trueならキーは存在し、falseならキーは存在しない。
    ```go
    func main() {
        m := map[string]int{
            "hello": 5,
            "world": 0,
        }

        v, ok := m["hello"]
        fmt.Println(v, ok) // 5 true
        v2, ok := m["world"]
        fmt.Println(v2, ok) // 0 true
        v3, ok := m["goodbye"]
        fmt.Println(v3, ok) // 0 false
    }
    ```
- マップの削除…組み込み関数deleteを使うことで、キーと値のペアをマップから削除できる。キーがマップに存在しない場合、マップがnilの場合には何も起こらない。
    ```go
    func main() {
        m := map[string]int{
            "hello": 5,
            "world": 10,
        }
        delete(m, "hello") // 組み込み関数deleteを用い、マップのキーを指定することで削除できる

        fmt.Println(m)
    }
    ```
- マップを空にする…スライスを空にするのと同様、組み込み関数のclearを使うと、長さが0になる。
    ```go
    func main() {
        m := map[string]int{
            "hello": 5,
            "world": 10,
        }

        fmt.Println(m, len(m)) // map[hello:5 world:10], 2
        clear(m)
        fmt.Println(m, len(m)) // map[], 0
    }
    ```
    ```go
    // スライスにおけるclear関数のふるまい
    func main() {
        m := []int{1, 2, 3, 4, 5}
        fmt.Println(m) // [1,2,3,4,5]

        clear(m)
        fmt.Println(m) // [0,0,0,0,0] 全ての要素をゼロ値にする
    }
    ```
- マップの比較…Go 1.21より、マップを扱うためのヘルパー関数を含むmapsというパッケージが標準ライブラリに追加された。
    ```go
    func main() {
        m := map[string]int{
            "hello": 5,
            "world": 10,
        }
        n := map[string]int{
            "world": 10,
            "hello": 5,
        }
        fmt.Println(maps.Equal(m, n))
    }
    ```
- マップをセットとして使う…多くの言語では標準ライブラリにセットが含まれる。セットは要素の値に重複がなく、要素間に順序があることは仮定されていないデータ型。
    ```go
    func main() {
        // 整数の集合(セット)を扱いたい
        intSet := map[int]bool{}
        vals := []int{5, 10, 2, 5, 8, 7, 3, 9, 1, 2, 10} // 11個の値
        for _, v := range vals {
            intSet[v] = true // マップではキーの重複は許されないので、サイズは8
        }
        fmt.Println(len(vals), len(intSet))
        fmt.Println(intSet[5])
        fmt.Println(intSet[500])
    }
    ```
- マップ内でループさせる
    ```go
    func main() {
        studentAge := make(map[string]int)
        studentAge["John"] = 32
        studentAge["Bob"] = 31
        // マップ内でループさせる
        for name, age := range studentAge {
            fmt.Printf("%s\t%d\n", name, age)
        }
    }
    ```
## エラーハンドリング
```go
employee, err := getInformation(1000)
if err != nil {
    // Something is wrong. Do something.
}
```
### ログ記録の方法
- logパッケージ
    ```go
    func main() {
        // 日付、時刻、ログメッセージが出力
        log.Print("aaa")

        // エラーをログに記録して、プログラムを終了
        log.Fatal("ここでプログラムを終了")
        fmt.Println("これは表示されない。")

        // Panicにおいても、エラーをログに記録して、プログラムを終了させる
        log.Panic("これはパニック")
        fmt.Println("これは表示されない。")

        // setPrefix()を使用すると、プログラムのログメッセージにプレフィクスを追加できる。
        log.SetPrefix("main(): ")
        log.Print("これはプリント")
        log.Fatal("これはFatal")
    }
    ```
- ファイルへのログ記録…ログをコンソールに出力するだけでなく、ログをファイルに送信し、後またはリアルタイムで処理できるように
  - ファイルにログを記録することで、エンドユーザーに対し、特定の情報を非表示にできる。
    ```go
    package main

    import (
        "log"
        "os"
    )

    func main() {
        file, err := os.OpenFile("info.log", os.O_CREATE|os.O_APPEND|os.O_WRONLY, 0644)
        if err != nil {
            log.Fatal(err)
        }

        defer file.Close()

        log.SetOutput(file)
        log.Print("aaa")
    }
    ```
### ログ記録フレームワーク
```go
package main

import (
    "github.com/rs/zerolog"
    "github.com/rs/zerolog/log"
)

func main() {
    zerolog.TimeFieldFormat = zerolog.TimeFormatUnix
    log.Print("ここにメッセージを表示します。")
}
// {"level":"debug","time":1716270617,"message":"ここにメッセージを表示します。"}
```

## 参照渡しと値渡し
- 値渡し
```go
package main

import "fmt"

func updateValue(x int) {
    x = x + 1
}

// 渡された引数xは値渡しのため、関数内でxの値を変更しても元の変数aの値に影響を与えない。
func main() {
    a := 10
    fmt.Println("Before updateValue:", a) // 10
    updateValue(a)
    fmt.Println("After updateValue:", a) // 10
}
```
- 参照渡し
```go
package main

import "fmt"

// *intにすることで、ポインタ型を受け取れるようにしている
func updateValue(x *int) {
    *x = *x + 1
}

// 整数型の変数aのアドレスをupdateValue関数に渡している
func main() {
    a := 10
    fmt.Println("Before updateValue", a)
    // 関数にaのメモリアドレスを渡している
    updateValue(&a)
    fmt.Println("After updateValue", a)
}
```
### 構造体における値渡しと参照渡し
- 値渡し(のようなふるまい)
```go
package main

import "fmt"

// 構造体
type Student struct {
    Name string
    Age  int
}

func updateStudent(s Student) {
    s.Age = s.Age + 1
}

func main() {
    student := Student{Name: "Taro", Age: 16}
    fmt.Println("Before updateStudent:", student)
    updateStudent(student)
    fmt.Println("After updateStudent:", student)
}
```
- 参照渡し
```go
package main

import "fmt"

// 構造体
type Student struct {
    Name string
    Age  int
}

func updateStudent(s *Student) {
    s.Age = s.Age + 1
}

func main() {
    student := Student{Name: "Taro", Age: 16}
    fmt.Println("Before updateStudent:", student)
    updateStudent(&student)
    fmt.Println("After updateStudent:", student)
}
```
### スライスについて
- スライスは参照渡しのようなふるまいをする。
- スライスを関数に渡すと、要素の変更は元のスライスに影響を与えるが、スライス自体の変更(要素の追加や削除)は元のスライスに影響を与えない。
    ```go
    package main

    import "fmt"

    func updateSlice(s []int) {
        // これは変更される
        s[0] = 100
        // スライス自体の変更は反映されない
        s = append(s, 200)
    }

    func main() {
        nums := []int{1, 2, 3}
        fmt.Println("Before updateSlice:", nums)
        // スライスを関数に渡すときは、参照渡しのようなふるまいをする
        updateSlice(nums)
        fmt.Println("After updateSlice:", nums)
    }
    ```
**参考サイト**
[Go言語で理解する値渡しと参照渡し](https://qiita.com/atsutama/items/df7b8ff4ea2b4061d1ab)
### Goにおける参照型の変数
- スライスとマップとチャネルは参照型の変数として扱われる。それ以外は値渡しなので、ポインタの値渡しをしたい場合は、ポインタを渡す。
**参考サイト**
[【Goのやさしい記事】Goのポインタを5分で学ぼう](https://qiita.com/gold-kou/items/0d1585fb8d687061c890)

### for文とfor range文について
- どちらも同じ挙動を実現できるが、for rangeのvalueはindexの場所の要素のコピー(値渡し)であるので、データ量が莫大の場合にはforを使った方が処理が速い。
    ```go
    package main

    import "fmt"

    func main() {
        slice := []int{1, 2, 3}
        for _, value := range slice {
            fmt.Println(value)
        }

        slice := []int{1, 2, 3}
        for i := 0; i < len(slice); i++ {
            fmt.Println(slice[i])
        }
    }
    ```
## メソッド
- Go言語には、クラスの仕組みはないが、型にメソッドを定義できる。メソッドは特別なレシーバ引数を関数に取る。
  - 他の言語では、クラスと呼ばれる「オブジェクトを作る設計書」のようなものがある。Goではその代わりにメソッドが定義できる。
    ```go
    package main

    import "fmt"

    type Person struct {
        Name string
    }

    // Helloメソッドは、pという名前のPerson型のレシーバを持っている
    func (p Person) Hello() string {
        return fmt.Sprintf("Hello %s", p.Name)
    }

    func main() {
        // 構造体のインスタンスを作成
        p := Person{Name: "hoge"}
        fmt.Println(p.Hello())
    }
    ```
### ポインタレシーバ
- レシーバはポインタレシーバとして宣言することができる。メソッドを使い、一度宣言した変数の値を変更したいときに使う。
- メソッドにおいて、変数を変更する必要やメソッドの引数が大きすぎる場合には、コピーを避ける必要がある。その場合、ポインタを使用する。
- メソッドがレシーバーの情報にアクセスするだけの場合、レシーバの変数にポインタは必要ないが、Goの規則では構造体のいずれかのメソッドにポインタレシーバーがある場合には、その構造体のすべてのメソッドにポイントレシーバが必要であると定められている。
  - 値レシーバ(失敗例)
    ```go
    package main

    import "fmt"

    type Person struct {
        Name string
    }

    func (p Person) Hello() string {
        return fmt.Sprintf("Hello %s", p.Name)
    }

    // 値レシーバで名前を変更しようとする
    func (p Person) ChangeName(name string) {
        p.Name = name
    }

    func main() {
        // 構造体のインスタンス作成
        p := Person{Name: "hoge"}
        fmt.Println(p.Hello())

        p.ChangeName("Yamada")
        fmt.Println(p.Hello())
    }
    ```
  - ポインタレシーバ(参照渡しになるので上書きが可能)
    ```go
    package main

    import "fmt"

    type Person struct {
        Name string
    }

    func (p Person) Hello() string {
        return fmt.Sprintf("Hello %s", p.Name)
    }

    // ポインタレシーバで名前を変更しようとする
    func (p *Person) ChangeName(name string) {
        p.Name = name
    }

    func main() {
        // 構造体のインスタンス作成
        p := Person{Name: "hoge"}
        fmt.Println(p.Hello())

        p.ChangeName("Yamada")
        fmt.Println(p.Hello())
    }
    ```
  - メソッドがポインタレシーバである場合、呼び出し時に変数、ポインタのどちらからでも呼び出せる。
    ```go
    package main

    import "fmt"

    type Person struct {
        Name string
    }

    // ポインタレシーバでメソッドを定義
    func (p *Person) Hello() string {
        return fmt.Sprintf("Hello %s", p.Name)
    }

    func main() {
        // 変数からの呼び出し方法
        p := Person{Name: "Yamamoto"}
        fmt.Println(p.Hello()) // 変数から呼び出している
        // 実際には、(&p).Hello()として実行されている。

        // ポインタからの呼び出し方法1
        p2 := Person{Name: "Suzuki"}
        fmt.Println((&p2).Hello()) // ポインタから呼び出している

        // ポインタからの呼び出し方法2
        p3 := &Person{Name: "Sato"}
        fmt.Println(p3.Hello()) // ポインタから呼び出している
    }
    ```
  - 逆に値レシーバーにおいても、変数、ポインタのどちらからでもメソッドは呼び出せる。
    ```go
    package main

    import "fmt"

    type Person struct {
        Name string
    }

    // 値レシーバでメソッドを定義
    func (p Person) Hello() string {
        return fmt.Sprintf("Hello %s", p.Name)
    }

    func main() {
        // 変数からの呼び出し方法
        p := Person{Name: "Yamamoto"}
        fmt.Println(p.Hello()) // 変数から呼び出している

        // ポインタからの呼び出し方法
        p2 := &Person{Name: "Sato"}
        fmt.Println(p2.Hello()) // ポインタから呼び出している
    }
    ```
    - 関数においては、値であれば変数を、ポインタであればポインタを渡す必要があるので、余計なことをしなくてよいメソッドが便利。
    ```go
    // 関数の場合

    // ポインタを引数にとる関数の場合
    func Hello(p *Person) string {
        return fmt.Sprintf("Hello %s", p.Name)
    }

    func main() {
        p := Person{Name: "Yamamoto"}
        // 必ずポインタを渡す必要がある、変数だとエラー
        fmt.Println(Hello(&p))
    }
    ```
    ```go
    // 変数を引数にとる関数の場合
    func Hello(p Person) string {
        return fmt.Sprintf("Hello %s", p.Name)
    }

    func main() {
        p := Person{Name: "Yamamoto"}
        // 必ず変数を渡す必要がある
        fmt.Println(Hello(p))
    }
    ```
### なぜメソッドは必要か？
- 一度宣言した変数の値を変えたい場合は、メソッドのレシーバを使った方がよい。(関数でも実現はできるが、、)
  - 関数だと、値の場合には値を、ポインタの場合にはポインタを渡さなくてはならないので、エラーを生みやすい
- 関数に比べ、メソッド名は構造体にぶらさげることで、同一名にて複数設定できるので、コードの可読性が上がる。
    ```go
    package main

    import "fmt"

    type Person struct {
        Name string
    }
    type Person2 struct {
        Name string
    }

    // メソッドの宣言
    // 以下の関数に比べ、メソッド名は構造体にぶらさげることで、同一名にて複数設定できるので、コードの可読性が上がる。
    func (p Person) Hello() string {
        return fmt.Sprintf("Hello %s", p.Name)
    }
    func (p Person2) Hello() string {
        return fmt.Sprintf("Hello2 %s", p.Name)
    }

    func main() {
        // 構造体のインスタンスを作成
        p := Person{Name: "hoge"}
        q := Person2{Name: "huga"}
        fmt.Println(p.Hello())
        fmt.Println(q.Hello())
    }

    // 以上を関数にて表現すると

    // 関数の宣言
    // 関数名を変えなくてはならない、不具合が意図しないところで発生するかも
    func Hello(p Person) string {
        return fmt.Sprintf("Hello %s", p.Name)
    }
    func Hello2(p Person2) string {
        return fmt.Sprintf("Hello2 %s", p.Name)
    }

    func main() {
        p := Person{Name: "hoge"}
        q := Person2{Name: "huga"}
        fmt.Println(Hello(p))
        fmt.Println(Hello2(q))
    }
    ```
**参考サイト**
[[Golang] A Tour of GoのMethodsを理解する](https://zenn.dev/syo_yamamoto/articles/f4afbc798cac90#%E3%81%9D%E3%82%82%E3%81%9D%E3%82%82%E3%83%A1%E3%82%BD%E3%83%83%E3%83%89%E3%82%92%E9%96%A2%E6%95%B0%E3%81%AB%E3%81%99%E3%82%8B%E3%81%93%E3%81%A8%E3%81%AB%E3%83%A1%E3%83%AA%E3%83%83%E3%83%88%E3%81%AF%E3%81%82%E3%82%8B%E3%81%AE%E3%81%8B%EF%BC%9F)

### メソッドをオーバーロードする
- 同処理ではあるが、パラメータを変えたい場合、関数では同名称は不可。そのため、メソッドを使う。
    ```go
    package main

    import "fmt"

    // 構造体の宣言
    type triangle struct {
        size int
    }

    // 構造体の中に構造体を埋め込む
    type coloredTriangle struct {
        triangle
        color string
    }

    func (t triangle) perimeter() int {
        return t.size * 3
    }

    func (t coloredTriangle) perimeter() int {
        return t.size * 3 * 2
    }

    func main() {
        // 構造体のインスタンス化
        t := coloredTriangle{triangle{3}, "blue"}
        fmt.Println("Size:", t.size)
        fmt.Println("Perimeter", t.perimeter())
    }
    ```
- 上記コードにてtriangle構造体からperimeterメソッドを呼び出したい場合
    ```go
    package main

    import "fmt"

    // 構造体の宣言
    type triangle struct {
        size int
    }

    // 構造体の中に構造体を埋め込む
    type coloredTriangle struct {
        triangle
        color string
    }

    func (t triangle) perimeter() int {
        return t.size * 3
    }

    func (t coloredTriangle) perimeter() int {
        return t.size * 3 * 2
    }

    func main() {
        // 構造体のインスタンス化
        t := coloredTriangle{triangle{3}, "blue"}
        fmt.Println("Size:", t.size)

        fmt.Println("Perimeter(colored):", t.perimeter())         // メソッドをオーバーライドしたもの
        fmt.Println("Perimeter(normal):", t.triangle.perimeter()) // オーバーライドされたが、元のものにアクセスする
    }
    ```
### メソッドのカプセル化
- カプセル化を行うと、そのパッケージでのみ有効となる。他のパッケージからはアクセスできなくなる。
  - 大文字の識別子にすると、メソッドが公開、小文字の識別子にすると、メソッドが非公開になる。
    - geometry.go
    ```go
    package geometry

    type Triangle struct {
        size int
    }

    func (t *Triangle) doubleSize() {
        t.size *= 2
    }

    func (t *Triangle) SetSize(size int) {
        t.size = size
    }

    func (t *Triangle) Perimeter() int {
        t.doubleSize()
        return t.size * 3
    }
    ```
    - main.go
    ```go
    package main

    import (
        "fmt"
        "helloworld/geometry"
    )

    func main() {
        // geometryパッケージのTriangle構造体インスタンス化し、変数に代入
        t := geometry.Triangle{}
        t.SetSize(3) // これはカプセル化されていないので、アクセスできる。
        fmt.Println(t.size) // これはカプセル化されているので、アクセスできない。
        fmt.Println(t.Perimeter())
    }
    ```
### インターフェース
- 他の型の動作を表すために使用されるデータの一種。
- 異なる型に共通のメソッドを持たせることができ、この異なる型を受け取る関数を1つにまとめられる。(複数の型に対する関数の定義を1回で済ませられる。)
- インターフェースを利用する利点は、Shapeの新しい型、実装ごとにprintInformation関数を変更する必要がないこと。
```go
package main

import (
    "fmt"
    "math"
)

// Shapeインターフェースでは、Shapeを考慮するすべての型にPerimeter()とArea()の両方のメソッドが必要であることを示している。
type Shape interface {
    Perimeter() float64
    Area() float64
}

// 構造体の宣言
type Square struct {
    size float64
}

type Circle struct {
    radius float64
}

func (s Square) Area() float64 {
    return s.size * s.size
}

func (s Square) Perimeter() float64 {
    return s.size * 4
}

func (c Circle) Area() float64 {
    return math.Pi * c.radius * c.radius
}

func (c Circle) Perimeter() float64 {
    return 2 * math.Pi * c.radius
}

func printInformation(s Shape) {
    fmt.Printf("%T\n", s)
    fmt.Println("Area", s.Area())
    fmt.Println("Perimeter", s.Perimeter())
    fmt.Println()
}

func main() {
    var s Shape = Square{3}
    printInformation(s)

    c := Circle{6}
    printInformation(c)
}
```
- インターフェースを使わない場合、構造体ごとに出力関数が必要になる。
```go
package main

import (
    "fmt"
    "math"
)

// 構造体の宣言
type Square struct {
    size float64
}
type Circle struct {
    radius float64
}

// メソッドの宣言
func (s Square) Area() float64 {
    return s.size * s.size
}
func (s Square) Perimeter() float64 {
    return s.size * 4
}
func (c Circle) Area() float64 {
    return math.Pi * c.radius * c.radius
}
func (c Circle) Perimeter() float64 {
    return 2 * math.Pi * c.radius
}

func SquareFunc(s Square) {
    fmt.Printf("%T\n", s)
    fmt.Println("Area", s.Area())
    fmt.Println("Perimeter", s.Perimeter())
    fmt.Println()
}

func CircleFunc(c Circle) {
    fmt.Printf("%T\n", c)
    fmt.Println("Area", c.Area())
    fmt.Println("Perimeter", c.Perimeter())
}

func main() {
    s := Square{3}
    c := Circle{6}
    SquareFunc(s)
    CircleFunc(c)
}
```
### Stringerインターフェースの実装
- String()メソッドを含むインターフェースを使うと、渡された先がStringerインターフェースを実装している場合、自動的にStringメソッドが呼び出され、文字列が出力される。
    ```go
    package main

    import "fmt"

    // 構造体の宣言
    type Person struct {
        Name, Country string
    }

    // Stringメソッドの宣言
    func (p Person) String() string {
        return fmt.Sprintf("%v is from %v", p.Name, p.Country)
    }
    func main() {
        // 構造体をインスタンス化し、変数に代入
        rs := Person{"John Doe", "USA"}
        ab := Person{"Mark Collins", "United Kingdom"}
        fmt.Printf("%s\n%s\n", rs, ab)
    }
    ```
## 型アサーション
- 型アサーションは以下の構文で表される。
    ```go
    // xという変数に対して、Tはアサーションする型を表す。
    value, ok := x.(T)
    ```
    - 変数xがint型であるかどうかを判定する
    ```go
    package main

    import "fmt"

    // 変数xがint型であるかどうかを判定するもの
    func main() {
        var x any
        x = 10

        value, ok := x.(int)
        if ok {
            fmt.Printf("x is an int and its value is %d\n", value)
        } else {
            fmt.Println("x is not an int")
        }
    }
    ```
## goroutine(ゴルーチン)
- goroutine(ゴルーチン)は、並行に処理が実行されるもの。
- 関数(またはメソッド)の前にgoをつけると、異なるgoroutineで関数を実行できる。
    ```go
    // go 関数名(引数, ...)
    go checkAPI(api)
    ```
- goroutineの終了条件
  - 関数の処理が終わる
  - returnで抜ける
  - runtime.Goexit()にて終了させられる。
- 存在するgoroutineの数の取得方法
    ```go
    package main

    import (
        "log"
        "runtime"
    )

    func main() {
        log.Println(runtime.NumGoroutine())
    }
    ```
- goroutineの簡単な例
  - goroutineを使わない状態
    ```go
    package main

    import (
        "fmt"
        "time"
    )

    func main() {
        fmt.Println("start")
        process(2, "A")
        process(2, "B")
        fmt.Println("Finish")
    }

    func process(num int, str string) {
        for i := 0; i <= num; i++ {
            time.Sleep(1 * time.Second)
            fmt.Println(i, str)
        }
    }
    ```
  - goroutineを使った状態…しかし、以下のコードではgoroutineの終了を待たずにプログラムが終了してしまう。そこでチャネルを使う。
    ```go
    package main

    import (
        "fmt"
        "time"
    )

    func main() {
        fmt.Println("start")
        go process(2, "A")
        go process(2, "B")
        fmt.Println("Finish")
    }

    func process(num int, str string) {
        for i := 0; i <= num; i++ {
            time.Sleep(1 * time.Second)
            fmt.Println(i, str)
        }
    }
    ```
### チャネル
- ゴルーチン間で連携するにはチャネルと呼ばれる機能を利用する。
- チャネルは値の交換及び同期という通信機能を兼ね備えている。
#### チャネルの生成方法
- スライス同様、組み込み関数make()で生成可能。
```go
ch := make(chan 型)
ch := make(chan 型, バッファサイズ)
```
- バッファとは…チャネルに一時的に格納できる領域のこと。
#### チャネルの値の送受信方法
- チャネルを使用するには、チャネル型の変数を作成し、送信側受信側に何らかのデータを送受信する。
    ```go
    ch <- data // dataをchに送信する(vをchに書き込む)
    arg := <-ch // chから受信した変数をargに割り当てる(chの値を読み込む)
    ```
    ```go
    package main

    import "fmt"

    func main() {
        // channelの作成
        messages := make(chan string)

        // 作成されたchannelに値(str)を送信
        // 無名関数の場合、最後に()をつけることですぐに実行可能となる
        go func() { messages <- "str" }()

        // channelから値を受信
        msg := <-messages
        fmt.Println(msg)
    }
    ```
### ゴルーチンの同期
- Goでは、受信側では常に受信可能なデータがくるまでブロックされる。
- 送信側ではチャネルがバッファリングしていないときには、受信側が値を受信するまでブロックされる。
- 例1
    ```go
    package main

    import "fmt"

    func main() {
        ch := make(chan bool) // bool型のchannelを作成

        // boolの型を受け取るまで完了待ちしている
        go func() {
            fmt.Println("Hello")
            ch <- true // 通知を送信
        }()

        <-ch
    }
    ```
- 例2
    ```go
    package main

    import "fmt"

    func hello(done chan bool) {
        fmt.Println("Hello world goroutine")
        done <- true
    }

    func main() {
        // bool型のchannelのdoneを生成する
        done := make(chan bool)

        // 生成したdoneを関数helloに渡す
        go hello(done)

        // doneチャネルから値を受信(ゴルーチンの完了を待機)
        <-done
        fmt.Println("main function")
    }
    ```
- 例3
    ```go
    package main

    import (
        "fmt"
        "time"
    )

    func main() {
        // チャネルの宣言
        ch1 := make(chan bool)
        ch2 := make(chan bool)

        fmt.Println("Start")

        go func() {
            process(2, "A")
            ch1 <- true
        }()

        go func() {
            process(2, "B")
            ch2 <- true
        }()

        // チャネルの値を受信
        <-ch1
        <-ch2

        fmt.Println("Finish")
    }

    func process(num int, str string) {
        for i := 0; i <= num; i++ {
            time.Sleep(1 * time.Second)
            fmt.Println(i, str)
        }
    }
    ```
**参考サイト**
[https://qiita.com/k-penguin-sato/items/5b09fa89d8d231bcdac8](https://qiita.com/k-penguin-sato/items/5b09fa89d8d231bcdac8)

### syncパッケージ
```go
package main

import (
    "fmt"
    "sync"
    "time"
)

func main() {
    start := time.Now()
    post := fetchPost()

    // channelの初期化
    // 2個のバッファを持ったchannelを作成
    resChan := make(chan any, 2)

    // sync.WaitGroupの生成
    var wg sync.WaitGroup
    // 今回新たに生成するゴルーチンは2つなので、Addに渡すのは2
    wg.Add(2)

    // wgは参照渡しを行う
    go fetchPostLikes(post, resChan, &wg)
    go fetchPostComments(post, resChan, &wg)

    // wg.Done()が2回実行され、WaitGroup内部の数値が0になるまで待つ
    wg.Wait()

    // resChan channelへの送信を終了し、channelを閉じる
    close(resChan)

    // channelが閉じられるまでループする
    for res := range resChan {
        fmt.Println("res: ", res)
    }

    fmt.Println("took: ", time.Since(start))
}

// 投稿を一件取得する関数
func fetchPost() string {
    time.Sleep(time.Millisecond * 50)

    return "What programming languages do you prefer?"
}

// 投稿に紐づいたいいね数を取得する関数
func fetchPostLikes(post string, resChan chan any, wg *sync.WaitGroup) {
    time.Sleep(time.Millisecond * 50)

    // 値をチャネルに送信
    resChan <- 10
    wg.Done()
}

// 投稿に紐づいたコメントを全て取得する関数
func fetchPostComments(post string, resChan chan any, wg *sync.WaitGroup) {
    time.Sleep(time.Millisecond * 100)

    // 値をチャネルに送信
    resChan <- []string{"Golang", "Java", "Rust"}
    wg.Done()
}

// これだと、fetchPostLikesとfetchPostCommentsが実行される前にプログラムが終了してしまう。
// Go言語にはメインゴルーチンが終了したタイミングでプログラム全体を終了するという特性がある。
// ここで、syncパッケージのsync.WaitGroupを使う
```
**参考サイト**
[【Go】このコードの意味が分かれば、ゴルーチンの基本は大丈夫](https://zenn.dev/farstep/articles/f712e05bd6ff9d)

## Goコマンド
- goモジュールプロジェクト作成時
```sh
go mod init
```
- goテストファイル実行
```sh
<!-- テストの詳細な出力を表示 -->
go test -v
```

## テストファイルについて
- テストファイルを作成する場合には、ファイルの名前が「_test.go」で終わるようにする必要がある。
- 記述するすべてのテストはTestで始まる関数にする必要がある。

## ジェネリクスについて
- ジェネリクスは、様々なデータ型で動作する関数やデータ構造を書くことができる。
```go
package main

import "fmt"

// interface型(any型)の宣言
type Number interface {
    int64 | float64
}

func main() {
    // マップの宣言
    ints := map[string]int64{
        "first":  34,
        "second": 12,
    }
    floats := map[string]float64{
        "first":  35.98,
        "second": 26.99,
    }

    fmt.Printf("Non-Generic Sums: %v and %v\n",
        SumInts(ints),
        SumFloats(floats))

    fmt.Printf("Generic Sums: %v and %v\n",
        SumIntsOrFloats[string, int64](ints),
        SumIntsOrFloats[string, float64](floats))

    fmt.Printf("Generic Sums with Constraint: %v and %v\n",
        SumNumbers(ints),
        SumNumbers(floats))
}

// SumintsとSumFloatsは、同処理であっても、引数や返り値の型が異なるため、別の関数として宣言している。
func SumInts(m map[string]int64) int64 {
    var s int64
    for _, v := range m {
        s += v
    }
    return s
}
func SumFloats(m map[string]float64) float64 {
    var s float64
    for _, v := range m {
        s += v
    }
    return s
}

// ジェネリクスを用いれば、同処理の関数を1つにすることができる。
func SumIntsOrFloats[K comparable, V int64 | float64](m map[K]V) V {
    var s V
    for _, v := range m {
        s += v
    }
    return s
}

// さらにinterface型を用いれば、よりまとめることができる。
func SumNumbers[K comparable, V Number](m map[K]V) V {
    var s V
    for _, v := range m {
        s += v
    }
    return s
}
```
## テストファイルについて
- プログラムの単体テストや統合テストを行うためのファイル。
### 作成目的
- バグの早期発見
- リファクタリング時の動作確認
- ドキュメントとしても利用(コードの使用例)
### ファイル作成時の決まり事
- ファイルの末尾が`_test.go`で終わる。
- 同じディレクトリ内の他のGoパッケージと同じパッケージに属するか、`_test`サフィックスを付けて別パッケージにすることも可能。
- テスト関数は`Test`で始まり、`*Testing.T`型の引数を取る。
- テスト関数内で`testing`パッケージを使用し、テストの成否を判定。
### テストファイルの作り方
- テストファイルの作成…プロジェクトディレクトリに`hoge_test.go`という名前のファイル作成。
- パッケージ宣言…通常、テスト対象のコードと同じパッケージを使用。
- テスト関数の定義…`func TestXxx(t *Testing.T)`という形式でテスト関数を定義。
- `testing`パッケージの使用…`t.Errorf`や`t.Fatalf`などの関数を使用して、テストの成否を判定。



## ここから下、再度整理する！！！！
- コンカレンシーは、独立した複数のアクティビティの構成。大量のデータを一括処理するにはコンカレンシーが必要。
- Goにおいては、並行プログラムを作成する際、チャネルを介してデータがやり取りされる。
- 一つずつと同時実行プログラムを比較する。
    ```go
    // 1つずつ処理する例
    package main

    import (
        "fmt"
        "net/http"
        "time"
    )

    func main() {
        start := time.Now()

        apis := []string{
            "https://management.azure.com",
            "https://dev.azure.com",
            "https://api.github.com",
            "https://outlook.office.com/",
            "https://api.somewhereintheinternet.com/",
            "https://graph.microsoft.com",
        }

        for _, api := range apis {
            _, err := http.Get(api)
            if err != nil {
                fmt.Printf("ERROR: %s is down!\n", api)
                continue
            }
            fmt.Printf("SUCCESS: %s is down!\n", api)
        }

        elapsed := time.Since(start)
        fmt.Printf("Done! It look %v seconds!\n", elapsed.Seconds())
    }
    // Done! It look 3.0144437 seconds!
    ```
    - 並行処理には成功したが、完了時間が正確ではない。(time.Sleepにより3秒余計)
    ```go
    // 同時処理
    package main

    import (
        "fmt"
        "net/http"
        "time"
    )

    func main() {
        start := time.Now()

        apis := []string{
            "https://management.azure.com",
            "https://dev.azure.com",
            "https://api.github.com",
            "https://outlook.office.com/",
            "https://api.somewhereintheinternet.com/",
            "https://graph.microsoft.com",
        }

        for _, api := range apis {
            go checkAPI(api)
        }
        // ゴルーチンが完了するのを待つために3秒間スリープ
        time.Sleep(3 * time.Second)

        elapsed := time.Since(start)
        fmt.Printf("Done! It look %v seconds!\n", elapsed.Seconds())
    }

    func checkAPI(api string) {
        _, err := http.Get(api)
        if err != nil {
            fmt.Printf("ERROR: %s is down!\n", api)
            return
        }

        fmt.Printf("SUCCESS: %s is up and running!\n", api)
    }
        // Done! It look 3.0127579 seconds!
    ```
### 通信メカニズムとしてチャネルを使用
- Goのチャネルはgoroutine間の通信メカニズム。
- チャネルの構文…チャネルはデータを送受信する通信メカニズムであるため、型もある。
    ```go
    package main

    import "fmt"

    func main() {
        // チャネルを作成
        ch := make(chan int)

        // ゴルーチンを起動してチャネルにデータを送信
        // 最後の()は無名関数をすぐに実行するために必要
        go func() {
            ch <- 42
        }()

        // チャネルからデータを受信
        value := <-ch
        fmt.Println(value)
    }
    ```
- チャネルを使った並行処理の例
    ```go
    package main

    import (
        "fmt"
        "time"
    )

    func producer(ch chan int) {
        for i := 1; i <= 5; i++ {
            ch <- i                            // チャネルに送信する
            time.Sleep(time.Millisecond * 500) // 0.5秒待機
        }
        close(ch)
    }

    func main() {
        // チャネルの作成
        ch := make(chan int)

        // producer関数をゴルーチンとして起動
        go producer(ch)

        // チャネルから受信したデータをforループで処理
        for value := range ch {
            fmt.Println(value)
        }

        fmt.Println("Done")
    }
    ```
- バッファ付きチャネル…指定した数のデータをチャネル内にバッファリングできる。これにより、送信側と受信側が同時に実行される必要がない。
  - バッファとは…チャネルに一時的に格納できる領域のこと。
    ```go
    package main

    import "fmt"

    func main() {
        ch := make(chan int, 2) // バッファサイズを2に設定

        ch <- 1
        ch <- 2

        fmt.Println(<-ch) // 1と出力される
        fmt.Println(<-ch) // 2と出力される
    }
    ```
  - バッファなしとバッファ付きにおけるチャネルの動作
    - バッファのないチャネルは、送信操作と受信操作がペアになって初めてデータをやりとりできる、いわば同期チャネル(データの送受信は同時に行われる)
- Select文を使ったチャネルの操作
    ```go
    package main

    import (
        "fmt"
        "time"
    )

    func main() {
        ch1 := make(chan int)
        ch2 := make(chan int)

        go func() {
            time.Sleep(time.Second * 1)
            ch1 <- 1
        }()

        go func() {
            time.Sleep(time.Second * 2)
            ch2 <- 2
        }()

        for i := 0; i < 2; i++ {
            select {
            case msg1 := <-ch1:
                fmt.Println("Received", msg1)
            case msg2 := <-ch2:
                fmt.Println("Received", msg2)
            }
        }
    }
    ```
