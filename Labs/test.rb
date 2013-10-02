

class Testing
 
  def initialize()
    
  end

  #Part 3a - Rock, Paper, Scissors - 2 Opponents----------------------
  def rps_game_winner(game)
    raise WrongNumberOfPlayersError unless game.length == 2
    @P1 = game[0][1]
    @P2 = game[1][1]
    #puts(@P1)
    #puts(@P2)
 
    if(@P1.match(/[RPS]/)) && (@P2.match(/[RPS]/))

      if(@P1 == "R") && (@P2 == "S")
        return game[0]
      elsif(@P1 == "R") && (@P2 == "P")
	return game[1]
      end
	
     if(@P1 == "P") && (@P2 == "R")
        return game[0]
     elsif(@P1 == "P") && (@P2 == "S")
	return game[1]
     end
       
     
     if(@P1 == "S") && (@P2 == "P")
	return game[0]
     elsif(@P1 == "S") && (@P2 == "R")
	return game[1]
     end
    end

  end
  

end

T = Testing.new()
print(T.rps_game_winner([["Allen", "S"], ["Richard X.", "P"]]))




