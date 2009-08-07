module Rumblr
  
  class Tumblelog < Resource
    attr_reader :name, :timezone, :cname, :title, :url, :avatar_url, :is_primary, 
                :type, :private_id
    attr_accessor :user

    def posts
      return [] unless self.url
      log, posts = Client.instance.read({:url => self.url}.merge(self.user.auth))
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
