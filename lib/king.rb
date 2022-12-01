require_relative 'pieces.rb'

class King < Piece

    def initialize(color,pos)
        super
        @type = 'King'
        @check = false
        @checkmate = false
    end
    
    def valid?(move)

    end


end 
