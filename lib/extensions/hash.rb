class Hash
  def to_struct(struct_name)
    Struct.new(struct_name,*keys).new(*values)
  end
end