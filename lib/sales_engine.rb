require 'csv'
require_relative 'customer'
require_relative 'customer_repository'
require_relative 'parser'

class SalesEngine
  include Parser

  attr_reader :file_directory,
              :customer_repository,
              :invoice_repository

  def initialize(file_directory = nil)
    @file_directory = file_directory
  end

  def startup
    parser         = Parser.new(file_directory)
    customer_data  = parser.parse(file_directory + 'customers.csv')
    invoice_data   = parser.parse(file_directory + 'invoices.csv')
    # './test/fixtures/customers.csv'
    # || './data/'
    @customer_repo = CustomerRepository.new(customer_data, self)
  end
end
