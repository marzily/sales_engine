require_relative 'model_object'

class InvoiceItem < ModelObject

  attr_reader :item_id, :invoice_id, :quantity, :unit_price

  def initialize(data, repository)
    super
    @item_id    = data[:item_id].to_i
    @invoice_id = data[:invoice_id].to_i
    @quantity   = data[:quantity].to_i
    @unit_price = data[:unit_price].to_i
  end

end
