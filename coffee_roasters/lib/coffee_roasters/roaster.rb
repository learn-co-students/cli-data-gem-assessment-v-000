class CoffeeRoasters::Roaster

  def self.all
    puts <<~HEREDOC
      1. Blue Bottle
      2. Camber
    HEREDOC
    roaster_1 = self.new
    roaster_1.name = "Blue Bottle"
    roaster_1.bean = "Oakland Lights, a fruity and spicy holiday blend of a wet processed Sumatra and natural Ethiopian"
    roaster_1.description = "In the 15 or so years since Blue Bottle launched in an alley that they described as smelling like a bathroom..."
    roaster_1.url = "https://bluebottlecoffee.com/store/oakland-lights"

    roaster_2 = self.new
    roaster_2.name = "Camber"
    roaster_2.bean = "Honduras Migdoneo Enamorado, grown in the highlands around Lake Yojoa with a slower development time resulting in falvors of cinnamon, mandarin orange, and honey"
    roaster_2.description = "Q Graders are the sommeliers of the coffee world, trained to detect the most imperceptible defects and differences in beans."
    roaster_2.url = "http://cambercoffee.com/#two"

    [roaster_1, roaster_2]
  end

end
