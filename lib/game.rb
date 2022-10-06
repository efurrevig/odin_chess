require_relative 'board.rb'
class Game

    def initialize

       @game = Board.new()
       @player1 = 'White'
       @player2 = 'Black'
       @turn = 1 

    end

    def display
        @game.print_board
    end

    def play_turn
        @turn % 2 == 0 ? active = @player2 : active = @player1
        move = get_move(active)
        print move
        @game.move_piece(move[0], move[1])
        @turn += 1
    end

    def convert_player_input(string)
        case string[0].upcase
        when 'A'
            string[0] = 0
        when 'B'
            string[0] = 1
        when 'C'
            string[0] = 2
        when 'D'
            string[0] = 3
        when 'E'
            string[0] = 4
        when 'F'
            string[0] = 5
        when 'G'
            string[0] = 6
        when 'H'
            string[0] = 7
        end
        string[1] = string[1].to_i
        string.reverse!
    end

    def get_move(player)
        move = []
        piece = nil
        
        while !validate_piece(piece, player)
            puts 'Choose a valid piece to move (Ex: A7)'
            piece = gets.chomp
            piece = piece.split('')
            convert_player_input(piece)
        end
        while !validate_move(piece, move)
            piece = @game.board[piece[0]][piece[1]]
            puts "Choose a valid move for #{piece.type} on #{piece.pos} (Ex: A7)"
            move = gets.chomp
            move = move.split('')
            convert_player_input(move)
            print "#{move}"
            puts ''
        end
        return [piece, move]
    end 

    def validate_piece(piece, player)
        return false if piece.nil?
        @game.board[piece[0]][piece[1]].color == player.downcase ? true : false
    end

    def validate_move(piece, move = [])
        return false if move.empty?
        piece.valid?(move, @game.board) ? true : false
    end
end

game = Game.new
print game.display
game.play_turn
print game.display