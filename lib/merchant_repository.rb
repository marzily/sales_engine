require_relative 'repository'
require_relative 'merchant'

class MerchantRepository < Repository
  attr_reader :model_class

  def initialize(data, engine)
    @model_class = Merchant
    super
  end

  def find_by_name(name)
    collection.find { |merchant| merchant.name == name}
  end
end
