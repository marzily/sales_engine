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
    collection.select { |merchant| merchant.name.downcase == name.downcase }
  end

#   def most_revenue(n)
#     merchant_revenue = {}
#     collection.each do |merchant|
#       merchant_revenue[merchant] = merchant.revenue
#     end

#     merchant_revenue.max_by(n) { |merchant, revenue| revenue }.map(&:first)

# # alternative solution: #######################
#     # sorted_merchants = collection.sort_by { |merchant| merchant.revenue }.reverse
#     # sorted_merchants.first(n)

#   end

  # def most_items(n)
  #   merchant_items = {}
  #   collection.each do |merchant|
  #     merchant_items[merchant] = merchant.items_sold
  #   end

  #   merchant_items.max_by(n) { |merchant, items_sold| items_sold }.map(&:first)
  # end

  def revenue(date)
    collection.inject(0) { |sum, merchant| sum + merchant.revenue(date) }
  end

end
