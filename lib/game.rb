def Game

    def initialize

       @board = Board.new()
       @player1 = 'White'
       @player2 = 'Black'
       @turn = 1 

    end

    def play_turn
        @turn % 2 == 0 ? active = @player2 : active = @player1
        move = get_move
    end

    def get_move
        move = []
        piece = nil
        
        while !validate_piece(piece)
            puts 'Choose a valid piece to move (Ex: A7)'
            piece = gets.chomp
        end

        while !validate_move(piece, move)
            puts "Choose a valid move for #{piece.type} on #{piece.pos} (Ex: A7)"
            move = gets.chomp
        end
    end 

    def validate_piece(piece)
        return false if piece.nil
    end

    def validate_move(piece, move = [])
        return false if move.empty?
    end
end