require_relative 'repository'
require_relative 'customer'

class CustomerRepository < Repository
  attr_reader :model_class

  def initialize(data, engine)
    @model_class = Customer
    super
  end

  def find_by_first_name(first_name)
    find_all_by_first_name(first_name).first
  end

  def find_by_last_name(last_name)
    find_all_by_last_name(last_name).first
  end

  def find_all_by_first_name(first_name)
    collection.select do |object|
      object.first_name.downcase == first_name.downcase
    end
  end

  def find_all_by_last_name(last_name)
    collection.select do |object|
      object.last_name.downcase == last_name.downcase
    end
  end
end
