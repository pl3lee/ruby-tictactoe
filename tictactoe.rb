class TicTacToe
    def initialize()
        @board = 
        [["B", "B", "B"], 
        ["B", "B", "B"], 
        ["B", "B", "B"]]
        @turn = 1
        @positions = 
        [["1", "2", "3"], 
        ["4", "5", "6"], 
        ["7", "8", "9"]]
    end

    def print_board()
        puts "-------------"
        @board.each do |row|
            row.each do |element|
                if element == "B"
                    print "|   "
                else
                    print "| #{element} "
                end
                
            end
            puts "|"
            puts "-------------"
        end
    end

    def print_positions()
        puts "-------------"
        @positions.each do |row|
            row.each do |element|
                print "| #{element} "
            end
            puts "|"
            puts "-------------"
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
        (0..2).each do |i|
            if @board[0][i] == @board[1][i] && @board[1][i] == @board[2][i] && @board[0][i] != "B"
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

    def check_tie()
        if self.check_win
            return false
        end
        temp = @board.flatten
        temp.each do |i|
            if i == "B"
                return false
            end
        end
        return true
    end

    #position: 0-8
    def check_available(position)
        if self.get_position(position) != "B"
            return false
        end
        return true
    end

    def play_round()
        puts "Here are the valid positions:"
        self.print_positions
        puts "Here is the board:"
        self.print_board
        puts "Player #{@turn}'s turn, make a move."
        
        position = 0
        while true
            position = gets
            if position.to_i < 1 || position.to_i > 9 || self.check_available(position.to_i - 1) == false
               puts "Invalid input, try again" 
            else
                position = position.to_i - 1
                break
            end
        end
        symbol = "O"
        if @turn == 1
            symbol = "O"
            @turn = 2
        else
            symbol = "X"
            @turn = 1
        end
        self.change_board(position, symbol)
        if self.check_win
            @turn == 1? win = 2 : win = 1
            self.print_board
            puts "Player #{win} won! Congratulations!"
        end
        if self.check_tie
            self.print_board
            puts "This is a tie!"
        end
    end
end

game = TicTacToe.new
while !game.check_win && !game.check_tie
    game.play_round
end
