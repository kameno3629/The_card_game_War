# frozen_string_literal: true

# Gameクラスは、戦争ゲームのロジックを管理します
class Game
  # プレイヤーの名前リストを受け取り、プレイヤーオブジェクトを作成
  def initialize(user_names)
    @users = user_names.map { |name| Users.new(name) } # 各プレイヤーのオブジェクトを作成
    @deck = Deck.new # デッキを生成
    deal_cards # カードを配ります
  end

  # プレイヤーにカードを配るメソッド
  def deal_cards
    hands = @deck.deal(@users.size) # デッキからプレイヤーの数に応じてカードを配る
    @users.each_with_index do |user, index| # 各プレイヤーにカードを配る
      user.receive_cards(hands[index]) # プレイヤーにカードを渡す
    end
  end

  # ラウンドを行うメソッド
  def play_round(played_cards = [])
    puts '戦争！'
    new_played_cards = @users.map { |user| [user, user.play_card] } # 各プレイヤーがカードを1枚出す
    played_cards.concat(new_played_cards) # 既に場に出ているカードに追加する

    winner = determine_winner(new_played_cards)
    if winner.nil?
      puts '引き分けです。もう一枚カードを出します。' # 引き分けメッセージを表示
      play_round(played_cards) # 引き分けの場合、再度カードを出す
      return
    end

    winner_cards = played_cards.map { |_, card| card } # 勝者のカードを配列で取得
    winner.receive_cards(winner_cards) # 勝者にカードを配る
    puts "#{winner.name}が勝ちました。" # 勝者の名前を表示
  end

  def determine_winner(new_played_cards)
    spade_ace = new_played_cards.find { |_, card| card.suit == 'Spade' && card.rank == 'A' }
    return spade_ace[0] if spade_ace

    max_value = new_played_cards.map { |_, card| card.value }.max # 出されたカードの中で最大の値を取得
    winners = # 最大の値を持つカードを出したプレイヤーを取得
      new_played_cards.select do |_, card|
        card.value == max_value
      end.map { |user, _| user }
    winners.size > 1 ? nil : winners.first # 引き分けの場合はnilを返し、勝者が決まった場合はそのプレイヤーを返す
  end

  # ゲームを行うメソッド
  def play_game
    until @users.any? { |user| user.total_cards.zero? } # プレイヤーの手札がなくなるまでラウンドを繰り返す
      play_round # ラウンドを実行
    end

    display_results
  end

  def display_results
    # 手札がなくなったプレイヤーを表示
    loser = @users.find { |user| user.total_cards.zero? }
    puts "#{loser.name}の手札がなくなりました。"

    # 各プレイヤーの手札の枚数を表示
    @users.each { |user| print "#{user.name}の手札の枚数は#{user.total_cards}枚です。" }

    puts ''

    # プレイヤーを手札の枚数でソートして順位を表示
    sorted_users = @users.sort_by { |user| -user.total_cards }
    sorted_users.each_with_index do |user, index|
      print "#{user.name}が#{index + 1}位です。"
    end

    puts ''

    puts '戦争を終了します' # ゲーム終了のメッセージを表示
  end
end
