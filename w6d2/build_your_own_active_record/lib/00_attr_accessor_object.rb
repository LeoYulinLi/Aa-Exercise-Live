class AttrAccessorObject
  def self.my_attr_accessor(*names)
    names.each do |name|
      var_name = "@#{name}"
      define_method name do
        instance_variable_get var_name
      end
      define_method "#{name}=".to_sym do |val|
        instance_variable_set var_name, val
      end
    end
  end
end
