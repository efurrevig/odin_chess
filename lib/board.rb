require_relative 'pieces.rb'

class Board

    attr_accessor :board, :white_start, :black_start
    attr_reader   :white_start, :black_start, :white_piece_symbols, :black_piece_piece_symbols



    def initialize
        @board = nil
        @black_start = [Rook.new([0,0], 'black'), Knight.new([0,1], 'black'), 
                        Bishop.new([0,2],'black'), Queen.new([0,3],'black'), 
                        King.new([0,4],'black'), Bishop.new([0,5],'black'), 
                        Knight.new([0,6],'black'), Rook.new([0,7],'black')]
        @white_start = [Rook.new([0,0], 'white'), Knight.new([0,1], 'white'), 
                        Bishop.new([0,2],'white'), Queen.new([0,3],'white'), 
                        King.new([0,4],'white'), Bishop.new([0,5],'white'), 
                        Knight.new([0,6],'white'), Rook.new([0,7],'white')]
        @black_piece_symbols = {"King" => "\u2654", 
                                "Queen" => "\u2655",
                                "Rook" => "\u2656",
                                "Bishop" => "\u2657",
                                "Knight" => "\u2658",
                                "Pawn" => "\u2659"}
        @white_piece_symbols = {"King" => "\u265A", 
                                "Queen" => "\u265B",
                                "Rook" => "\u265C",
                                "Bishop" => "\u265D",
                                "Knight" =>  "\u265E",
                                "Pawn" => "\u265F"}
    end

    def create_board
        arr = []
        for r in 0..7
            arr << Array.new
            for c in 0..7
                if r == 0
                    arr[r] << @black_start[c]
                elsif r == 1
                    arr[r] << Pawn.new([r,c], 'black')
                elsif r == 7
                    arr[r] << @white_start[c]
                elsif r == 6
                    arr[r] << Pawn.new([r,c], 'white')
                else
                    arr[r] << 0
                end
            end
        end
        @board = arr
    end

    def validate_move(piece, move = [])

    end

    def get_piece_at_position(pos = [])
        r, c = pos
        return @board[r][c]
    end

    def move_piece(piece, move = [])
        #set pieces current position on board to 0
        r, c = piece.pos
        board[r][c] = 0
        #set piece.pos to new position
        piece.pos = move
        #set pieces new position on board
        r, c = move
        @board[r][c] = piece
    end

    def print_board
        for r in 0...@board.length
            puts ''
            for c in 0...@board[r].length
                if @board[r][c].is_a? Piece
                    if @board[r][c].color == 'white'
                        print " #{@white_piece_symbols[@board[r][c].type]} "
                    elsif @board[r][c].color == 'black'
                        print " #{@black_piece_symbols[@board[r][c].type]} "
                    end
                else
                    print " #{@board[r][c]} "
                end
            end
        end
        puts ''
    end

end

board = Board.new
board.create_board
board.print_board
piece = board.get_piece_at_position([0,1])
piece2 = board.get_piece_at_position([1,1])
board.print_board
puts piece.valid?([2,2], board.board)


