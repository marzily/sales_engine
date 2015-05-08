require_relative 'repository'
require_relative 'customer'

class CustomerRepository < Repository
  attr_reader :model_class

  def initialize(data, engine)
    @model_class = Customer
    super
  end

  def find_all_by_first_name(first_name)
    @all_by_first_name ||= hash_repo("first_name.downcase")
    @all_by_first_name[first_name.downcase]
  end

  def find_by_first_name(first_name)
    find_all_by_first_name(first_name).first
  end

  def find_all_by_last_name(last_name)
    @all_by_last_name ||= hash_repo("last_name.downcase")
    @all_by_last_name[last_name.downcase]
  end

  def find_by_last_name(last_name)
    find_all_by_last_name(last_name).first
  end
end
