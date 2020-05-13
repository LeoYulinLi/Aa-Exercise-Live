require_relative 'db_connection'
require 'active_support/inflector'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject

  extend ActiveSupport::Inflector

  # @return [Array<Symbol>]
  def self.columns
    @columns ||= DBConnection.execute2("SELECT * FROM #{table_name}").first.map(&:to_sym)
    @columns
  end

  def self.finalize!
    columns.each do |column|
      define_method column do
        attributes[column]
      end
      define_method "#{column}=".to_sym do |val|
        attributes[column] = val
      end
    end
  end

  def self.table_name=(table_name)
    @table_name = table_name
  end

  def self.table_name
    @table_name ||= pluralize(underscore(name))
  end

  def self.all
    parse_all(DBConnection.execute("SELECT * FROM #{table_name}"))
  end

  def self.parse_all(results)
    results.map { |row| new(row) }
  end

  def self.find(id)
    result = DBConnection.execute("select * from #{table_name} where id = #{id}").first
    if result
      new(result)
    else
      nil
    end
  end

  def initialize(params = {})
    params.each do |name, value|
      begin
        send("#{name}=".to_sym, value)
      rescue NoMethodError
        raise "unknown attribute '#{name}'"
      end
    end
  end

  def attributes
    @attributes ||= {}
  end

  def attribute_values
    attributes.values
  end

  def insert
    cols = self.class.columns[1..-1].join(", ")
    vals = (["?"] * self.class.columns[1..-1].length).join(", ")
    DBConnection.execute("INSERT INTO #{self.class.table_name} (#{cols}) VALUES (#{vals})", *attribute_values)
    attributes[:id] = DBConnection.last_insert_row_id
  end

  def update
    sets = attributes.map { |name, value| "#{name} = ?" }[1..-1].join(", ")
    DBConnection.execute("UPDATE #{self.class.table_name} SET #{sets} WHERE id = ?", *attribute_values[1..-1], id)
  end

  def save
    if id.nil?
      insert
    else
      update
    end
  end
end
