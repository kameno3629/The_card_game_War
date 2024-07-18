# debugツールの定義
require 'debug'

# デッキの定義をするクラス
class Deck
    # attr_readerで他クラスからcardsを引っ張れるようにする
    attr_reader :cards
    # 52枚のカードを生成(カードをcardクラスから作成するだけで、デッキはまだ作成していません)（@cardsインスタンス変数）
    def initialize
        @cards = [] #空白を入れて初期化
        Card::SUIT.each do |suit| # suitはこのブロック内だけで有効なブロック変数です。SUITはCardクラスで定義した定数です。
        # Card::SUITは、Cardクラスに属するSUIT定数という意味です。
            Card::RANK.each do |rank| #rankはこのブロック内だけで有効なブロック変数です。RANKはCardクラスで定義した定数です。
                @cards << Card.new(suit, rank, Card::VALUE[rank]) # ()内の変数はVALUE以外すべてブロック変数です。VALUEはCardクラスで定義した定数です。
            end
        end
    end
    # @cardsの順番をランダムにシャッフルします。
    def shuffle
        @cards.shuffle
    end
    # プレイヤーの人数に応じてカードを均等に分割し、配布します。
    #（ここで実際に配布はしていません。後にusers.rb内でDeck.newし、生成されたDockインスタンスを通じてdealメソッドが使われます）
    def deal
        @cards.shift # デッキの先頭から1枚のカードを取り出し、そのカードを返します。
    end
end