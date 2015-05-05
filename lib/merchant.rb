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

  private

  def transactions(date)
    if date.nil?
      transactions = invoices.flat_map { |invoice| invoice.transactions }
    else
      invoices_by_date = invoices.select { |invoice| invoice.created_at == date }
      transactions = invoices_by_date.flat_map { |invoice| invoice.transactions }
    end
  end

  def successful_transactions(date)
    transactions(date).select { |transaction| transaction.result == "success" }
  end

  def successful_invoices(date)
    successful_transactions(date).map { |transaction| transaction.invoice }
  end

  def successful_invoice_items(date)
    successful_invoices(date).flat_map { |invoice| invoice.invoice_items }
  end

end
