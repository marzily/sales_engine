require_relative 'instance_object'

class InvoiceItem < InstanceObject

  attr_reader :item_id, :invoice_id
  attr_accessor :quantity, :unit_price

  def initialize(data, repository)
    super
    @item_id    = data[:item_id].to_i
    @invoice_id = data[:invoice_id].to_i
    @quantity   = data[:quantity].to_i
    @unit_price = data[:unit_price].to_i
  end

end
