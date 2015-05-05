require_relative 'model_object'

class Customer < ModelObject

  attr_reader :first_name, :last_name

  def initialize(data, repository)
    super
    @first_name = data[:first_name]
    @last_name  = data[:last_name]
  end

  def invoices
    repository.engine.invoice_repository.find_all_by_customer_id(id)
  end

  def transactions
    invoices.flat_map { |invoice| invoice.transactions }
  end

end
