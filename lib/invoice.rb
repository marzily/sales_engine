require_relative 'model_object'

class Invoice < ModelObject

  attr_reader :customer_id, :merchant_id, :status

  def initialize(data, invoice_repo)
    super
    @customer_id = data[:customer_id].to_i
    @merchant_id = data[:merchant_id].to_i
    @status      = data[:status]
  end

  def transactions
    repository.engine.transaction_repository.find_all_by_invoice_id(id)
  end

  def invoice_items
    repository.engine.invoice_item_repository.find_all_by_invoice_id(id)
  end

  def items
    invoice_items.map do |invoice_item|
      invoice_item.repository.engine.item_repository.find_all_by_id(invoice_item.item_id)
    end
  end

  def customer
    repository.engine.customer_repository.find_by_id(customer_id)
  end

  def merchant
    repository.engine.merchant_repository.find_by_id(merchant_id)
  end

end
