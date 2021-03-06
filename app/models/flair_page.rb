class FlairPage
  attr_accessor :code, :content

  def initialize(attributes={})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end

  def root
    Nokogiri::HTML(content)
  end

  def flairs
    root.search(".flair").map do |icon|
      description = icon.parent.parent.search("td:nth(2)").text
      icon.attributes["style"].value =~ /background-position: (-?\d+)px (-?\d+)px/
      position = [$1.to_i, $2.to_i]
      Flair.new(description: description, position: position)
    end
  end

  def name
    root.search("h3").first.try(:text)
  end

  def display_name
    title = root.search('title').first
    return nil unless title
    return nil unless title.text =~ /\ATagPro Ball: (.*)\z/
    $1
  end
end
