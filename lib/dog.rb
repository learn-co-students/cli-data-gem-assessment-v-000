class Dog
attr_accessor :name, :gender, :breed, :age, :color, :size, :housebroken, :obedience, :location, :kids, :cats, :otherdogs, :sponsors, :sponsor_blurb, :sponsor_name, :sponsor_date, :description, :id, :image_url
@@all = []
    def initialize(dog_hash) #from Mass Assignment & Metaprogramming Lab
        dog_hash.each do |key, value|
            self.send(("#{key}="), value)

        end
    end

    def self.create_from_webpage(url)
        dog_array = Retriever.dog_scrape(url)
        dog_array.each do |dog_hash|
            temp = Dog.new(dog_hash)
            @@all << temp
        end
    binding.pry
    File.write('output.txt', @@all)
    end
    def self.all
      @@all
    end
    def self.save
        self.class.all << self
    end

    def self.create(name)
        self.new(name).tap do |name|
          name.save
      end
    end


end
