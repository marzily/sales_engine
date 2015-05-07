require_relative 'repository'
require_relative 'item'
require "bigdecimal"

class ItemRepository < Repository
  attr_reader :model_class

  def initialize(data, engine)
    @model_class = Item
    super
  end

  def find_all_by_name(name)
    collection.select { |object| object.name.downcase == name.downcase }
  end

  def find_by_name(name)
    find_all_by_name(name).first
  end

  def find_all_by_description(description)
    collection.select { |object| object.description == description }
  end

  def find_by_description(description)
    find_all_by_description(description).first
  end

  def find_all_by_unit_price(unit_price)
    collection.select { |invoice_item| invoice_item.unit_price == unit_price }
  end

  def find_by_unit_price(unit_price)
    find_all_by_unit_price(unit_price).first
  end

  def find_all_by_merchant_id(merchant_id)
    collection.select { |invoice_item| invoice_item.merchant_id == merchant_id }
  end

  def find_by_merchant_id(merchant_id)
    find_all_by_merchant_id(merchant_id).first
  end

  # def most_revenue(n)
  #   items_with_revenue = collection.map { |item| [item, item.revenue] }
  #   items_with_revenue.max_by(n) { |item, revenue| revenue }.map(&:first)
  # end

  # def most_items(n)
  #   items_with_revenue = collection.map { |item| [item, item.total_sold] }
  #   items_with_revenue.max_by(n) { |item, total_sold| total_sold }.map(&:first)
  # end

end
