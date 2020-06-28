require "pry"

class Owner

    attr_reader :name, :species

    @@all = []


  def initialize (name)
    @name = name
    @species = "human"
    self.class.all << self
  end

  def say_species
    p "I am a #{self.species}."
  end

  def self.all
    @@all
  end

  def self.count
    self.all.count
  end

  def self.reset_all
    self.all.clear
  end


  def cats
    Cat.all.select{|i| i if i.owner == self}
  end

  def dogs
    Dog.all.select{|i| i if i.owner == self}
  end

  def buy_cat(name)
    i = Cat.new(name,self)
    cats.count
  end

  def buy_dog(name)
    i = Dog.new(name,self)
    dogs.count
  end

  def walk_dogs
    dogs.map {|i| i.mood = "happy"}
  end

  def feed_cats
    cats.map {|i| i.mood = "happy"}
  end

  def all_my_pets
    my_pets = []
    my_pets << cats
    my_pets << dogs
    my_pets.flatten
  end

  def sell_pets
    all_my_pets.map do |i|
      i.mood = "nervous"
      i.owner = nil
    end
  end

  def list_pets
    p "I have #{dogs.count} dog(s), and #{cats.count} cat(s)."
  end

end

# count = 0
# Cat.all.select do|i|
#   if i.name == name
#     i.owner = self
#     count += 1
#   end
# end
# count
