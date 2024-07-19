# debugツールの定義
require 'debug'

# デッキの定義をするクラス
class Deck
    attr_reader :cards # attr_readerで値を引っ張れるようにする
  
    def initialize
        @cards = Card.all_cards # 全てのカードを取得
      shuffle # カードをシャッフルする
    end
  
    def shuffle # 再度シャッフルしたいときに呼び出す
      @cards.shuffle!
    end
  
    def deal(num_users)
      @cards.each_slice(@cards.size / num_users).to_a # カードを配布したいときに呼び出す
    end
end