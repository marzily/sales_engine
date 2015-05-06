require_relative 'test_helper'

class CustomerTest < Minitest::Test
  attr_reader :customer, :customer_from_repo

  def setup
    data = {  id: "1",
              first_name: "Joey",
              last_name: "Ondricka",
              created_at: "2012-03-27 14:54:09 UTC",
              updated_at: "2012-03-27 14:54:09 UTC"
            }
    @customer = Customer.new(data, nil)

    engine = SalesEngine.new('./test/fixtures/')
    engine.startup
    @customer_from_repo = engine.customer_repository.collection.first
  end

  def test_customer_has_a_first_name
    assert_equal 'Joey', customer.first_name
  end

  def test_customer_has_a_last_name
    assert_equal 'Ondricka', customer.last_name
  end

  def test_it_returns_all_invoices_for_customer
    assert_equal 8, customer_from_repo.invoices.count
  end

  def test_it_returns_all_transactions_for_one_customer
    assert customer_from_repo.transactions.all? { |transaction| transaction.is_a?(Transaction)}
    assert_equal 7, customer_from_repo.transactions.count
  end

  def test_it_returns_favorite_merchant
    assert_nil customer_from_repo.favorite_merchant
  end

end
