require './test/test_helper'
require 'csv'

class CustomerRepositoryTest < Minitest::Test

  def setup
    engine = SalesEngine.new('./test/fixtures/')
    engine.startup
    @repo = engine.customer_repository
  end

  def test_it_returns_all_customers
    assert_equal 10, @repo.all.count
    assert_equal "Joey", @repo.all.first.first_name
    assert_equal "Ramona", @repo.all.last.first_name
  end

  def test_it_returns_a_random_customer
    sample = 10.times.map { |i| @repo.random.first_name }
    refute sample.all? { |name| name == sample.first }
  end

  def test_it_finds_a_customer_by_id
    assert_equal "Sylvester", @repo.find_by_id(5).first_name
  end

  def test_it_finds_a_customer_by_first_name
    assert_equal 5, @repo.find_by_first_name("SylVEster").id
  end

  def test_it_finds_a_customer_by_first_name
    assert_equal 5, @repo.find_by_last_name("NaDer").id
  end

  def test_it_finds_a_customer_by_created_at_time_stamp
    assert_equal 1, @repo.find_by_created_at("2012-03-27 14:54:09 UTC").id
  end

  def test_it_finds_a_customer_by_updated_at_time_stamp
    assert_equal 1, @repo.find_by_updated_at("2012-03-27 14:54:09 UTC").id
  end


end
