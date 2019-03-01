require_relative '02_searchable'
require 'active_support/inflector'
require 'byebug'

# Phase IIIa
class AssocOptions
  attr_accessor(
    :foreign_key,
    :class_name,
    :primary_key
  )

  def model_class
    class_name.constantize
  end

  def table_name
    class_name.downcase + 's'
  end
end


class BelongsToOptions < AssocOptions
  def initialize(name, options = {}) #name = :owner
    defaults = {
      foreign_key: (name.to_s.downcase + '_id').to_sym, 
      class_name: name.capitalize.to_s.singularize,
      primary_key: :id
    }
    
    defaults.keys.each do |k| 
      self.send("#{k}=", options[k] || defaults[k])
    end
  end
end

class HasManyOptions < AssocOptions
  def initialize(name, self_class_name, options = {})
    defaults = {
      foreign_key: (self_class_name.to_s.downcase + '_id').to_sym , 
      class_name: name.to_s.capitalize.singularize,
      primary_key: :id
    }

    defaults.keys.each do |k| 
      self.send("#{k}=", options[k] || defaults[k])
    end
  end
end

module Associatable
  # Phase IIIb
  def belongs_to(name, options = {})
    options = BelongsToOptions.new(name, options)

    define_method(name) do
      foreign_key = options.foreign_key
      foreign_value = self.attributes[foreign_key]
      model_class = options.model_class
      params = {id: foreign_value}
      model_class.where(params).first
    end

    assoc_options[name] = options
  end

  def has_many(name, options = {})
    options = HasManyOptions.new(name, self.to_s, options)

    define_method(name) do
      foreign_key = options.foreign_key
      primary_key_val = self.attributes[:id]
      model_class = options.model_class
      params = {foreign_key => primary_key_val}
      model_class.where(params)
    end 
  end

  def assoc_options
    # Wait to implement this in Phase IVa. Modify `belongs_to`, too.
    @options ||= {}
  end
end

class SQLObject
  # Mixin Associatable here...
  extend Associatable
end
