require 'date'

class ModelObject
  attr_reader :id, :created_at, :updated_at, :repository

  def initialize(data, repository)
    @id         = data[:id].to_i
    @created_at = Date.parse(data[:created_at])
    @updated_at = Date.parse(data[:updated_at])
    @repository = repository
  end
end
