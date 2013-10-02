#Lab2 - Written by Malcolm Duren

class Lab_Part_two

  class WrongNumberOfPlayersError < StandardError ; end
  class NoSuchStrategyError < StandardError ; end

  def initialize()
    
  end

 #Part 3a - Rock, Paper, Scissors - 2 Opponents----------------------
  def rps_game_winner(game)
    raise WrongNumberOfPlayersError unless game.length == 2
    @P1 = game[0][1]
    @P2 = game[1][1]

 
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

#Part 3b - Rock, Paper, Scissors - Tournaments---------------------
  def rps_tournament_winner(game)
   
    if(game[0][0].is_a?(String))
      return rps_game_winner(game)
    else    
      rps_game_winner([rps_tournament_winner(game[0]),rps_tournament_winner(game[1])])
    end

  end

#Part 4 - Anagrams-----------------------------------------------
  def combine_anagrams(words)
   h =  words.group_by { |word| word.downcase.chars.sort.join }
   return h.values
  end
  

end
#-----------------------------------------------------------------

T = Lab_Part_two.new()

puts()
puts("Part 3a - Rock, Paper, Scissors - 2 Opponents")
print(T.rps_game_winner([["Allen", "S"], ["Richard X.", "P"]])) ; puts()

teams = [
    [
        [ ["Armando", "P"], ["Dave", "S"] ],
        [ ["Richard", "R"],  ["Michael", "S"] ],
    ],
    [
        [ ["Allen", "S"], ["Omer", "P"] ],
        [ ["David E.", "R"], ["Richard X.", "P"] ]
    ]
        ]
puts()
puts("#Part 3b - Rock, Paper, Scissors - Tournaments")
print(T.rps_tournament_winner(teams)) ; puts()

puts()
puts("#Part 4a - Anagrams")
print(T.combine_anagrams(['cars', 'for', 'potatoes', 'racs', 'four', 'scar', 'creams', 'scream'])) ; puts()
 

     
