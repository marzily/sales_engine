require_relative 'repository'
require_relative 'merchant'

class MerchantRepository < Repository
  attr_reader :model_class

  def initialize(data, engine)
    @model_class = Merchant
    super
  end

  def find_by_name(name)
    find_all_by_name(name).first
  end

  def find_all_by_name(name)
    collection.select {|merchant| merchant.name.downcase == name.downcase}
  end

end
