require_relative 'repository'
require_relative 'invoice'

class InvoiceRepository < Repository
  attr_reader :model_class

  def initialize(data, engine)
    @model_class = Invoice
    super
  end

  def find_by_customer_id(customer_id)
    find_all_by_customer_id(customer_id).first
  end

  def find_by_merchant_id(merchant_id)
    find_all_by_merchant_id(merchant_id).first
  end

  def find_by_status(status)
    find_all_by_status(status).first
  end

  def find_all_by_customer_id(customer_id)
    collection.select { |invoice| invoice.customer_id == customer_id }
  end

  def find_all_by_merchant_id(merchant_id)
    collection.select { |invoice| invoice.merchant_id == merchant_id }
  end

  def find_all_by_status(status)
    collection.select { |invoice| invoice.status == status }
  end

end
