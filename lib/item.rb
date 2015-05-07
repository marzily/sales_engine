require 'bigdecimal'
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
    @unit_price  = BigDecimal.new(data[:unit_price].to_i) / 100
    @merchant_id = data[:merchant_id].to_i
  end

  def invoice_items
    repository.engine.invoice_item_repository.find_all_by_item_id(id)
  end

  def merchant
    repository.engine.merchant_repository.find_by_id(merchant_id)
  end

  def successful_invoice_items
    invoice_items.select(&:success?)
  end

  def revenue
    successful_invoice_items.inject(0) do |sum, inv_item|
      sum + (inv_item.quantity * inv_item.unit_price)
    end
  end

  def total_sold
    successful_invoice_items.inject(0) do |total, inv_item|
      total + inv_item.quantity
    end
  end

  def best_day
    return if successful_invoice_items.empty?

    inv_items_by_date = successful_invoice_items.group_by do |inv_item|
      inv_item.invoice.created_at
    end

    inv_items_by_date.max_by do |date, inv_items|
      total_quantity(inv_items)
    end.first
  end

  def total_quantity(inv_items)
    inv_items.inject(0) { |sum, inv_item| sum + inv_item.quantity }
  end

end
