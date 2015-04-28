class Customer
  attr_reader :data

  def initialize(data)
    @data = data
  end

  def id
    data[:id]
  end

  def first_name
    data[:first_name]
  end

  def last_name
    data[:last_name]
  end

end
