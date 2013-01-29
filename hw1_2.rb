class WrongNumberOfPlayersError <  StandardError ; end
class NoSuchStrategyError <  StandardError ; end

class GamePlayer
  @@valid_moves = ["R", "P", "S"]

  attr_reader :move

  def initialize(player)
    @name = player.first
    @move = player.last.upcase
  end

  def valid_move?
    @@valid_moves.include?(@move)
  end

  def to_a
    [@name, @move]
  end

  def self.winner(p1, p2)
    return p1.to_a if p1.move == p2.move

    if (p1.move == "R" and p2.move == "S") or
       (p1.move == "S" and p2.move == "P") or
       (p1.move == "P" and p2.move == "R")
      p1.to_a
    else
      p2.to_a
    end
  end

  def self.valid_player?(p)
    p.first.class == "".class and p.last.class == "".class
  end
end

def rps_game_winner(game)
  raise WrongNumberOfPlayersError unless game.length == 2

  p1 = GamePlayer.new(game.first)
  p2 = GamePlayer.new(game.last)

  raise NoSuchStrategyError unless p1.valid_move? and p2.valid_move?

  GamePlayer.winner(p1, p2)
end

def rps_tournament_winner(game)
  raise WrongNumberOfPlayersError unless game.length == 2

  t1 = game.first
  t2 = game.last

  if GamePlayer.valid_player?(t1) and GamePlayer.valid_player?(t2)
    rps_game_winner [t1, t2]
  else
    rps_game_winner [rps_tournament_winner(t1), rps_tournament_winner(t2)]
  end
end