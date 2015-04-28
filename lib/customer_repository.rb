require_relative 'customer'

class CustomerRepository
  attr_reader :customer_data
  attr_accessor :customers

  def initialize(customer_data)
    @customer_data = customer_data
    @customers = generate
  end

  def generate
    customer_data.map do |person_data|
      Customer.new(person_data, self)
    end
  end

  def all
    customers
  end

  def random
    customers.sample
  end

  def find_by_id(id)
    customers.select { |customer| customer.id == id}
  end
end

# data = { id: 1,
#           first_name: "Joey",
#           last_name: "Ondricka",
#           created_at: "2012-03-27 14:54:09 UTC",
#           updated_at: "2012-03-27 14:54:09 UTC"
  # }
