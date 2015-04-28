require 'csv'
require_relative 'customer'
require_relative 'customer_repository'

class SalesEngine
  attr_reader :file_path, :customer_repository

  def initialize(file_directory = nil)
    @file_directory = file_directory
  end

  def startup
    # holds file directory
    parser = Parser.new()
    customer_data = parser.parse(@file_directory+'customers.csv')
    invoice_data = parser.parse('invoices.csv')
    # @csv_object = CSV.open file_path, headers: true, header_converters: :symbol`
    @customer_repo = CustomerRepository.new(customer_data, self)
    @invoice_repo = InvoiceRepository.new(invoice_data, self)

  end

  def csv_headers
    startup.read.headers
  end

  def hash_data_for_instances(row)
    person_data = csv_headers.map do |header|
      [header, row[header]]

    end.to_h

    [:id, 1] , [:first_name, "Mary"]
  end

  def customer_repository
    customer_data = startup.map do |row|
       hash_data_for_instances(row)
    end

  end

end

engine = SalesEngine.new('./test/fixtures/customers.csv')
csv = engine.startup
csv.each do |c|
  p c
end

# p engine.customer_repository.customers.count
