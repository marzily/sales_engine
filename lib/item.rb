require_relative 'model_object'

class Item < ModelObject
  attr_reader :name, 
              :description, 
              :unit_price, 
              :merchant_id

  def initialize(data, item_repo)
    super
    @name        = data[:name]
    @description = data[:description]
    @unit_price  = data[:unit_price].to_i
    @merchant_id = data[:merchant_id].to_i
  end
end
