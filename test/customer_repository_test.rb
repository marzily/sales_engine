require './test/test_helper'
require 'csv'

class CustomerRepositoryTest < Minitest::Test
  include Parser

  attr_reader :repo

  def setup
    customer_data = parse("./test/fixtures/customers.csv")
    @repo = CustomerRepository.new(customer_data, nil)
  end

  def test_it_finds_first_customer_by_first_name
    assert_equal 5, repo.find_by_first_name("SylVEster").id
  end

  def test_it_finds_first_customer_by_last_name
    assert_equal 5, repo.find_by_last_name("NaDer").id
  end

  def test_it_finds_all_customers_by_first_name
    assert_equal 1, repo.find_all_by_first_name("Parker").count
  end

  def test_it_finds_all_customers_by_last_name
    assert_equal 1, repo.find_all_by_last_name("Reynolds").count
  end
end
