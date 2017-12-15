class Herbs

  attr_accessor :name, :path, :medicinal_uses, :properties, :preparation
  @@all = []

  def initialize
    @@all << self
  end

  def self.create_herbs_from_hash(herbs_and_path_hash)
    herbs_and_path_hash.each do |herb, h_path|
      new_herb = Herbs.new
      new_herb.name = herb
      new_herb.path = h_path
    end
  end

  def add_herb_attributes(herb_attributes_hash)
    herb_attributes_hash.each do |key, value|
      self.send(("#{key}="), value)
    end
    self
  end

  def self.search_by_medicinal_use(condition)
    self.all.select { |herb| herb.medicinal_uses && herb.medicinal_uses.downcase.include?(condition.downcase)}
  end

  def self.search_by_properties(property)
    self.all.select { |herb| herb.properties && herb.properties.downcase.include?(property.downcase)}
  end

  def self.all
    @@all
  end

end
