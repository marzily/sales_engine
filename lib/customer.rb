require_relative 'instance_object'

class Customer < InstanceObject

  attr_reader :repository
  attr_accessor :first_name, :last_name

  def initialize(data, repository)
    super(data)
    @first_name = data[:first_name]
    @last_name  = data[:last_name]
    @repository = repository
  end

end
