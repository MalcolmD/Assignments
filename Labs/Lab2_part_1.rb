#Lab2 - Written by Malcolm Duren
# Part 1: Hello World
class HelloWorldClass
  def initialize(name)
    @name = name.capitalize
  end
  def sayHi
    puts "Hello #{@name}!"
  end

#------Part 2-----------------------
# Part 2a: Palindrome
 def palindrome?(s)
    l = s.downcase.gsub(/[^a-z]/, "")
    r = l.reverse   
   if(l == r)
     puts "true"
   else
     puts "false"
   end  
 end

# Part 2b: word count
 def count_words(string)
   l = string.gsub(/[^a-zA-Z]/, " ")
   l = l.downcase.split
   h = Hash.new(0)
   l.each do |name|
    h[name] += 1   
   end
    puts h
  end

 end



puts ("")
puts ("Part 1: Hello World")
hello = HelloWorldClass.new("{Malcolm Duren}")
hello.sayHi
puts ("")
puts ("Part 2a: Palindromes")
puts ("A man, a plan, a canal -- Panama")
hello.palindrome?("A man, a plan, a canal -- Panama")
puts ("Madam, I'm Adam!")
hello.palindrome?("Madam, I'm Adam!")
puts ("Abracadabra")
hello.palindrome?("Abracadabra")
puts ("")
puts ("Part 2b: Word Count")
puts ("A man, a plan, a canal -- Panama")
hello.count_words("A man, a plan, a canal -- Panama")
puts ("Doo bee doo bee doo")
hello.count_words("Doo bee doo bee doo")







