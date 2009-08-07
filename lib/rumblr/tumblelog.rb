module Rumblr
  
  class Tumblelog < Resource
    attr_reader :name, :timezone, :cname, :title, :url, :avatar_url, :is_primary, 
                :type, :private_id
    attr_accessor :user

    def posts(options={})
      return [] unless self.url
      options.reverse_merge!(:url => self.url)
      log, posts = Client.instance.read(options)
      return posts
    end

    def primary?
      is_primary == "yes"
    end
    
    class << self
      
      def find_by_url(url)
        log, posts = Client.instance.read(:url => url)
        return log
      end
    
    end
    
  end
  
end
