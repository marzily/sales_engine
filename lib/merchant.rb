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
    merchant_transactions = transactions_by_date(date)
    merchant_transactions = successful_transactions(merchant_transactions)
    successful_merchant_invoices = successful_invoices(merchant_transactions)
    successful_merchant_invoice_items =
        successful_invoice_items(successful_merchant_invoices)

    total_revenue(successful_merchant_invoice_items)
  end

  def favorite_customer
    merchant_transactions = invoices.flat_map { |invoice| invoice.transactions }
    all_successful_transactions = successful_transactions(merchant_transactions)

    customers = all_successful_transactions.map do |transaction|
      transaction.invoice.customer
    end

    customers.max_by {|customer| customers.count(customer) }
  end

  def customers_with_pending_invoices
    transactions = transactions_by_date(nil)

    pending_invoices = invoices - successful_invoices(successful_transactions(transactions))
    pending_invoices.map { |invoice| invoice.customer }
  end

  private

  def transactions_by_date(date)
    if date.nil?
      invoices.flat_map { |invoice| invoice.transactions }
    else
      invoices_by_date = invoices.select { |invoice| invoice.created_at == date }
      invoices_by_date.flat_map { |invoice| invoice.transactions }
    end
  end

  def successful_transactions(transactions)
    transactions.select { |transaction| transaction.result == "success" }
  end

  def successful_invoices(successful_transactions)
    successful_transactions.map { |transaction| transaction.invoice }
  end

  def successful_invoice_items(successful_invoices)
    successful_invoices.flat_map { |invoice| invoice.invoice_items }
  end

  def total_revenue(successful_invoice_items)
    successful_invoice_items.inject(0) do |sum, invoice_item|
      sum + (invoice_item.quantity * invoice_item.unit_price)
    end
  end

end
