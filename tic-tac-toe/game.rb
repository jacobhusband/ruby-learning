# frozen_string_literal: true

# contains attributes and methods for the game
class Game
  attr_accessor :board

  def initialize(player1, player2)
    @board = [[0, 0, 0], [0, 0, 0], [0, 0, 0]]
    @win_angles = [[[0,0], [0,1], [0,2]],
                   [[1,0], [1,1], [1,2]],
                   [[2,0], [2,1], [2,2]],
                   [[0,0], [1,0], [2,0]],
                   [[0,1], [1,1], [2,1]],
                   [[0,2], [1,2], [2,2]],
                   [[0,0], [1,1], [2,2]],
                   [[0,2], [1,1], [2,0]]]
    @valid_moves = ["a1", "a2", "a3", "b1", "b2", "b3", "c1", "c2", "c3"]
  end

  def make_move(move, player_marker)
    case
    when move == "a1"
      @board[0][0] = player_marker
    when move == "a2"
      @board[0][1] = player_marker
    when move == "a3"
      @board[0][2] = player_marker
    when move == "b1"
      @board[1][0] = player_marker
    when move == "b2"
      @board[1][1] = player_marker
    when move == "b3"
      @board[1][2] = player_marker
    when move == "c1"
      @board[2][0] = player_marker
    when move == "c2"
      @board[2][1] = player_marker
    when move == "c3"
      @board[2][2] = player_marker
    else
      p "Please enter a letter (a, b, or c) then a number (1, 2, or 3)"
      return false
    end
    true
  end

  def valid_move?(move)
    @valid_moves.include?(move) && move_taken?(move) ? true : false
  end

  def move_taken?(move)
    case
    when move == "a1"
      @board[0][0] == 0 ? true : false
    when move == "a2"
      @board[0][1] == 0 ? true : false
    when move == "a3"
      @board[0][2] == 0 ? true : false
    when move == "b1"
      @board[1][0] == 0 ? true : false
    when move == "b2"
      @board[1][1] == 0 ? true : false
    when move == "b3"
      @board[1][2] == 0 ? true : false
    when move == "c1"
      @board[2][0] == 0 ? true : false
    when move == "c2"
      @board[2][1] == 0 ? true : false
    when move == "c3"
      @board[2][2] == 0 ? true : false
    end
  end

  def show_board
    p '  a b c'
    p "1 #{@board[0][0]} #{@board[1][0]} #{@board[2][0]}"
    p "2 #{@board[0][1]} #{@board[1][1]} #{@board[2][1]}"
    p "3 #{@board[0][2]} #{@board[1][2]} #{@board[2][2]}"
  end

  def winner?(marker)
    @win_angles.each do |arr|
      num = 0
      arr.each do |p|
        num += 1 if @board[p[0]][p[1]] == marker
      end
      return "P" if num == 3
    end
    false
  end

  def draw?
    num = 0
    @board.each do |row|
      row.each do |item|
        if item == 'X' || item == 'O'
          num += 1
        end
      end
    end
    num == 9 ? true : false
  end
end
