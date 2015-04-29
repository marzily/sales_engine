require 'csv'
require_relative 'customer'
require_relative 'customer_repository'
require_relative 'parser'
require_relative 'invoice_repository'

class SalesEngine
  include Parser
  
  attr_reader :file_directory, 
              :customer_repository,
              :invoice_repository

  def initialize(file_directory = nil)
    @file_directory = file_directory
  end

  def startup
    customer_data  = parse(file_directory + 'customers.csv')
    invoice_data   = parse(file_directory + 'invoices.csv')
    @customer_repo = CustomerRepository.new(customer_data, self)
    @invoice_repository  = InvoiceRepository.new(invoice_data, self)
  end

end

# engine = SalesEngine.new('./test/fixtures/')
# csv = engine.startup
# csv.each do |c|
#   p c
# end