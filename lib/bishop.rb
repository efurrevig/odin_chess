require_relative 'pieces.rb'

class Bishop < Piece

    def initialize(color,pos)
        super
        @type = 'Bishop'
    end

    def valid?(move = [], arr = [])
        return true if move[0] < @pos[0] && move[1] > @pos[1] && check_up_right(move, arr)
        return true if move[0] < @pos[0] && move[1] < @pos[1] && check_up_left(move, arr)
        return true if move[0] > @pos[0] && move[1] < @pos[1] && check_down_left(move, arr)
        return true if move[0] > @pos[0] && move[1] > @pos[1] && check_down_right(move, arr)
        return false
    end
    
    def check_up_right(move = [], arr = [])
        start = @pos
        r = start[0]-1
        c = start[1]+1

        while r >= move[0] && c <= move[1]
            if [r,c] != move && (arr[r][c].is_a? Piece)
                return false
            end
            if [r,c] == move && (arr[r][c].is_a? Piece) && arr[r][c].color == @color
                return false
            end
            r -= 1
            c += 1
        end
        return true

    end

    def check_up_left(move = [], arr = [])
        start = @pos
        r = start[0]-1
        c = start[1]-1

        while r >= move[0] && c >= move[1]
            if [r,c] != move && (arr[r][c].is_a? Piece)
                return false
            end
            if [r,c] == move && (arr[r][c].is_a? Piece) && arr[r][c].color == @color
                return false
            end
            r -= 1
            c -= 1
        end
        return true
    end

    def check_down_right(move = [], arr = [])
        start = @pos
        r = start[0]+1
        c = start[1]+1

        while r >= move[0] && c <= move[1]
            if [r,c] != move && (arr[r][c].is_a? Piece)
                return false
            end
            if [r,c] == move && (arr[r][c].is_a? Piece) && arr[r][c].color == @color
                return false
            end
            r += 1
            c += 1
        end
        return true
    end

    def check_down_left(move = [], arr = [])
        start = @pos
        r = start[0]+1
        c = start[1]-1

        while r <= move[0] && c >= move[1]
            if [r,c] != move && (arr[r][c].is_a? Piece)
                return false
            end
            if [r,c] == move && (arr[r][c].is_a? Piece) && arr[r][c].color == @color
                return false
            end
            r += 1
            c -= 1
        end
        return true
    end
    
end