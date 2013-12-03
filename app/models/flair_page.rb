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
end
