class LemonTree
 attr_accessor :alive, :age, :fruits, :height, :death_bar, :chances_of_death 

  def initialize
    @alive = true
    @age = 0
    @fruits = 0
    @height = 0   
    @death_bar = 0
  end

  def randomly_dies
    pick = rand(0..50)

    if (49..50).include?(pick)
      @alive = false
      puts "A Pirates Crew came and cut your lemon tree. It dies !"
    elsif pick.even? && (49..50).include?(rand(0..50))
      @alive = false
      puts "A Papillard Crew came and cut your lemon tree with a cutter. It dies !"
    elsif (46..49).include?(pick)
      @alive = false
      puts "Too much worms and you die."
    end

  end
    
  def measure_height
    puts "#{@height.round(1)} m"
  end
  
  def count_the_lemons
    if @alive == false
      puts "I wonder how, I wonder why ? A dead tree has no lemons."
    else
      puts "#{@fruits} lemons"
    end
  end
  
  def pick_a_lemon
    if @alive == true
      @fruits -= 1
      puts "You pick a delicious lemon. Yummy !"
    else
      puts "The tree's dead - you try to eat the remaining leaves and die of poisoning."
    end
  end
  
  def one_year_passes
    
    if @alive == false
      puts "A year later, the tree is still dead ..."
    else
      @age += 1  
      @height += 0.4

      if @age > 2
        @fruits = 10* @age
      else
        @fruits = 0 
      end
      
      @death_bar += rand(1..5) * 1.01
    
      if @death_bar > 30
        @alive = false
        puts "The tree's dead - you try to eat the remaining leaves and die of poisoning."
      end

      puts "This year, your tree is #{@age} years old. Amazing !"
      puts "It grew to #{@height.round(1)} m tall and produced #{@fruits} lemons."
    end

    randomly_dies if @alive == true

  end

end

orange_tree = LemonTree.new

20.times { orange_tree.one_year_passes }

# puts "Howdy !"

# puts(orange_tree.one_year_passes)
# # => This year your tree grew to 9.6 m tall, and produced 119 oranges

# puts(orange_tree.count_the_lemons)
# # => 119 oranges

# 7.times { orange_tree.one_year_passes }

# puts(orange_tree.pick_a_lemon)
# # => You pick a delicious juicy orange

# puts(orange_tree.count_the_lemons)
# # => 118 oranges

# puts(orange_tree.measure_height)
# # => 9.6 m

# 7.times { orange_tree.one_year_passes }

# puts(orange_tree.one_year_passes)
# # => This year your tree grew to 10.0 m tall, and produced 125 oranges

# puts(orange_tree.one_year_passes)
# # => This year your tree grew to 10.4 m tall, and produced 131 oranges

# 7.times { orange_tree.one_year_passes }

# puts(orange_tree.one_year_passes)
# # => Oh, no! The tree is too old, and has died..

# 7.times { orange_tree.one_year_passes }

# puts(orange_tree.one_year_passes)
# # => A year later, the tree is still dead..

# puts(orange_tree.count_the_lemons)
# # => A dead tree has no oranges..

# 7.times { orange_tree.one_year_passes }


# puts(orange_tree.pick_a_lemon)
# # => A dead tree has nothing to offer..