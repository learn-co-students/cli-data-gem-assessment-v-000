class Dog
attr_accessor :name, :gender, :breed, :age, :color, :size, :housebroken, :obedience, :location, :kids, :cats, :otherdogs, :sponsors, :sponsor_blurb, :sponsor_name, :sponsor_date, :description, :id, :image_url, :selectors
@@all = []
@@selected = [] #decided to keep over here rather than duplicate instance variables over inside search class

    def initialize(dog_hash) #from Mass Assignment & Metaprogramming Lab
        dog_hash.each do |key, value|
            self.send(("#{key}="), value)
        end
    end

    def self.selected
      @@selected
    end

    def self.all
      @@all
    end

    def self.reset_all
      @@all.clear
      @@selected.clear
    end

    def self.reset_search
      @@selected.clear
    end

    def self.magsr_fixer(input_array)
      input_array.each do |dog|
          dog.each do |key, value|
              if key == :gender || key == :breed || key == :color || key == :size || key==:housebroken || key == :obedience || key == :kids || key == :cats || key == :otherdogs
                dog[key] = extract_value(value)
              elsif key == :id
                dog[key] = extract_value(value)
                dog[key] = dog[key].chomp(" \n")
              end
          end
      end
      input_array
    end

    def self.extract_value(value)
        output = value.split(": ")
        output[1]
    end

    def self.save_output
      File.write('output.txt', @@all)
    end

    def self.create_from_webpage(url)
        dog_array = Retriever.dog_scrape(url)
        dog_array = magsr_fixer(dog_array)
        dog_array.each do |dog_hash|
            temp = Dog.new(dog_hash)
            @@all << temp
        end
    #binding.pry
    #File.write('output.txt', @@all)
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
