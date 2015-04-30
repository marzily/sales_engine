require_relative 'repository'
require_relative 'merchant'

class MerchantRepository < Repository
  def model_class
    Merchant
  end

  def find_by_name(name)
    collection.find { |merchant| merchant.name == name}
  end
end