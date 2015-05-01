class ModelObject

  attr_reader :id, :created_at, :updated_at, :repository

  def initialize(data, repository)
    @id         = data[:id].to_i
    @created_at = data[:created_at]
    @updated_at = data[:updated_at]
    @repository = repository
  end

end
