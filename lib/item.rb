require_relative 'model_object'
require 'bigdecimal'

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

  # def best_day
  #   invoice_items.map { |invoice_item| invoice_item.invoice }
  #     .max_by { |invoice| invoice.created_at }
  # end

end
