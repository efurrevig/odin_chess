require_relative 'pieces.rb'

class Queen < Piece

    def initialize(color,pos)
        super
        @type = 'Queen'
    end
    
    def valid?(move)
        return true if move[0] > @pos[0] && move[1] == @pos[1] && check_down(move, arr)
        return true if move[0] < @pos[0] && move[1] == @pos[1] && check_up(move, arr)
        return true if move[1] > @pos[1] && move[0] == @pos[0] && check_right(move, arr)
        return true if move[1] < @pos[1] && move[0] == @pos[0] && check_left(move,arr)
        return true if move[0] < @pos[0] && move[1] > @pos[1] && check_up_right(move, arr)
        return true if move[0] < @pos[0] && move[1] < @pos[1] && check_up_left(move, arr)
        return true if move[0] > @pos[0] && move[1] < @pos[1] && check_down_left(move, arr)
        return true if move[0] > @pos[0] && move[1] > @pos[1] && check_down_right(move, arr)
        return false       

    end
    def check_down(move = [], arr = [])
        start = @pos
        r = start[0]+1
        while r <= move[0]
            if r != move[0] && (arr[r][start[1]].is_a? Piece)
                return false
            end
            if r == move[0] && (arr[r][start[1]].is_a? Piece) && arr[r][start[1]].color == @color
                return false
            end
            r += 1
        end
        return true
    end

    def check_up(move = [], arr = [])
        start = @pos
        r = start[0]-1
        until r < move[0]
            if r != move[0] && (arr[r][start[1]].is_a? Piece)
                return false
            end
            if r == move[0] && (arr[r][start[1]].is_a? Piece) && arr[r][start[1]].color == @color
                return false
            end
            r -= 1
        end
        return true
    end

    def check_left(move = [], arr = [])
        start = @pos
        c = start[1]-1
        until c < move[1]
            if c != move[1] && (arr[start[0]][c].is_a? Piece)
                return false
            end
            if c == move[1] && (arr[start[0]][c].is_a? Piece) && arr[start[0]][c].color == @color
                return false
            end
            c -= 1
        end
        return true
    end

    def check_right(move = [], arr = [])
        start = @pos
        c = start[1]+1
        until c > move[1]
            if c != move[1] && (arr[start[0]][c].is_a? Piece)
                return false
            end
            if c == move[1] && (arr[start[0]][c].is_a? Piece) && arr[start[0]][c].color == @color
                return false
            end
            c += 1
        end
        return true
    end

    def check_up_right(move = [], arr = [])
        start = @pos
        r = start[0]-1
        c = start[1]+1

        while r >= move[0] || c <= move[1]
            if [r,c] != move && (arr[r][c].is_a? Piece)
                return false
            end
            if [r,c] == move && (arr[r][c].is_a? Piece) && arr[r][c].color == @color
                return false
            end
            r -= 1
            c += 1
        end
        return false if [r+1,c-1] != move
        return true

    end

    def check_up_left(move = [], arr = [])
        start = @pos
        r = start[0]-1
        c = start[1]-1

        while r >= move[0] || c >= move[1]
            if [r,c] != move && (arr[r][c].is_a? Piece)
                return false
            end
            if [r,c] == move && (arr[r][c].is_a? Piece) && arr[r][c].color == @color
                return false
            end
            r -= 1
            c -= 1
        end
        return false if [r+1,c+1] != move
        return true
    end

    def check_down_right(move = [], arr = [])
        start = @pos
        r = start[0]+1
        c = start[1]+1

        while r <= move[0] || c <= move[1]
            if [r,c] != move && (arr[r][c].is_a? Piece)
                return false
            end
            if [r,c] == move && (arr[r][c].is_a? Piece) && arr[r][c].color == @color
                return false
            end
            r += 1
            c += 1
        end
        return false if [r-1,c-1] != move
        return true
    end

    def check_down_left(move = [], arr = [])
        start = @pos
        r = start[0]+1
        c = start[1]-1

        while r <= move[0] || c >= move[1]
            if [r,c] != move && (arr[r][c].is_a? Piece)
                return false
            end
            if [r,c] == move && (arr[r][c].is_a? Piece) && arr[r][c].color == @color
                return false
            end
            r += 1
            c -= 1
        end
        return false if [r-1,c+1] != move
        return true
    end
end