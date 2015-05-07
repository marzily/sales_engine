require 'bigdecimal'
require_relative 'repository'
require_relative 'invoice_item'

class InvoiceItemRepository < Repository
  attr_reader :model_class

  def initialize(data, engine)
    @model_class = InvoiceItem
    super
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
    price = BigDecimal.new(unit_price) / 100
    collection.select { |invoice_item| invoice_item.unit_price == price }
  end

  def find_by_unit_price(unit_price)
    find_all_by_unit_price(unit_price).first
  end

  def create_invoice_item(invoice_info, id)
    grouped = invoice_info.inject(Hash.new(0)) { |hash, x| hash[x] += 1 ; hash }
    items   = invoice_info.uniq
    items.each do |item|

      data = {
        :id         => collection.last.id,
        :item_id    => item.id,
        :invoice_id => id,
        :quantity   => grouped[item],
        :unit_price => item.unit_price,
        :created_at => Time.now.to_s,
        :updated_at => Time.now.to_s
              }
      ii = InvoiceItem.new(data, self)
      collection << ii
    end
  end
end
