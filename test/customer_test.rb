require './test/test_helper'

class CustomerTest < Minitest::Test

  def setup
    data = {  id: "1",
              first_name: "Joey",
              last_name: "Ondricka",
              created_at: "2012-03-27 14:54:09 UTC",
              updated_at: "2012-03-27 14:54:09 UTC"
            }
    @customer = Customer.new(data, nil)
  end

  def test_customer_has_an_id
    assert_equal 1, @customer.id
  end

  def test_customer_has_a_first_name
    assert_equal 'Joey', @customer.first_name
  end

  def test_customer_has_a_last_name
    assert_equal 'Ondricka', @customer.last_name
  end

end
