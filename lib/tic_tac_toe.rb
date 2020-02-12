require 'pry'
class TicTacToe 
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end
 
  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end
 
  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end
 
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
    ]
    
  def input_to_index(num)
    a = num.to_i
    b = a - 1
    b
  end
    
  def move(num, token = "X")
    @board[num] = token
  end
    
  def position_taken?(index)
    if @board[index] == " "
       false
    else 
       true
    end
  end
    
  def valid_move?(index)
    if index > -1 && index < 9 && @board[index] == " "
      true
    else
      false
    end
  end
  
  def turn
    puts "Please enter 1-9"
    input = gets
    a = input_to_index(input)
    if valid_move?(a) == true
      move(a, current_player)
      display_board
    else
      turn
    end
  end
  def won?
    WIN_COMBINATIONS.each do |win_combination|
     win_index_1 = win_combination[0]
     win_index_2 = win_combination[1]
     win_index_3 = win_combination[2]
     position_1 = @board[win_index_1] 
     position_2 = @board[win_index_2] 
     position_3 = @board[win_index_3] 
     if position_1 == position_2 && position_2 == position_3 && position_taken?(win_index_1)
       return win_combination
     end
    end
    false
  end
  
  def full?
    if @board.include?(" ")
      false
    else
      true
    end
  end
  def draw?
    if full? == true && won? == false 
      true
    else
      false
    end
  end
  
  def over?
    if won? == true || draw? == true
      true
    else
      false
    end
  end
  
  def winner
    if won?
      a = (won?)
      b = a[0]
      @board[b]
    end
  end
  
  def play 
    until over? == true
    turn
    end
    if won? == true
      w = winner
      puts "Congratulations #{w}!"
    else
      puts "Cat's Game!"
    end
  end
end