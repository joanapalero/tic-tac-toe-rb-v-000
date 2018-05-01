# Define your WIN_COMBINATIONS constant

WIN_COMBINATIONS = [
  [0,1,2], #Top row
  [3,4,5], #Middle row
  [6,7,8], #Bottom row
  [0,3,6], #Left column
  [1,4,7], #Middle column
  [2,5,8], #Right column
  [0,4,8], #Diagonal 1 
  [6,4,2]  #Diagonal 2
  
]

# display_board
def display_board(board)
  puts" #{board[0]} | #{board[1]} | #{board[2]} "
  puts"-----------"
  puts" #{board[3]} | #{board[4]} | #{board[5]} "
  puts"-----------"
  puts" #{board[6]} | #{board[7]} | #{board[8]} "  
end

def move(board, position, token)
  index = position.to_i-=1
  board[index] = token
end


# input_to_index
def input_to_index(index)
  converted_index = index.to_i
  converted_index -= 1
end

def position_taken?(board, index)
  !(board[index] == " ")
  # if board[index] == " "
  #  FALSE
  #else
  #  TRUE
  #end
end

    
def valid_move?(board, position)
  index = position.to_i-1
  index.between?(0,8) && position_taken?(board, index)
end
 
#turn
    def turn(board)
    puts "Please enter 1-9:"
    position = gets.strip
    if valid_move?(board, position) 
      token = current_player(board)
      move(board, position, token)
      display_board(board)
    else
      turn(board)
    end
end

# Current Player
def turn_count(board)
  9 - board.count(" ")
end

 def current_player(board)
  if turn_count(board).even?
    "X"
  else
    "O"
  end
end

# won?
def won?
    WIN_COMBINATIONS.each do|combination|
      win_index1 = combination[0]
      win_index2 = combination[1]
      win_index3 = combination[2]
      
      position1 = @board[win_index1]
      position2 = @board[win_index2]
      position3 = @board[win_index3]
      
      if (position1 == "X" && position2 == "X" && position3 == "X") ||
         (position1 == "O" && position2 == "O" && position3 == "O") 
        return combination
      end
    end
    return false
  end

# full
def full?
  @board.all?{|i| i == "X" || i == "O"}
end

# draw
def draw?
  return !won? && full?
  end

# over
def over?
  return won? || draw?
end

# winner
def winner
  if won?
    won?.all? do|position|
  if @board[position] == "X"
    return "X"
  else
    return "O"
      end
    end
 end
# end

def play
  while !over?
    turn
  end

if won?
  puts "Congratulations #{winner}!"
else draw?
  puts "Cat's Game!"
    end
  end
end