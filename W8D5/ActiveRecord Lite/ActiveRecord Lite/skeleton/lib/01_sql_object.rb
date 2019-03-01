require_relative 'db_connection'
require 'active_support/inflector'
require 'byebug'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject
  def self.columns
    return @columns if @columns
    data = DBConnection.execute2(<<-SQL)
      SELECT
      *
      FROM
      #{self.table_name}
    SQL
    @columns = data.first.map { |str| str.to_sym }
  end

  def self.finalize!

    self.columns.each do |col|

      define_method(col) do
        self.attributes[col]
      end

      define_method("#{col}=") do |arg|
        self.attributes[col] = arg
      end

    end

  end

  def self.table_name=(table_name)
    @table_name = table_name
  end

  def self.table_name
    @table_name ||= self.to_s.tableize
  end

  def self.all
    data = DBConnection.execute(<<-SQL)
      SELECT
      *
      FROM
      #{self.table_name}
    SQL

    self.parse_all(data)
  end

  def self.parse_all(results)
    results.map do |row| 
      self.new(row)
    end
    
  end

  def self.find(id)

    item = DBConnection.execute(<<-SQL, id)
      SELECT
      *
      FROM
      #{self.table_name}
      WHERE
      id = ?
      LIMIT 1
    SQL

    return self.new(*item) if !item.empty?
    nil
  end

  def initialize(params = {})
    params.each do |k, v|
      col = k.to_sym
      if self.class.columns.include?(col)
        self.send("#{col}=", v)
      else
        raise "unknown attribute '#{col}'"
      end
    end
  end

  def attributes
    @attributes ||= {}
  end

  def attribute_values
    @attributes.values
  end

  def insert
    col_names = self.class.columns.drop(1).map(&:to_s).join(",")
    n = self.class.columns.length - 1
    question_marks = ["?"] * n
    question_marks = question_marks.join(",")

    DBConnection.execute(<<-SQL, *attribute_values)
      INSERT INTO 
      #{self.class.table_name} (#{col_names})
      VALUES
      (#{question_marks})
    SQL

    self.id = DBConnection.last_insert_row_id

  end

  def update
    set_attributes = self.class.columns.drop(1).map { |name| name.to_s + " = ?" }.join(",")
    DBConnection.execute(<<-SQL, *attribute_values.drop(1), self.id)
      UPDATE
      #{self.class.table_name}
      SET
      #{set_attributes}
      WHERE
      id = ?
    SQL
  
  end

  def save
    if self.id.nil?
      self.insert
    else
      self.update
    end
  end
end
