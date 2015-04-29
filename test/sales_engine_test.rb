require './test/test_helper'
require 'csv'

class SalesEngineTest < Minitest::Test

  def setup
    @engine = SalesEngine.new('./test/fixtures/')
    @engine.startup
  end

  def test_creates_customer_repository
    assert_instance_of CustomerRepository, @engine.customer_repository
  end

  def test_it_loads_customer_repo_dependencies
    assert_equal 10, @engine.customer_repository.all.count
  end

  def test_customer_repository_loads_the_correct_csv_file
    assert_equal "Joey", @engine.customer_repository.find_by_id(1).first_name
  end

end
