require_relative '03_associatable'
require 'byebug'

# Phase IV
module Associatable
  # Remember to go back to 04_associatable to write ::assoc_options

  # def has_one_through2(name, through_name, source_name)
  #   define_method(name) do
     
  #     through_options = self.class.assoc_options[through_name] #self: cat > human
  #     source_options = through_options.model_class.assoc_options(source_name) # > house
      
  #   end
  # end

  def has_one_through(name, through_name, source_name)
    define_method(name) do
      through_options = self.class.assoc_options[through_name]
      foreign_value = self.attributes[through_options.foreign_key]
      class_name = through_options.class_name
      params = { id: foreign_value }
      through_instance = class_name.constantize.where(params).first

      source_options = through_options.model_class.assoc_options[source_name] 
      foreign_key = source_options.foreign_key
      foreign_key_value = through_instance.attributes[foreign_key]
      class_name = source_options.class_name
      primary_key = source_options.primary_key
      params = { primary_key => foreign_value }
      class_name.constantize.where(params).first
    end
  end
end
