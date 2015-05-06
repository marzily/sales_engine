require_relative 'model_object'

class InvoiceItem < ModelObject

  attr_reader :item_id, :invoice_id, :quantity, :unit_price

  def initialize(data, repository)
    super
    @item_id    = data[:item_id].to_i
    @invoice_id = data[:invoice_id].to_i
    @quantity   = data[:quantity].to_i
    @unit_price  = BigDecimal.new(data[:unit_price].to_i) / 100
  end

  def invoice
    repository.engine.invoice_repository.find_by_id(invoice_id)
  end

  def item
    repository.engine.item_repository.find_by_id(item_id)
  end

  def success?
    invoice.success?
  end

end
