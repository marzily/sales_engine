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

    invoice_ids = invoice_ids(date)

    transactions = invoice_ids.flat_map do |invoice_id|
      repository.engine.transaction_repository.find_all_by_invoice_id(invoice_id)
    end

    successful_transactions = transactions.select do |transaction|
      transaction.result == "success"
    end

    successful_invoice_ids = successful_transactions.map do |transaction|
      transaction.invoice_id
    end

    invoice_items = successful_invoice_ids.flat_map do |invoice_id|
      repository.engine.invoice_item_repository.find_all_by_invoice_id(invoice_id)
    end

    invoice_items.map do |invoice_item|
      invoice_item.quantity * invoice_item.unit_price
    end.inject(:+)

  end

  def invoice_ids(date)
    unless date.nil?
      invoices.map do |invoice|
        invoice.id if invoice.created_at == date
      end
    else
      invoice_ids = invoices.map { |invoice| invoice.id }.uniq
    end
  end

end
