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

  def best_day
    trans = merchant.transactions_by_date(nil)
    successful_trans = merchant.successful_transactions(trans)
    successful_inv = merchant.successful_invoices(successful_trans)
    successful_inv_items = merchant.successful_invoice_items(successful_inv)

    quantity_by_date = Hash.new { |hash, key| hash[key] = 0 }
    successful_inv_items.each do |inv_item|
      quantity_by_date[inv_item] += inv_item.quantity
    end

    quantity_by_date.max_by { |date, quantity| quantity }.first.created_at

    # dates = invoice_items.map { |invoice_item| invoice_item.invoice.created_at }
    # dates.
  end

end
