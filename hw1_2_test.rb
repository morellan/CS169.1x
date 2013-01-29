require 'minitest/autorun'

load 'hw1_2.rb'

describe "Homework 1, ex 2" do
  it "should respond to rps_game_winner method" do
    Object.respond_to?(:rps_game_winner, true).must_equal true
  end

  it "should raise a WrongNumberOfPlayersError if the number of players is not 2" do
    [1, 3, 4, 5].each do |i|
      assert_raises(WrongNumberOfPlayersError) { rps_game_winner([["Player", "R"]] * i) }
    end

    #rps_game_winner([["Player", "R"]] * 2).must_be_silent
  end

  it "should raise a NoSuchStrategyError if either player's strategy is something other than R, P or S (case-insensitive)" do
    # normal game
    #rps_game_winner([["Player 1", "P"], ["Player 2", "S"]]).must_be_silent

    assert_raises(NoSuchStrategyError) { rps_game_winner([["Player 1", "X"], ["Player 2", "S"]]) }
    assert_raises(NoSuchStrategyError) { rps_game_winner([["Player 1", "S"], ["Player 2", "X"]]) }
    assert_raises(NoSuchStrategyError) { rps_game_winner([["Player 1", "Y"], ["Player 2", "X"]]) }
    # case insensitive
    assert_raises(NoSuchStrategyError) { rps_game_winner([["Player 1", "z"], ["Player 2", "s"]]) }
  end

  it "should play a valid rock-paper-scissors game" do
    # rock beats scissors
    rps_game_winner([["Player 1", "R"], ["Player 2", "S"]]).must_equal ["Player 1", "R"]
    rps_game_winner([["Player 1", "S"], ["Player 2", "R"]]).must_equal ["Player 2", "R"]
    # scissors beats paper
    rps_game_winner([["Player 1", "S"], ["Player 2", "P"]]).must_equal ["Player 1", "S"]
    rps_game_winner([["Player 1", "P"], ["Player 2", "S"]]).must_equal ["Player 2", "S"]
    # paper beats rock
    rps_game_winner([["Player 1", "P"], ["Player 2", "R"]]).must_equal ["Player 1", "P"]
    rps_game_winner([["Player 1", "R"], ["Player 2", "P"]]).must_equal ["Player 2", "P"]
  end

  it "should declare the first player as the winner if both players play the same move" do
    rps_game_winner([["Player 1", "R"], ["Player 2", "R"]]).must_equal ["Player 1", "R"]
    rps_game_winner([["Player 1", "P"], ["Player 2", "P"]]).must_equal ["Player 1", "P"]
    rps_game_winner([["Player 1", "S"], ["Player 2", "S"]]).must_equal ["Player 1", "S"]
  end

  # rps tournament winner
  it "should respond to rps_tournament_winner method" do
    Object.respond_to?(:rps_tournament_winner, true).must_equal true
  end

  it "should declare the winner of a rps tournament" do
    game = [
      [
        [ ["Armando", "P"], ["Dave", "S"] ],
        [ ["Richard", "R"],  ["Michael", "S"] ],
      ],
      [
        [ ["Allen", "S"], ["Omer", "P"] ],
        [ ["David E.", "R"], ["Richard X.", "P"] ]
      ]
    ]

    rps_tournament_winner(game).must_equal ["Richard", "R"]
  end

  it "should return the same as rps_game_winner when there is no tournament" do
    game = [["Player 1", "S"], ["Player 2", "S"]]
    rps_tournament_winner(game).must_equal rps_game_winner(game)
  end
end