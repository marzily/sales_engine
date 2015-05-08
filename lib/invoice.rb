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
    invoice_items.map(&:item).compact
  end

  def customer
    repository.engine.customer_repository.find_by_id(customer_id)
  end

  def merchant
    repository.engine.merchant_repository.find_by_id(merchant_id)
  end

  def success?
    transactions.any?(&:success?)
  end

  def charge(card_info = {})
    transaction_repo = repository.engine.transaction_repository

    card_info[:id] = transaction_repo.all.last.id + 1
    card_info[:invoice_id] = self.id
    card_info[:created_at] = Time.now.to_s
    card_info[:updated_at] = Time.now.to_s

    new_trans = Transaction.new(card_info, transaction_repo)
    transaction_repo.collection << new_trans

    unless transaction_repo.all_by_invoice_id.has_key?(id)
      transaction_repo.all_by_invoice_id[id] = [new_trans]
    else
      transaction_repo.all_by_invoice_id[id] << new_trans
    end
  end

end
