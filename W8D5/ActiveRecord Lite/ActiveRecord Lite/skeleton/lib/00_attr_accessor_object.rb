class AttrAccessorObject
  
  def self.my_attr_accessor(*names)
    names.each do |name|
      #reader
      define_method(name) do
        self.instance_variable_get("@#{name}")
      end
      #writer
      define_method("#{name}=") do |arg|  
        self.instance_variable_set("@#{name}", arg)
      end
    end
  end

end

class Dog < AttrAccessorObject
  my_attr_accessor :name

  def initialize(name)
    @name = name
  end

end

lola = Dog.new('lola')
lola.name