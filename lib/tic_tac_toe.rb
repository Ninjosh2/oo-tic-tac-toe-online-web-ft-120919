class TicTacToe
  def initialize (board = nil)
    @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
    [0, 1, 2], 
    [3, 4, 5], 
    [6, 7, 8], 
    [0, 3, 6],
    [1, 4, 7], 
    [2, 5, 8],
    [0, 4, 8], 
    [2, 4, 6] 
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(input)
    @index = input.to_i - 1
  end

  def move(index, current_player = "X")
  @board[index] = current_player
end

  def position_taken?(index)
    !(@board[index] == " " || @board[index] == "" || @board[index] == nil)
  end

  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end

  def turn_count
    counter = 0
    @board.each do |pos|
        if pos == "X" || pos == "O"
          counter += 1
        end
    end
    counter
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn
    puts "It's #{current_player}'s turn."
    puts "Please enter 1-9:"
    input = gets.strip
    if input == "exit"
      over?("exit")
    end
    index = input_to_index(input)
    if valid_move?(index)
      move(index, current_player)
      display_board
    else
      turn
    end
  end

  def play
    until over?

    end
    if over?
      if draw?
        puts "Cat's Game!"
      end
      if won?
        puts "Congratulations #{@winner}!"
      end
    end
  end

  def over?
    won? || draw?
  end

  def won?
    WIN_COMBINATIONS.each do |combo|
      windex0 = combo[0]
      windex1 = combo[1]
      windex2 = combo[2]

      position_0 = @board[windex0]
      position_1 = @board[windex1]
      position_2 = @board[windex2]

      if position_taken?(windex0) && position_0 == position_1 && position_1 == position_2
        return combo
      end
    end
    false
  end

  def full?
    !(@board.include?(" ") || @board.include?(""))
  end

  def draw?
    !won? && full?
  end

  def winner
    if won?
      @board[won?[0]]
    end
  end

end