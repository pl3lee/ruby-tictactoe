class TicTacToe
   
    def initialize()
        @board = 
        [["O", "B", "B"], 
        ["B", "B", "B"], 
        ["O", "O", "O"]]
        @turn = 1
    end
    def print_board()
        @board.each do |row|
            print row
            puts
        end
    end
    #position: 0-8
    def change_board(position, symbol)
        if 0 <= position && position <= 2
            @board[0][position] = symbol
        elsif 3 <= position && position <= 5
            @board[1][position - 3] = symbol
        else
            @board[2][position - 6] = symbol
        end
    end
    #position: 0-8
    def get_position(position)
        if 0 <= position && position <= 2
            return @board[0][position]
        elsif 3 <= position && position <= 5
            return @board[1][position - 3]
        else
            return @board[2][position - 6]
        end
    end

    def check_win()
        @board.each do |row|
            if row[0] == row[1] && row[1] == row[2] && row[1] != "B"
                return true
            end
        end
        3.times do |i|
            if @board[i][0] == @board[i][1] && @board[i][1] == @board[i][2] && @board[i][0] != "B"
                return true
            end
        end
        if get_position(0) == get_position(4) && get_position(8) == get_position(4) && get_position(0) != "B"
            return true
        end
        if get_position(2) == get_position(4) && get_position(6) == get_position(4) && get_position(2) != "B"
            return true
        end
        return false
    end
end

game = TicTacToe.new
game.print_board()
puts game.check_win()