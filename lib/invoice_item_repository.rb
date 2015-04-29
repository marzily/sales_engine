require_relative 'parser'
require_relative 'invoice_item'

class InvoiceItemRepository
  include Parser

  attr_reader :invoice_items_data, :invoice_items, :engine

  def initialize(invoice_items_csv, engine)
    @invoice_items_data = parse(invoice_items_csv)
    @invoice_items      = generate
    @engine             = engine
  end

  def generate
    invoice_items_data.map do |invoice_item_data|
      InvoiceItem.new(invoice_item_data, self)
    end
  end

  def all
    invoice_items
  end

  def random
    invoice_items.sample
  end

  def find_by_id(id)
    invoice_items.select { |invoice_item| invoice_item.id == id }.first
  end
end
