class Customer
  attr_reader :id, :first_name, :last_name, :repository

  def initialize(data, repository)
    @id = data[:id].to_i
    @first_name = data[:first_name]
    @last_name = data[:last_name]
    @repository = repository
  end

end
