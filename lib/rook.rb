require_relative 'pieces.rb'

class Rook < Piece

    def initialize(color,pos)
        super
        @type = 'Rook'
    end

    def valid?(move = [], arr = [])
        #[6,0]
        valid = [1,0][-1,0][0,1][0,-1]
        r,c = move
        return false if r != @pos[0] && c != pos[1]
        return true if move[0] > @pos[0] && check_down(move, arr)
        return true if move[0] < @pos[0] && check_up(move, arr)
        return true if move[1] > @pos[1] && check_right(move, arr)
        return true if move[1] < @pos[1] && check_left(move,arr)
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
         
    
end