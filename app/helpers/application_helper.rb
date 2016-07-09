module ApplicationHelper
    
    def avatar_url(user)
      gravatar_id = Digest::MD5.hexdigest(user.email.downcase)
      "http://gravatar.com/avatar/#{gravatar_id}.png?s=48&d=mm"
    end
    
    def instanceName
      return "http://myrese.org"
    end
    
    def instanceUserPath(userref)
      return link_to(userref, instanceName+"/u/"+userref[1..-1])
    end
    
    def getGoodLinks(text)
      sanitize findReplaceUserRef(text).html_safe, :tags => %w(a)
    end
    
    def verifyList(list, value)
      return list.include?value
    end
    
    def findReplaceUserRef(text)
      uall = User.all
      userlist = []
      uall.each do |u|
        userlist << "@"+u.username
      end
      return text.gsub(/[@][a-zA-Z][\w]+/) { |m| verifyList(userlist,m) ? instanceUserPath(m).html_safe : m } 
    end
end
