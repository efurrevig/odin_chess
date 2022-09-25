require_relative 'pieces.rb'

class Queen < Piece

    def initialize(color,pos)
        super
        @type = 'Queen'
    end
    
end