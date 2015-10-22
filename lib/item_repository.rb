require_relative 'repository'
require_relative 'item'
require 'bigdecimal'

class ItemRepository < Repository
  attr_reader :model_class

  def initialize(data, engine)
    @model_class = Item
    super
  end

  def find_all_by_name(name)
    @all_by_name ||= hash_repo("name")
    @all_by_name[name]
  end

  def find_by_name(name)
    find_all_by_name(name).first
  end

  def find_all_by_description(description)
    @all_by_description ||= hash_repo("description")
    @all_by_description[description]
  end

  def find_by_description(description)
    find_all_by_description(description).first
  end

  def find_all_by_unit_price(unit_price)
    @all_by_unit_price ||= hash_repo("unit_price")
    @all_by_unit_price[unit_price]
  end

  def find_by_unit_price(unit_price)
    find_all_by_unit_price(unit_price).first
  end

  def find_all_by_merchant_id(merchant_id)
    @all_by_merchant_id ||= hash_repo("merchant_id")
    @all_by_merchant_id[merchant_id]
  end

  def find_by_merchant_id(merchant_id)
    find_all_by_merchant_id(merchant_id).first
  end

  def most_revenue(n)
    collection.max_by(n) { |item| item.revenue }
  end

  def most_items(n)
    collection.max_by(n) { |item| item.total_sold }
  end

end
