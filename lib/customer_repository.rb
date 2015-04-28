# require_relative 'customer'

class CustomerRepository
  attr_reader :csv_data, :headers, :customers

  def initialize(csv_data)
    @csv_data   = csv_data
    @headers = csv_data.headers
    @customers  = parse_csv_data
  end

  def parse_csv_data
    csv_data.each.map do |row|
      person_data = headers.length.times.map do |i|
         [headers[i], row[headers[i]]
      end

      # p person_data.to_h
      generate_customer(person_data.to_h)
    end
  end

  def generate_customer(person_data)
    Customer.new(person_data)
  end

  def all
    customers
  end

  def random
    customers.shuffle.first
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
