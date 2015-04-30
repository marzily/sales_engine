require_relative 'repository'
require_relative 'invoice_item'

class InvoiceItemRepository < Repository

  def model_class
    InvoiceItem
  end

  def find_all_by_item_id(item_id)
    collection.select { |invoice_item| invoice_item.item_id == item_id }
  end

  def find_by_item_id(item_id)
    find_all_by_item_id(item_id).first
  end

  def find_all_by_invoice_id(invoice_id)
    collection.select { |invoice_item| invoice_item.invoice_id == invoice_id }
  end

  def find_by_invoice_id(invoice_id)
    find_all_by_invoice_id(invoice_id).first
  end

  def find_all_by_quantity(quantity)
    collection.select { |invoice_item| invoice_item.quantity == quantity }
  end

  def find_by_quantity(quantity)
    find_all_by_quantity(quantity).first
  end

  def find_all_by_unit_price(unit_price)
    collection.select { |invoice_item| invoice_item.unit_price == unit_price }
  end

  def find_by_unit_price(unit_price)
    find_all_by_unit_price(unit_price).first
  end

end
