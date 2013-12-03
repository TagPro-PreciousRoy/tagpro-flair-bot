class Flair
  attr_accessor :description, :position

  def initialize(attributes={})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end
end
