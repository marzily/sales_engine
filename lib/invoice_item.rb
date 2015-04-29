class InvoiceItem
  attr_reader :id, :item_id, :invoice_id, :repository

  def initialize(data, repository)
    @id         = data[:id].to_i
    @item_id    = data[:item_id].to_i
    @invoice_id = data[:invoice_id].to_i
    @repository = repository
  end
end
