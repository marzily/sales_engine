require_relative 'customer_repository'
# require_relative 'invoice_repository'
# require_relative 'merchant_repository'
# require_relative 'item_repository'
# require_relative 'invoice_item_repository'
# require_relative 'transaction_repository'

class SalesEngine
  attr_reader :file_directory,
              :customer_repository
            # , :invoice_repository,
              # :merchant_repository,
              # :item_repository,
              # :invoice_item_repository,
              # :transaction_repository

  def initialize(file_directory = nil)
    @file_directory = file_directory
  end

  def startup
    @customer_repository = CustomerRepository.new("#{file_directory}customers.csv", self)
    # @invoice_repository = InvoiceRepository.new("#{file_directory}invoices.csv", self)
    # @item_repository = ItemRepository.new("#{file_directory}items.csv", self)
    # @invoice_item_repository = InvoiceItemRepository.new("#{file_directory}invoice_items.csv", self)
    # @merchant_repository = MerchantRepository.new("#{file_directory}merchants.csv", self)
    # @transaction_repository = TransactionRepository.new("#{file_directory}transactions.csv", self)
  end
end


if __FILE__ == $PROGRAM_NAME
  engine = SalesEngine.new('./test/fixtures/')
  engine.startup
  engine.customer_repository
end
