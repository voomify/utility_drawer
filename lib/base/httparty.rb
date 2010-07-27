require 'rubygems'
require 'httparty'
require 'yaml'
require 'voomify/config'
require 'extensions/hash'


class ClientBase
  include HTTParty
  include Voomify::Config
  has_site_config "voomify.yml"  
  
private  
  def self.hashes2struct(object, name="Root")
      return case object
      when Hash
        object = object.clone
        object.each do |key, value|
          object[key] = self.hashes2struct(value, key.capitalize)
        end
        object.to_struct(name)
      when Array
        object = object.clone
        object.map! { |i| self.hashes2struct(i) }
      else
        object
      end
  end
end

