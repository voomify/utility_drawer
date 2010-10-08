class Rails
  def self.root
      File.dirname(__FILE__)
  end
  def self.env
    "test"
  end
end

require 'utility_drawer'
require 'base/httparty'


class SomeClass < ClientBase
  base_uri "http://localhost:2001"
      def self.find_instance(instance)
        response = self.get('/application_instances/find_instance.xml', :query => {:instance=> instance})
        return nil if response.code != 200
        self.hashes2struct(response["application_instance"])
      end

      def self.find_account_by_alias(account_alias)
        response = self.get('/accounts/find_account_by_alias.xml', :query => {:alias=> account_alias})
        self.hashes2struct(response["account"])
      end
end

describe "base/HttParty" do
  before(:all) do
  end

  # HAL must be running on localhost for this test.  Use the live database
  it "hashes2struct should work with two different XML files as input" do
    instance = SomeClass.find_instance("friand-1")
    instance.name.should == "website"
    account = SomeClass.find_account_by_alias("orders@dancindogg.com")
    account.subdomain.should == 'dancindogg'
  end

  after(:each) do
  end
end
