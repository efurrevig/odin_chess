class Piece
    attr_accessor :pos, :active
    attr_reader :color, :type
    def initialize(pos, color)
        @pos = pos
        @pos1 = pos
        @color = color
        @active = true
    end


end 
