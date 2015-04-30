require_relative 'parser'
require_relative 'customer_repository'
# require_relative 'item_repository'
# require_relative 'invoice_repository'
# require_relative 'invoice_item_repository'
# require_relative 'merchant_repository'
# require_relative 'transaction_repository'

class SalesEngine
  include Parser

  attr_reader :file_directory,
              :customer_repository,
            # :invoice_repository,
              # :invoice_item_repository
            # ,
              # :item_repository,
              # :merchant_repository,
              # :transaction_repository

  def initialize(file_directory = nil)
    @file_directory = file_directory
  end

  def data
    @data ||= { customers:    parse("#{file_directory}customers.csv"),
              #   items:        parse("#{file_directory}items.csv"),
              #   invoices:     parse("#{file_directory}invoices.csv"),
              #   invoice_items: parse("#{file_directory}invoice_items.csv")
              #   merchants:    parse("#{file_directory}merchants.csv"),
              #   transactions: parse("#{file_directory}transactions.csv"),
               }
  end

  def startup
    @customer_repository = CustomerRepository.new(data[:customers], self)
  #   @item_repository = ItemRepository.new(data[:items], self)
  #   @invoice_repository = InvoiceRepository.new(data[:invoices], self)
  #   @invoice_item_repository = InvoiceItemRepository.new(data[:invoice_items], self)
  #   @merchant_repository = MerchantRepository.new(data[:merchants], self)
  #   @transaction_repository = TransactionRepository.new(data[:transactions], self)
  end
end

if __FILE__ == $PROGRAM_NAME
  engine = SalesEngine.new('./test/fixtures/')
  engine.startup
  engine.customer_repository
end
