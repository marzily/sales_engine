class Customer

  attr_reader :id, :created_at, :repository
  attr_accessor :first_name, :last_name, :updated_at

  def initialize(data, repository)
    @id         = data[:id].to_i
    @first_name = data[:first_name]
    @last_name  = data[:last_name]
    @created_at = data[:created_at]
    @updated_at = data[:updated_at]
    @repository = repository
  end

end
