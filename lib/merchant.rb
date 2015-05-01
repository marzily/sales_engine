require_relative 'model_object'

class Merchant < ModelObject

  attr_reader :name

  def initialize(data, merchant_repo)
    super
    @name = data[:name]
  end
  
end
