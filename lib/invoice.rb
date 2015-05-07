require_relative 'model_object'
require_relative 'transaction'

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
    invoice_items.map { |invoice_item| invoice_item.item }.compact
  end

  def customer
    repository.engine.customer_repository.find_by_id(customer_id)
  end

  def merchant
    repository.engine.merchant_repository.find_by_id(merchant_id)
  end

  def successful_transactions
    transactions.select { |transaction| transaction.result == 'success' }
  end

  def success?
    transactions.any? { |transaction| transaction.result == 'success' }
  end

  def charge(card_info = {})
    card_info[:id] = repository.engine.transaction_repository.all.last.id + 1
    card_info[:invoice_id] = self.id
    card_info[:created_at] = Time.now.to_s
    card_info[:updated_at] = Time.now.to_s
    transaction_repo = repository.engine.transaction_repository.collection
    transaction_repo << Transaction.new(card_info, repository.engine.transaction_repository)
  end

end
