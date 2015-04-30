class InstanceObject

  attr_reader :id, :created_at, :repository
  attr_accessor :updated_at

  def initialize(data, repository)
    @id         = data[:id].to_i
    @created_at = data[:created_at]
    @updated_at = data[:updated_at]
    @repository = repository
  end

end
