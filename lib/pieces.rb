class Piece
    attr_accessor :pos, :active
    attr_reader :color, :type, :pos1
    def initialize(pos, color)
        @pos = pos
        @pos1 = pos
        @color = color
        @active = true
    end

    def check?
        
    end
end 
