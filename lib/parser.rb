require 'csv'
require 'pry'

class Parser
  attr_reader :csv_object

  def initialize(file_path)
    @csv_object = CSV.open file_path, headers: true, header_converters: :symbol
  end
end

parsed = Parser.new('./test/fixtures/customers.csv')
binding.pry
