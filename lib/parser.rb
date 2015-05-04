require 'csv'

class Parser
  def initialize(file_path)
    @file_path = file_path
  end

  def values
    csv = CSV.open(file_path, headers: true, header_converters: :symbol)
    result = csv.map { |row| row.to_h }
    csv.close
    result
  end

  protected

  attr_reader :file_path
end
