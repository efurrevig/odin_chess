require_relative 'pieces.rb'

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
            if @pos1 == @pos
                valid = [2,0], [1,0], [1,1], [1,-1]
            else
                valid = [1,0], [1,1], [1,-1]
            end
            valid.each do |i|
                if [@pos[0] + i[0], @pos[1] + i[1]] == move
                    return true
                end
            end
        end
        if @color == 'white'
            #false if move puts piece on another white piece
            return false if (arr[move[0]][move[1]].is_a? Piece) && arr[move[0]][move[1]].color == 'white'
            if @pos1 == @pos
                valid = [-2,0], [-1,0], [-1,1], [-1,-1]
            else
                valid = [-1,0], [-1,1], [-1,-1]
            end
            valid.each do |i|
                if [@pos[0] + i[0], @pos[1] + i[1]] == move
                    return true
                end
            end
        end
        return false
    end

end