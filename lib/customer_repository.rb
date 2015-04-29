require_relative 'parser'
require_relative 'customer'
require_relative 'repository'

class CustomerRepository < Repository

  def find_by_first_name(first_name)
    find_all_by_first_name(first_name).first
  end

  def find_by_last_name(last_name)
    collection.find { |object| object.last_name.downcase == last_name.downcase }
  end

  def find_all_by_first_name(first_name)
    collection.select { |object| object.first_name.downcase == first_name.downcase }
  end


end


r = CustomerRepository.new('./test/fixtures/customers.csv', nil)
p r.collection
