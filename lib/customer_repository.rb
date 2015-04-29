require_relative 'parser'
require_relative 'customer'

class CustomerRepository
  include Parser

  attr_reader :customers_data, :customers, :engine

  def initialize(customers_csv, engine)
    @customers_data = parse(customers_csv)
    @customers      = generate
    @engine         = engine
  end

  def generate
    customers_data.map do |customer_data|
      Customer.new(customer_data, self)
    end
  end

  def all
    customers
  end

  def random
    customers.sample
  end

  def find_by_id(id)
    customers.find { |customer| customer.id == id }
  end

  def find_by_first_name(first_name)
    customers.find { |customer| customer.first_name.downcase == first_name.downcase }
  end

  def find_by_last_name(last_name)
    customers.find { |customer| customer.last_name.downcase == last_name.downcase }
  end

  def find_by_created_at(time_stamp)
    customers.find { |customer| customer.created_at == time_stamp }
  end

  def find_by_updated_at(time_stamp)
    customers.find { |customer| customer.updated_at == time_stamp }
  end

  find_all_by attr

end
