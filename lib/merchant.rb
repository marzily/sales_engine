class Merchant

  attr_reader :id,
              :name,
              :created_at,
              :updated_at,
              :repository

  def initialize(data)
    @id          = data[:id].to_i
    @name        = data[:name]
    @created_at  = data[:created_at]
  end
end