module Voomify
  module Config
    module ClassMethods
      def has_site_config(config_name)
        class_eval <<-STUFF
          @site_config = nil

          def self.site_config
            load_site_config unless @site_config
            @site_config
          end

          def self.load_site_config
              raw_config = File.read("#{Rails.root.to_s}/config/#{config_name}")
              erb_config = ERB.new(raw_config).result
              @site_config = YAML.load(erb_config)[Rails.env]
          end
        STUFF
      end
    end

    def self.included(base)
      base.extend ClassMethods      
    end
    
  end
end