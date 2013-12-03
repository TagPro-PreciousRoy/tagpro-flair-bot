class Flair
  attr_accessor :description, :position

  def initialize(attributes={})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end

  def position_for_css
    position.map { |c| "#{c}px" }.join(' ')
  end

  def flair_class
    case position
    when [-16, -16]
      'Donator'
    when [-16, 0]
      'Weekly'
    when [0, -16]
      'Contributor'
    when [0, 0]
      'Daily'
    when [-32, -16]
      'Developer2'
    when [-32, 0]
      'Monthly'
    else
      'Blank'
    end
  end
end
