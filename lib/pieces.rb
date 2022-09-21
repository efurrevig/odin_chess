class Piece

    def initialize(color)
        @pos = nil
        @color = nil
        @active = true
    end


end

class Pawn < Piece

    def initialize
        @moves = [1,0][1,1][1,-1]
    end

end

class Knight < Piece

    def initialize
    end

end

class Bishop < Piece

    def initialize
    end
    
end

class Rook < Piece

    def initialize
    end
    
end

class Queen < Piece

    def initialize
    end
    
end

class King < Piece

    def initialize
    end
    
end 