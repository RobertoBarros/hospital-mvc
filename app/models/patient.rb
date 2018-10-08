class Patient

  attr_accessor :name
  attr_reader :name, :age

  def initialize(attributes = {})
    @name = attributes[:name]
    @age = attributes[:age]
  end

end