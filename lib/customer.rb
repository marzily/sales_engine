require_relative 'model_object'

class Customer < ModelObject

  attr_reader :first_name, :last_name

  def initialize(data, repository)
    super
    @first_name = data[:first_name]
    @last_name  = data[:last_name]
  end

end
