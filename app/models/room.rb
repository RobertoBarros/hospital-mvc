class Room

  attr_reader :number, :capacity
  def initialize(attributes = {})
    @number = attributes[:number]
    @capacity = attributes[:capacity] || 0
  end


end