
WIN_COMBINATIONS = [[0,1,2], [3,4,5],[6,7,8], [0,4,8], [2,4,6], [1,4,7],
[2,5,8], [0,3,6]]


def display_board(board=[" ", " ", " ", " ", " ", " "," ", " ", " "])
p " #{board[0]} | #{board[1]} | #{board[2]} "
p "-----------"
p " #{board[3]} | #{board[4]} | #{board[5]} "
p "-----------"
p " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(user_input)
  user_input.to_i - 1
end

def move(board, index, character)
board[index] = character
end

def position_taken?(board,index)
  if board[index] == " "
    return false
  elsif board[index] == "X" or board[index] == "O"
    return true
      end
end


def valid_move?(board,index)
  if position_taken?(board,index) == false and index >= 0 and index <= 8
    return true
  end
return false
end


def turn(board)
  puts "Please enter a number 1-9: "
  user_input = gets.strip
  index = input_to_index(user_input)
  if valid_move?(board,index)
    character = current_player(board)
    move(board, index, character)
    display_board(board)
  else
    turn(board)
  end

end


def turn_count(board)
  board.count{|i| i =="X" or i == "O"}
end

def current_player(board)
  turn = turn_count(board)
  if turn%2 == 0
    return "X"
  elsif turn%2 == 1
    return "O"
  end
end


def won?(board)
  WIN_COMBINATIONS.each do |i|
    if (board[i[0]] == "X" and board[i[1]] == "X" and board[i[2]] == "X")
      return i
    elsif  board[i[0]] == "O" and board[i[1]] == "O" and board[i[2]] == "O"
      return i
    end
  end

  return false
end



# def full?(board)
#   if turn_count(board) == 9
#     return true
#   end
#   return false
# end

def full?(board)
   if board.detect {|i| i == " " || i == nil}
     return false
   else
     return true
   end
 end


def draw?(board)
if !won?(board) and full?(board)
  return true
else
  return false
end
end

def over?(board)
  if draw?(board)
    return true
  elsif won?(board)
    return true
  #   elsif full?(board)
  #  return true
 else
  return false
end
end

def winner(board)
  if won?(board)
    if board.count{|i| i=="X"}%2 == 0
      return "O"
    elsif board.count{|i| i=="X"}%2  == 1
      return "X"
    end
  end

end



def play(board)
   until over?(board) == true
     turn(board)
   end

   if won?(board) !=false
     puts "Congratulations #{winner(board)}!"
   elsif draw?(board)
     puts "Cat's Game!"
   else
     puts "Congratulations #{current_player(board)}!"
   end


 end
