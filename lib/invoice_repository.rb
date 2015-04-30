require_relative 'repository'
require_relative 'invoice'

class InvoiceRepository < Repository
  def model_class
    Invoice
  end

  def find_by_customer_id(customer_id)
    collection.find{ |invoice| invoice.customer_id == customer_id}
  end

  def find_by_merchant_id(merchant_id)
    collection.find { |invoice| invoice.merchant_id == merchant_id }
  end
end
