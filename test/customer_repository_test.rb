require './test/test_helper'
require 'csv'
# require 'require_all'
# require_relative 'customers.csv'

class CustomerRepositoryTest < Minitest::Test

  def setup
    # @customer_fixture = CSV.open './test/fixtures/customers.csv', headers: true, header_converters: :symbol
    # @repo = CustomerRepository.new(@customer_fixture)
    engine = SalesEngine.new('./test/fixtures/customers.csv')
    @repo = engine.customer_repository
  end

  def test_it_returns_all_customers
    assert_equal 10, @repo.all.count
    assert_equal 1, @repo.all.first.id
    assert_equal 10, @repo.all.last.id
  end
end
