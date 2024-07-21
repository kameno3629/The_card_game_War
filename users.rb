# frozen_string_literal: true

# Usersクラスは、プレイヤーの手札と名前を管理します
class Users
  # attr_readerを設定し、手札とプレイヤーネームを引っ張れるようにする
  attr_reader :hand, :name

  # initializeメソッドでプレイヤーネームと手札を初期化
  def initialize(name)
    @name = name # プレイヤーネームを設定
    @hand = [] # 手札を空の配列で初期化
    @reserve_hand = [] # リザーブハンドを空の配列で初期化
  end

  # 配られたカードを手札に追加するメソッド
  def receive_cards(cards)
    @reserve_hand.concat(cards) # リザーブハンドにカードを追加
  end

  # 手札から一番上のカードを取り出して返すメソッド
  def play_card
    if @hand.empty? && !@reserve_hand.empty? # 手札が空になったらリザーブハンドのカードを手札に移す
      @hand = @reserve_hand.shuffle # リザーブハンドのカードをシャッフルして手札に移す
      @reserve_hand = [] # リザーブハンドを空の配列にする
    end
    card = @hand.shift # 手札から一番上のカードを取り出して返す
    puts "#{@name}のカードは#{card}です。" # デバッグ用にカードを表示
    card # カードを返す
  end

  # 手札とリザーブハンドのカードの合計を返すメソッド
  def total_cards
    @hand.size + @reserve_hand.size
  end
end
