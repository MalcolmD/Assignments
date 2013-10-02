
#Lab2 - Written by Malcolm Duren
#--------------------------------------------------------------------
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
 

     



#---------------------------Assignment_2-------------------------------

#Part 1a - Classes------------------------------------
class Dessert
  @name
  @calories
    
  def initialize(name, calories)
	@name = name
	@calories = calories
  end

  def get_name 
    @name
  end

  def get_calories 
    @calories
  end

  def set_calories(calories)
	@calories = calories
  end

  def set_name(n)
	@name = n
  end

  def healthy?
    if(@calories < 200)
      return true
    else
      return false
    end
  end

  def delicious?
     return true
  end
end

M = Dessert.new("Apple Pie", 400)
#puts(M.healthy?)
#puts(M.delicious?)
#puts(M.get_name)
#puts(M.get_calories)

#Part 1b - Jellybean Class---------------------------
class Jellybean < Dessert 

  @flavor

  def initialize(flavor, calories)
    @name = "Jellybean"
    @flavor = flavor
    @calories = calories
  end

  def delicious?
    if(@flavor == "black licorice")
      return false
    else
      return true
    end

  end
end

P = Jellybean.new("black licorice", 50)
#puts(P.get_name)
#puts(P.get_calories)
#puts(P.delicious?)
#puts(P.healthy?)

#Part 2a - OOP--------------------------------------

class Class
    def attr_accessor_with_history(attr_name)
      	 attr_name = attr_name.to_s          #make sure its a string
      	 attr_reader attr_name               #create the attribute's getter
      	 attr_reader attr_name+"_history"    #create bar_history getter
       	 class_eval %Q{
	  	   def #{attr_name}=(attr_name)
		 	@attr_name = attr_name
      			if @#{attr_name}_history then
		 	  @#{attr_name}_history << attr_name
	 		else
		 	  @#{attr_name}_history = Array.new
		 	  @#{attr_name}_history << nil
		 	  @#{attr_name}_history << attr_name
	 	 	end
   	  	   end
                  }
	end

end


class Foo
       attr_accessor_with_history :bar	
end


f = Foo.new
f.bar = 1
f.bar = 2
f.bar = 5
f.bar = 6
f.bar = 5
f.bar = 8
#print(f.bar_history) 
#puts(f.bar)

#Part 3a - OOP---------------------------
class Numeric
 	
      @@currencies = {'yen' => 0.013, 'euro' => 1.292, 'rupee' => 0.019, 'dollar' => 1.0}

      def method_missing(method_id)
	 singular_currency = method_id.to_s.gsub(/s$/, '')
	 if @@currencies.has_key?(singular_currency)
	    self / @@currencies[singular_currency]
	 else
	   super
	 end
      end


      def dollar
	return self 
      end

      def rupee
	return self * @@currencies["rupee"]
      end


      def euro
        return self * @@currencies["euro"]
      end

      def yen
	return self * @@currencies["yen"]
      end
      
      def in(currency)
	method_missing(currency)
      end


end

#puts(100.euro.in(:dollar))
#puts(10.rupees.in(:euro))


#Part 3b - String Palindromes---------------------------
class String
 def palindrome?()
    l = self.downcase.gsub(/[^a-z]/, "")
    r = l.reverse   
   if(l == r)
     puts "true"
   else
     puts "false"
   end  
 end
end

puts("Mom".palindrome?())


#Part 3c - Enumerables Palindromes-----------------------
module Enumerable
 def palindrome?()
    l = self
    r = []
    l.reverse_each {|n| r << n }
   if(l == r)
     puts "true"
   else
     puts "false"
   end  
 end
end

#puts([3, 3, 1, 1].palindrome?())


#Part 4 - Blocks-----------------------------------------
class CartesianProduct
  include Enumerable
  @collection_1
  @collection_2
  
  def initialize(collection_1, collection_2)
    @collection_1 = collection_1
    @collection_2 = collection_2
  end

  def each
    @collection_1.each do |n|
     @collection_2.each do |m|
      yield([n, m])
     end
    end  
  end  

end

#c = CartesianProduct.new([1, 2], [:a, :b])
#c.each { |elt| puts elt.inspect}
