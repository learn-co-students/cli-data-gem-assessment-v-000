class Dog
attr_accessor :gender, :breed, :age, :color, :size, :housebroken, :obedience, :location, :kids, :cats, :otherdogs, :sponsors, :sponsor_blurb, :sponsor_name, :sponsor_date, :description, :id, :imageurl
@@all = []
def initialize(dog_hash) #from Mass Assignment & Metaprogramming Lab
    dog_hash.each do |key, value|
      self.send(("#{key}="), value)
      @@all << self
    end
end


end
