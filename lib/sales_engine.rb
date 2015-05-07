require_relative 'parser'
require_relative 'customer_repository'
require_relative 'invoice_repository'
require_relative 'invoice_item_repository'
require_relative 'item_repository'
require_relative 'merchant_repository'
require_relative 'transaction_repository'

class SalesEngine
  attr_reader :file_directory,
              :customer_repository,
              :invoice_repository,
              :invoice_item_repository,
              :item_repository,
              :merchant_repository,
              :transaction_repository

  def initialize(file_directory = nil)
    @file_directory = file_directory
  end

  def startup
    @customer_repository =
          CustomerRepository.new(data[:customers], self)

    @invoice_repository =
          InvoiceRepository.new(data[:invoices], self)

    @invoice_item_repository =
          InvoiceItemRepository.new(data[:invoice_items], self)

    @item_repository =
          ItemRepository.new(data[:items], self)

    @merchant_repository =
          MerchantRepository.new(data[:merchants], self)

    @transaction_repository =
          TransactionRepository.new(data[:transactions], self)
  end

  private

  def data
    @data ||=
    {
      customers:     Parser.new("#{file_directory}/customers.csv").values,
      invoices:      Parser.new("#{file_directory}/invoices.csv").values,
      invoice_items: Parser.new("#{file_directory}/invoice_items.csv").values,
      items:         Parser.new("#{file_directory}/items.csv").values,
      merchants:     Parser.new("#{file_directory}/merchants.csv").values,
      transactions:  Parser.new("#{file_directory}/transactions.csv").values,
     }
  end

end
