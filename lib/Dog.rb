class Dog
attr_accessor :gender, :breed, :age, :color, :size, :housebroken, :obedience, :location, :kids, :cats, :otherdogs, :sponsors, :description, :id, :imageurl
def initialize(dog_hash) #from Mass Assignment & Metaprogramming Lab
    dog_hash.each do |key, value|
      self.send(("#{key}="), value)
    @@all << self
    end
  end

end #DOG
