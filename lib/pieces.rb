class Piece
    attr_accessor :pos, :active
    attr_reader :color, :type
    def initialize(pos, color)
        @pos = pos
        @color = color
        @active = true
    end


end

class Pawn < Piece

    def initialize(color,pos)
        super
        @type = "Pawn"
    end

    #move validation
    def valid?(move = [], arr = [])
        if @color == 'black'
            #false if move puts piece on another black piece
            return false if (arr[move[0]][move[1]].is_a? Piece) && arr[move[0]][move[1]].color == 'black'
            valid = [1,0], [1,1], [1,-1]
            valid.each do |i|
                if [@pos[0] + i[0], @pos[1] + i[1]] == move
                    return true
                end
            end
        end
        if @color == 'white'
            #false if move puts piece on another white piece
            return false if (arr[move[0]][move[1]].is_a? Piece) && arr[move[0]][move[1]].color == 'white'
            valid = [1,0], [1,1], [1,-1]
            valid.each do |i|
                if [@pos[0] + i[0], @pos[1] + i[1]] == move
                    return true
                end
            end
        end
        return false
    end

end

class Knight < Piece

    def initialize(color,pos)
        super
        @type = 'Knight'
    end

    def valid?(move = [], arr = [])
        if @color == 'black'
            #false if move puts piece on another black piece
            return false if (arr[move[0]][move[1]].is_a? Piece) && arr[move[0]][move[1]].color == 'black'
            valid = [2,1],[2,-1],[-2,1],[-2,-1],[1,2],[1,-2],[-1,2],[-1,-2]
            valid.each do |i|
                if [@pos[0] + i[0], @pos[1] + i[1]] == move
                    return true
                end
            end
        end 
        if @color == 'white'
            #false if move puts piece on another white piece
            return false if (arr[move[0]][move[1]].is_a? Piece) && arr[move[0]][move[1]].color == 'white'
            valid = [2,1],[2,-1],[-2,1],[-2,-1],[1,2],[1,-2],[-1,2],[-1,-2]
            valid.each do |i|
                if [@pos[0] + i[0], @pos[1] + i[1]] == move
                    return true
                end
            end
        end
        return false
    end

end

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

class Queen < Piece

    def initialize(color,pos)
        super
        @type = 'Queen'
    end
    
end

class King < Piece

    def initialize(color,pos)
        super
        @type = 'King'
    end
    
end 
