require_relative 'pieces.rb'

class King < Piece

    def initialize(color,pos)
        super
        @type = 'King'
    end
    
end 
