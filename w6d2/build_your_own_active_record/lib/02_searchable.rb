require_relative 'db_connection'
require_relative '01_sql_object'

module Searchable
  # @param [Hash] params
  def where(params)
    cols = params.map { |name, _| "#{name} = ?"}.join(" and ")
    vals = params.values
    DBConnection.execute("SELECT * FROM #{table_name} WHERE #{cols}", *vals).map do |result|
      new(result)
    end
  end
end

class SQLObject
  extend Searchable
end
