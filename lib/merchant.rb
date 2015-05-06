require_relative 'model_object'

class Merchant < ModelObject

  attr_reader :name

  def initialize(data, merchant_repo)
    super
    @name = data[:name]
  end

  def items
    repository.engine.item_repository.find_all_by_merchant_id(id)
  end

  def invoices
    repository.engine.invoice_repository.find_all_by_merchant_id(id)
  end

  def revenue(date = nil)
    successful_invoice_items(date).inject(0) do |sum, invoice_item|
      sum + (invoice_item.quantity * invoice_item.unit_price)
    end
  end

  def favorite_customer
    customers = successful_invoices(nil).map(&:customer)
    customers.max_by {|customer| customers.count(customer) }
  end

  def customers_with_pending_invoices
    invoices.reject(&:success?).map(&:customer)
  end

  def items_sold
    successful_invoice_items(nil).inject(0) do |sum, invoice_item|
      sum + invoice_item.quantity
    end
  end

  def successful_invoices(date)
    if date.nil?
      invoices.select { |invoice| invoice.success? }
    else
      invoices_by_date = invoices.select do |invoice|
        invoice.success? && invoice.created_at == date
      end
    end
  end

  def successful_invoice_items(date)
    successful_invoices(date).flat_map(&:invoice_items)
  end

end
