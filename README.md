## ファイル構造
├── card.rb
├── deck.rb
├── users.rb
├── game.rb
├── gameprogress

##　クラス定義の大枠
　<カードclass>　 => card.rb
・attr_readerで値を引っ張れるようにする（attr_reader :suit, :rank, :value）
・カードの要素（suit,rank）を用意
・rankに紐づける形でキーとして強さvalueを定義
・各要素を元にカードを52枚生成
・初期化メソッド（各要素（配列）ごとをインスタンス変数に格納）
・カードを文字列として表示するメソッド

　<山札class> => deck.rb
・attr_readerで値を引っ張れるようにする（attr_reader :cards）
・cardクラスを紐づける
・cardクラスで生成したカードを52枚を@cardsに格納 & シャッフル（initializeメソッド）
・シャッフルメソッド
・手札を振り分けるメソッド（プレイヤー人数に応じてカードを振り分ける）

　<ユーザーclass> => users.rb
・attr_readerで値を引っ張れるようにする（attr_reader :hand, :name）
・プレイヤー、手札、サブ手札を定義（initializeメソッド）
・配られたカードを手札に追加するメソッド。
手札が0の時、自動でサブ手札からシャッフルして手札に加わるため、カードの追加はサブ手札にのみ行う。
最初の振り分け、場のカードの配布をこれ一つで行える。
・カードを場に出す
・場にだすカードを選択するメソッド。手札が空かどうかサブ手札
・手札とサブ手札を合計するメソッド

　<ゲームclass> => game.rb
・users, deckクラスの紐付け
・ユーザー、デッキを作成するメソッド
・プレイヤーにカードを配るメソッド
・ラウンドを定義するメソッド
・ゲームを行うメソッド（ラウンドメソッドを回す）

<ゲーム進行クラス> => gameprogress.rb
・各ファイルを紐付け
・ユーザー名を設定
・ゲームの初期化
・ゲームの開始（game_playメソッドを実行）

## 設定項目洗い出し

・A、K、Q、J、10、9、8、7、6、5、4、3、2　にそれぞれ番号を振り、数字の大きい順などで強さを定義する。

・プレイヤー人数を後から増やせるように設計する。サンプルで人数を引数として渡せるといいかも

・カードをランダムにシャッフルする

・最初に親となる人を決める

・開始の合図などの掛け声をputsする

・大小比較のメソッドを作る。ここで場のカードの管理をする？

・手札、山札の設定。手札の枚数がなくなったらゲーム終了も、ここで定義するのかな？

・

## デッキの作りかた候補
・変数としてループ文を使って直に配列に値を入れていく。
・カードクラスでカードの持つ要素を設定し、その要素を用いてデッキクラスで配列を作成
・カード一枚を形作る型のクラスを作成し、デッキクラス内でそれをループ文で回して配列を作成する