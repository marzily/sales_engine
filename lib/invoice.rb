class Invoice
  attr_reader :id, :customer_id, :merchant_id

  def initialize(data, repository)
    @id          = data[:id].to_i
    @customer_id = data[:customer_id].to_i
    @merchant_id = data[:merchant_id].to_i
    @repository  = repository
  end
end