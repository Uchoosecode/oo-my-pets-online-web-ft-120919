require 'pry'

class Owner

  attr_accessor :pets, :owner, :cat, :dog  
  attr_reader :name, :species
  
  @@all = []
  
  def initialize(name= "Victoria")
    @name = name 
    @species = "human"
    @@all << self
    @pets = {:cats => [], :dogs => []}
  end
  
  def say_species
    p "I am a #{species}."
  end
  
  def self.all
    @@all
  end
  
  def self.count
    @@all.length 
  end
  
  def self.reset_all
    @@all.clear
  end
  
  def cats
    Cat.all.select {|cat| self == cat.owner}
  end
  
  def dogs
    Dog.all.select {|dog| self == dog.owner}
  end
  
  def buy_cat(name)
     Cat.new(name, self)
  end
  
  def buy_dog(name)
    Dog.new(name, self)
  end
  
  def walk_dogs
    self.dogs.each {|dog| dog.mood = "happy"}
  end
    
  def feed_cats 
    self.cats.each {|cat| cat.mood = "happy"}
  end
   
  def sell_pets
    @pets[:dogs] = dogs
    @pets[:cats] = cats 
    
      @pets.map do |species, pets|
        pets.each do |pet| pet.mood = "nervous" 
        pet.owner = nil 
        end
          pets.clear
      end
  end
  
  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end

end

# @cat.all.detect {|@cats| @cats << Cat.new(@name, @owner)} 