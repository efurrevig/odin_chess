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

end

class Knight < Piece

    def initialize(color,pos)
        super
        @type = 'Knight'
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
