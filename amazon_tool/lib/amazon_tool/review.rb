class AmazonTool::Review

  def initialize(url)
    doc = Nokogiri::HTML(open(url))
    binding.pry
    reviews = doc.search('a-section review-views celwidget')
  end

end