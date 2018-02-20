class Dogs::DogsPopularity
	attr_accessor :name, :popularity

	@@all = []

	def initialize(name, popularity)
		@name = name
		@popularity = popularity
		@@all << self
	end

	def self.all
		@@all
	end




end
