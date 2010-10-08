class Hash
  def to_struct(struct_name)
    if Struct.const_defined?(struct_name)
      struct = Struct.const_get(struct_name)
    else
      struct = Struct.new(struct_name,*keys)
    end
    struct.new(*values)
  end
end