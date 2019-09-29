require_relative 'db_connection'
require 'active_support/inflector'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject
  def self.columns
    return @columns if @columns
    
    cols = DBConnection.execute2(<<-SQL)
      SELECT *
      FROM #{self.table_name}            
    SQL

    puts cols
    # It returns array, so we need to grab just first records
    @columns = cols[0].map(&:to_sym)
  end

  def self.finalize!
    self.columns.each do |column|
      # getter method for each column attributes
      define_method("#{column}") do
        # attributes is a hash, defined in the method called attributes below
        self.attributes[column]        
      end

      # setter method for each column attributes
      define_method("#{column}=") do |val|
        self.attributes[column] = val
      end
      
    end
  end

  def self.table_name=(table_name)
    @table_name = table_name
  end

  # return the table name, modify if its plural, change into snake_case name
  def self.table_name   
    # self name is a class name 
    @table_name || self.name.underscore.pluralize
  end

  def self.all
    DBConnection.execute(<<-SQL)
      SELECT *
      FROM #{table_name}
    SQL
  end

  def self.parse_all(results)
    results.map { |result| self.new(result) }
  end

  def self.find(id)
    # ...
  end

  def initialize(params = {})
    params.each do |column_name, value|      
      column_name_sym = column_name.to_sym      

      if self.class.columns.include?(column_name_sym)
        self.send("#{column_name_sym}=", value)
      else
        raise "unknown attribute '#{column_name_sym}'"
      end
    end
  end

  def attributes
    @attributes ||= {}
  end

  def attribute_values
    # ...
  end

  def insert
    # ...
  end

  def update
    # ...
  end

  def save
    # ...
  end
end
