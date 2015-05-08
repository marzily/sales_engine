require_relative 'repository'
require_relative 'merchant'

class MerchantRepository < Repository
  attr_reader :model_class

  def initialize(data, engine)
    @model_class = Merchant
    super
  end

  def find_all_by_name(name)
    @all_by_name ||= hash_repo("name")
    @all_by_name[name]
  end

  def find_by_name(name)
    find_all_by_name(name).first
  end

  def most_revenue(n)
    collection.max_by(n) { |merchant| merchant.revenue }
  end

  def most_items(n)
    collection.max_by(n) { |merchant| merchant.items_sold }
  end

  def revenue(date)
    collection.inject(0) do |sum, merchant|
      sum + merchant.revenue(date)
    end
  end

end
