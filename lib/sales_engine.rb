# require 'csv'
# require_relative 'customer_repository'
#
# class SalesEngine
#
#   def startup
#
#   end
#
#   def csv_data(file_name)
#     CSV.open file_name, headers: true, header_converters: :symbol
#   end
#
#   def customer_repository
#     csv_data = csv_data('./test/fixtures/customers.csv')
#     CustomerRepository.new(csv_data)
#   end
#
# end
#
# engine = SalesEngine.new
# engine.startup
# engine.customer_repository
