class AttrAccessorObject
  def self.my_attr_accessor(*names)
    
    names.each do |name|
      define_method(name) do
        self.instance_variable_get("@#{name}")        
      end

      define_method("#{name}=") do |x|
        self.instance_variable_set("@#{name}", x)        
      end
    end
  end
end
