class Piece
    attr_accessor :pos, :color
    attr_reader :color, :active, :type
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
            return false if arr[move[0]][move[1]].is_a? Piece && arr[move[0]][move[1]].color == 'black'
            valid = [1,0], [1,1], [1,-1]
            valid.each do |i|
                if [@pos[0] + i[0], @pos[1] + i[1]] == move
                    return true
                end
            end
        end
        if @color == 'white'
            #false if move puts piece on another white piece
            return false if arr[move[0]][move[1]].is_a? Piece && arr[move[0]][move[1]].color == 'white'
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
            return false if arr[move[0]][move[1]].is_a? Piece && arr[move[0]][move[1]].color == 'black'
            valid = [2,1],[2,-1],[-2,1],[-2,-1],[1,2],[1,-2],[-1,2],[-1,-2]
            valid.each do |i|
                if [@pos[0] + i[0], @pos[1] + i[1]] == move
                    return true
                end
            end
        end
        if @color == 'white'
            #false if move puts piece on another white piece
            return false if arr[move[0]][move[1]].is_a? Piece && arr[move[0]][move[1]].color == 'white'
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

class Bishop < Piece

    def initialize(color,pos)
        super
        @type = 'Bishop'
    end
    
end

class Rook < Piece

    def initialize(color,pos)
        super
        @type = 'Rook'
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
