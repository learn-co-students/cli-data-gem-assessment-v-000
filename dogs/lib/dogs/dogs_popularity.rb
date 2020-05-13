class Dogs::DogsPopularity
	attr_accessor :name, :popularity, :temper

	@@all = []

	def initialize(name, popularity, temper)
		@name = name
		@popularity = popularity
    @temper = temper
		@@all << self
	end

	def self.all
		@@all
	end

end
