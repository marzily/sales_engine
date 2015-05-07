require 'date'

class ModelObject

  attr_reader :id, :created_at, :updated_at, :repository

  def initialize(data, repository)
    @id         = data[:id].to_i
    @created_at = Date.parse(data[:created_at])
    @updated_at = Date.parse(data[:updated_at])
    @repository = repository
    add_self_to_repository
  end

  def add_self_to_repository
    unless repository.nil? || repository.collection.nil?
      repository.collection << self
    end
  end
end
