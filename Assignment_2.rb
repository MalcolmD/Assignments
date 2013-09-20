#Assignment_2 - Written by Malcolm Duren

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

#Part 2a - OOP---------------------------

class Class
    def attr_accessor_with_history(attr_name)
      	 attr_name = attr_name.to_s          #make sure its a string
      	 attr_reader attr_name               #create the attribute's getter
      	 attr_reader attr_name+"_history"  #create bar_history getter
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
f.bar = 3
puts(f.bar_history)
