require './test/test_helper'
require 'csv'

class CustomerRepositoryTest < Minitest::Test

  def setup
    customer_fixture = CSV.open './test/fixtures/customers.csv', headers: true, header_converters: :symbol
    @repo = CustomerRepository.new(customer_fixture)
  end

  def test_it_returns_all_customers
    first_customer = { id: 1,
                      first_name: 'Joey',
                      last_name: 'Ondricka',
                      created_at: '2012-03-27 14:54:09 UTC',
                      updated_at: '2012-03-27 14:54:09 UTC'
                      }
    last_customer = { id: 10,
                      first_name: 'Ramona',
                      last_name: 'Reynolds',
                      created_at: '2012-03-27 14:54:11 UTC',
                      updated_at: '2012-03-27 14:54:11 UTC'
                      }

    assert_equal 10, @repo.all.count
    assert_equal first_customer, @repo.all.first
    assert_equal last_customer, @repo.all.last
  end
end
