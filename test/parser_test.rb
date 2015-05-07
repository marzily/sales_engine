require_relative 'test_helper'

class ParserTest < Minitest::Test
  attr_reader :parse_object

  def setup
    @parse_object = Parser.new('./test/fixtures/customers.csv')
  end

  def test_it_parses_a_csv_file
    data = parse_object.values

    assert_equal 10, data.count
    assert data.all? { |customer_data| customer_data.is_a?(Hash) }
    assert data.all? {|customer_data| customer_data.keys.count == 5 }
  end

end
