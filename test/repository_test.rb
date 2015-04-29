require './test/test_helper'
require 'csv'

class RepositoryTest < Minitest::Test
  attr_reader :repo

  include Parser

  def setup
    customer_data = parse("./test/fixtures/customers.csv")
    @repo = CustomerRepository.new(customer_data, nil)
  end

  def test_it_returns_all_customers
    assert_equal 10, repo.all.count
    assert_equal 1, repo.all.first.id
    assert_equal 10, repo.all.last.id
  end

  def test_it_returns_a_random_customer
    sample = 10.times.map { |i| repo.random.first_name }
    refute sample.all? { |name| name == sample.first }
  end

  def test_it_finds_a_customer_by_id
    assert_equal "Sylvester", repo.find_by_id(5).first_name
  end

  def test_it_finds_a_customer_by_created_at_time_stamp
    assert_equal 1, repo.find_by_created_at("2012-03-27 14:54:09 UTC").id
  end

  def test_it_finds_a_customer_by_updated_at_time_stamp
    assert_equal 1, repo.find_by_updated_at("2012-03-27 14:54:09 UTC").id
  end

  def test_it_finds_all_by_created_at_time_stamp
    assert_equal 3, repo.find_all_by_created_at("2012-03-27 14:54:11 UTC").count
  end

  def test_it_finds_all_by_updated_at_time_stamp
    assert_equal 6, repo.find_all_by_updated_at("2012-03-27 14:54:10 UTC").count
  end

  def find_all_by_id
    assert_equal 1, repo.find_all_by_id(7).count
  end
end
