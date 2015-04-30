require_relative 'model_object'

class Invoice < ModelObject
  attr_reader :customer_id, :merchant_id
  attr_accessor :status

  def initialize(data, invoice_repo)
    super
    @customer_id = data[:customer_id].to_i
    @merchant_id = data[:merchant_id].to_i
    @status      = data[:status]
  end
end
