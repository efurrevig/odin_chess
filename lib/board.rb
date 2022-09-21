class Board

    attr_accessor :start, :white_pieces, :black_pieces, :board



    def initialize
        @board = create_board
    end

    def create_board
        arr = []
        start = ['Rook', 'Knight', 'Bishop', 'Queen','King', 'Bishop', 'Knight', 'Rook']
        white_pieces = {"King" => "\u2654", 
            "Queen" => "\u2655",
            "Rook" => "\u2656",
            "Bishop" => "\u2658",
            "Knight" => "\u2659",
            "Pawn" => "\u2659"}
        black_pieces = {"King" => "\u265A", 
            "Queen" => "\u265B",
            "Rook" => "\u265C",
            "Bishop" => "\u265D",
            "Knight" =>  "\u265E",
            "Pawn" => "\u265F"}
        for r in 0..7
            arr << Array.new
            for c in 0..7
                if r == 0
                    arr[r] << black_pieces[start[c]]
                elsif r == 1
                    arr[r] << black_pieces["Pawn"]
                elsif r == 7
                    arr[r] << white_pieces[start[c]]
                elsif r == 6
                    arr[r] << white_pieces["Pawn"]
                else
                    arr[r] << 0
                end
            end
        end
        return arr
    end

    def print_board
        for r in 0...@board.length
            puts ''
            for c in 0...@board[r].length
                print " #{@board[r][c]} "
            end
        end
    end

end

board = Board.new
board.create_board
board.print_board
