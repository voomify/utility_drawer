#require 'extensions/hash'
require 'utility_drawer'

describe "Hash" do
  before(:all) do
  end

  it "to_struct should return a Struct" do
    {:my_key=>"somevalue"}.to_struct("SomeStruct")
  end

  it "to_struct should return a without a warning" do
    {:my_key=>"somevalue"}.to_struct("SomeStruct")
  end

  after(:each) do
  end
end
