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
    @all_by_item_id ||= hash_repo("item_id")
    @all_by_item_id[item_id]
  end

  def find_by_item_id(item_id)
    find_all_by_item_id(item_id).first
  end

  def find_all_by_invoice_id(invoice_id)
    @all_by_invoice_id ||= hash_repo("invoice_id")
    @all_by_invoice_id[invoice_id]
  end

  def find_by_invoice_id(invoice_id)
    find_all_by_invoice_id(invoice_id).first
  end

  def find_all_by_quantity(quantity)
    @all_by_quantity ||= hash_repo("quantity")
    @all_by_quantity[quantity]
  end

  def find_by_quantity(quantity)
    find_all_by_quantity(quantity).first
  end

  def find_all_by_unit_price(unit_price)
    price = BigDecimal.new(unit_price) / 100
    @all_by_unit_price ||= hash_repo("unit_price")
    @all_by_unit_price[price]
  end

  def find_by_unit_price(unit_price)
    find_all_by_unit_price(unit_price).first
  end

  def create_invoice_item(invoice_info, invoice_id)
    grouped = invoice_info.inject(Hash.new(0)) do |hash, x|
      hash[x] += 1 ; hash
    end

    items = invoice_info.uniq
    items.each do |item|
      data = {
        :id         => collection.last.id + 1,
        :item_id    => item.id,
        :invoice_id => invoice_id,
        :quantity   => grouped[item],
        :unit_price => item.unit_price,
        :created_at => Time.now.to_s,
        :updated_at => Time.now.to_s
              }
      ii = InvoiceItem.new(data, self)
      collection << ii

      unless @all_by_invoice_id.has_key?(invoice_id)
        @all_by_invoice_id[invoice_id] = [ii]
      else
        @all_by_invoice_id[invoice_id] << ii
      end
    end
  end
end
